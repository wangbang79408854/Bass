#import "BassPlugin.h"
#import "bass.h"
#import "bassmix.h"
#import "bassenc_mp3.h"
static BassPlugin *selfClass =nil;
@interface BassPlugin ()
@property (nonatomic, strong) FlutterBasicMessageChannel *channel;
@end
@implementation BassPlugin


+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"bass"
                                     binaryMessenger:[registrar messenger]];
    FlutterBasicMessageChannel *basicChannel = [FlutterBasicMessageChannel messageChannelWithName:@"com.un4seen.bass/eventSYNCPROC" binaryMessenger:[registrar messenger]];
    BassPlugin* instance = [[BassPlugin alloc] init];
    instance.channel = basicChannel;
    [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    selfClass = self;
    if ([@"getPlatformVersion" isEqualToString:call.method]) {
        result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
    } else if ([@"init" isEqualToString:call.method]) {
        [self initBassMethodCall:call result:result];
    } else if ([@"BASS_ChannelPlay" isEqualToString:call.method]) {
        [self bassChannelPlay:call result:result];
    } else if ([@"BASS_StreamCreateFile" isEqualToString:call.method]) {
        [self bassStreamCreateFile:call result:result];
    } else if ([@"BASS_Mixer_StreamCreate" isEqualToString:call.method]) {
        [self bassMixerStreamCreate:call result:result];
    } else if ([@"BASS_ChannelGetInfo" isEqualToString:call.method]) {
        [self bassChannelGetInfo:call result:result];
    } else if ([@"BASS_Mixer_StreamAddChannel" isEqualToString:call.method]) {
        [self bassMixerStreamAddChannel:call result:result];
    } else if ([@"BASS_ChannelSetAttribute" isEqualToString:call.method]) {
        [self bassChannelSetAttribute:call result:result];
    } else if ([@"BASS_ChannelGetPosition" isEqualToString:call.method]) {
        [self bassChannelGetPosition:call result:result];
    } else if ([@"BASS_ChannelSetPosition" isEqualToString:call.method]) {
        [self bassChannelSetPosition:call result:result];
    } else if ([@"BASS_ChannelGetLength" isEqualToString:call.method]) {
        [self bassChannelGetLength:call result:result];
    } else if ([@"BASS_ChannelBytes2Seconds" isEqualToString:call.method]) {
        [self bassChannelBytes2Seconds:call result:result];
    } else if ([@"BASS_ChannelSeconds2Bytes" isEqualToString:call.method]) {
        [self bassChannelSeconds2Bytes:call result:result];
    } else if ([@"BASS_ChannelPause" isEqualToString:call.method]) {
        [self bassChannelPause:call result:result];
    } else if ([@"BASS_ChannelStop" isEqualToString:call.method]) {
        [self bassChannelStop:call result:result];
    } else if ([@"BASS_ChannelIsActive" isEqualToString:call.method]) {
        [self bassChannelIsActive:call result:result];
    } else if ([@"BASS_StreamFree" isEqualToString:call.method]) {
        [self bassStreamFree:call result:result];
    } else if ([@"BASS_ChannelSetSync" isEqualToString:call.method]) {
        [self bassChannelSetSync:call result:result];
    }  else {
        result(FlutterMethodNotImplemented);
    }
   
}

- (void)initBassMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
    int device = [[call.arguments objectForKey:@"device"] intValue];
    int freq = [[call.arguments objectForKey:@"freq"] intValue];
    int flags = [[call.arguments objectForKey:@"flags"] intValue];
    
    bool isInit = BASS_Init(device, freq, flags, NULL, NULL);
    result([NSNumber numberWithBool:isInit]);
}

- (void)bassChannelPlay:(FlutterMethodCall *)call result:(FlutterResult)result {
    int chan = [[call.arguments objectForKey:@"chan"] intValue];
    bool isRestart = [[call.arguments objectForKey:@"isRestart"] boolValue];

    bool isplay = BASS_ChannelPlay(chan, isRestart);
    result([NSNumber numberWithBool:isplay]);
}

- (void)bassStreamCreateFile:(FlutterMethodCall *)call result:(FlutterResult)result {
    NSString *filePath = [call.arguments objectForKey:@"filePath"];
    const char *cfilePath = [filePath UTF8String];
    int streamCreateFile = BASS_StreamCreateFile(FALSE, cfilePath, 0, 0, BASS_STREAM_DECODE);

    result([NSNumber numberWithInt:streamCreateFile]);
}

- (void)bassMixerStreamCreate:(FlutterMethodCall *)call result:(FlutterResult)result {
    int chans = [[call.arguments objectForKey:@"chans"] intValue];
    int freq = [[call.arguments objectForKey:@"freq"] intValue];
    int flags = [[call.arguments objectForKey:@"flags"] intValue];

    int mixer = BASS_Mixer_StreamCreate(freq,chans,flags);
    result([NSNumber numberWithInt:mixer]);
}

- (void)bassChannelSetAttribute:(FlutterMethodCall *)call result:(FlutterResult)result {
    int handle = [[call.arguments objectForKey:@"handle"] intValue];
    int attrib = [[call.arguments objectForKey:@"attrib"] intValue];
    int value = [[call.arguments objectForKey:@"value"] intValue];
    
    bool isOk = BASS_ChannelSetAttribute(handle, attrib, value);

    result([NSNumber numberWithBool:isOk]);
}

- (void)bassChannelGetPosition:(FlutterMethodCall *)call result:(FlutterResult)result {
    int handle = [[call.arguments objectForKey:@"handle"] intValue];
    int mode = [[call.arguments objectForKey:@"mode"] intValue];
    long b = BASS_ChannelGetPosition(handle,mode);
    
    result([NSNumber numberWithLong:b]);
}

- (void)bassChannelSetPosition:(FlutterMethodCall *)call result:(FlutterResult)result {
    int handle = [[call.arguments objectForKey:@"handle"] intValue];
    int mode = [[call.arguments objectForKey:@"mode"] intValue];
    long bd = [[call.arguments objectForKey:@"pos"] longValue];

    bool b = BASS_ChannelSetPosition(handle, bd, mode);
    result([NSNumber numberWithBool:b]);
}

- (void)bassChannelGetLength:(FlutterMethodCall *)call result:(FlutterResult)result {
    int handle = [[call.arguments objectForKey:@"handle"] intValue];
    int mode = [[call.arguments objectForKey:@"mode"] intValue];
    long b = BASS_ChannelGetLength(handle,mode);
    result([NSNumber numberWithLong:b]);
}

- (void)bassChannelBytes2Seconds:(FlutterMethodCall *)call result:(FlutterResult)result {
    int handle = [[call.arguments objectForKey:@"handle"] intValue];
    long pos = [[call.arguments objectForKey:@"pos"] longValue];
    
    double b = BASS_ChannelBytes2Seconds(handle,pos);
    result([NSNumber numberWithDouble:b]);
}

- (void)bassChannelSeconds2Bytes:(FlutterMethodCall *)call result:(FlutterResult)result {
    int handle = [[call.arguments objectForKey:@"handle"] intValue];
    double pos = [[call.arguments objectForKey:@"pos"] doubleValue];
    
    double b = BASS_ChannelSeconds2Bytes(handle, pos);
    result([NSNumber numberWithDouble:b]);
}

- (void)bassChannelPause:(FlutterMethodCall *)call result:(FlutterResult)result {
    int handle = [[call.arguments objectForKey:@"handle"] intValue];
    
    bool isPlay = BASS_ChannelPause(handle);
    result([NSNumber numberWithBool:isPlay]);
}

- (void)bassChannelStop:(FlutterMethodCall *)call result:(FlutterResult)result {
    int handle = [[call.arguments objectForKey:@"handle"] intValue];
    
    bool isPlay = BASS_ChannelStop(handle);
    result([NSNumber numberWithBool:isPlay]);
}

- (void)bassChannelIsActive:(FlutterMethodCall *)call result:(FlutterResult)result {
    int handle = [[call.arguments objectForKey:@"handle"] intValue];
    
    int isActive = BASS_ChannelIsActive(handle);
    result([NSNumber numberWithInt:isActive]);
}

- (void)bassStreamFree:(FlutterMethodCall *)call result:(FlutterResult)result {
    int handle = [[call.arguments objectForKey:@"handle"] intValue];
    
    bool b = BASS_StreamFree(handle);
    result([NSNumber numberWithBool:b]);
}

- (void)bassChannelSetSync:(FlutterMethodCall *)call result:(FlutterResult)result {
    int handle = [[call.arguments objectForKey:@"handle"] intValue];
    int type = [[call.arguments objectForKey:@"type"] intValue];
    long param = [[call.arguments objectForKey:@"param"] longValue];

    BASS_ChannelSetSync(handle, type, param, MySyncProc, 0);
}

void CALLBACK MySyncProc(HSYNC handle, DWORD channel, DWORD data, void *user) {
    NSDictionary *handleInfo = @{@"handle":[NSNumber numberWithInt:handle],
                                 @"channel":[NSNumber numberWithInt:channel],
                                 @"data":[NSNumber numberWithInt:data],
                                 };
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:handleInfo options:NSJSONWritingPrettyPrinted error:nil];
    NSString *strJson = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];

    [selfClass sendMsg:strJson];
}

- (void)sendMsg:(NSString *)message {
    [self.channel sendMessage:message];
}

- (void)bassChannelGetInfo:(FlutterMethodCall *)call result:(FlutterResult)result {
    int handle = [[call.arguments objectForKey:@"handle"] intValue];
    BASS_CHANNELINFO ci;
    BASS_ChannelGetInfo(handle, &ci); // get sample format info
    NSDictionary *handleInfo = @{@"chans":[NSNumber numberWithInt:ci.chans],
                                 @"ctype":[NSNumber numberWithInt:ci.ctype],
                                 @"ctype":[NSString stringWithUTF8String:ci.filename],
                                 @"flags":[NSNumber numberWithInt:ci.flags],
                                 @"freq":[NSNumber numberWithInt:ci.freq],
                                 @"origres":[NSNumber numberWithInt:ci.origres],
                                 @"plugin":[NSNumber numberWithInt:ci.plugin],
                                 @"sample":[NSNumber numberWithInt:ci.sample],
                                 };
    result([self gs_jsonStringPrettyPrintedFormatForDictionary:handleInfo]);
}

- (void)bassMixerStreamAddChannel:(FlutterMethodCall *)call result:(FlutterResult)result {
    int handle = [[call.arguments objectForKey:@"handle"] intValue];
    int chan = [[call.arguments objectForKey:@"chan"] intValue];

    bool b = BASS_Mixer_StreamAddChannel(handle, chan, BASS_MIXER_NORAMPIN);
    result([NSNumber numberWithBool:b]);
}

- (NSString *)gs_jsonStringPrettyPrintedFormatForDictionary:(NSDictionary *)dicJson {
    if (![dicJson isKindOfClass:[NSDictionary class]] || ![NSJSONSerialization isValidJSONObject:dicJson]) {
        return nil;
    }
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dicJson options:NSJSONWritingPrettyPrinted error:nil];
    
    NSString *strJson = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    return strJson;
}
@end
