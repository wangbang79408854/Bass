package com.un4seen.bass;

import com.google.gson.Gson;

import androidx.annotation.NonNull;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

//插件方法对照表
class BassDelegate {

    static final String Init = "init";
    static final String BASS_ChannelPlay = "BASS_ChannelPlay";
    static final String BASS_StreamCreateFile = "BASS_StreamCreateFile";
    static final String BASS_StreamFree = "BASS_StreamFree";
    static final String BASS_Mixer_StreamCreate = "BASS_Mixer_StreamCreate";
    static final String BASS_ChannelGetInfo = "BASS_ChannelGetInfo";
    static final String BASS_Mixer_StreamAddChannel = "BASS_Mixer_StreamAddChannel";
    static final String BASS_ChannelSetAttribute = "BASS_ChannelSetAttribute";

    static void handleMethod(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        switch (call.method) {
            case BassDelegate.Init:
                BassDelegate.init(call, result);
                break;
            case BassDelegate.BASS_ChannelPlay:
                BassDelegate.BASS_ChannelPlay(call, result);
                break;
            case BassDelegate.BASS_StreamCreateFile:
                BassDelegate.BASS_StreamCreateFile(call, result);
                break;
            case BassDelegate.BASS_StreamFree:
                BassDelegate.BASS_StreamFree(call, result);
                break;
            case BassDelegate.BASS_ChannelSetAttribute:
                BassDelegate.BASS_ChannelSetAttribute(call, result);
                break;
            case BassDelegate.BASS_ChannelGetInfo:
                BassDelegate.BASS_ChannelGetInfo(call, result);
                break;
            case BassDelegate.BASS_Mixer_StreamCreate:
                BassDelegate.BASS_Mixer_StreamCreate(call, result);
                break;
            case BassDelegate.BASS_Mixer_StreamAddChannel:
                BassDelegate.BASS_Mixer_StreamAddChannel(call, result);
                break;

            default:
                result.notImplemented();
                break;
        }


    }


    private static void init(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        int device_id = call.argument("device");
        int freq = call.argument("freq");
        int flags = call.argument("flags");
        boolean isInit = BASS.BASS_Init(device_id, freq, flags);
        result.success(isInit);
    }

    private static void BASS_ChannelPlay(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        int chan = call.argument("chan");
        boolean isRestart = call.argument("isRestart");
        boolean isplay = BASS.BASS_ChannelPlay(chan, isRestart);
        result.success(isplay);
    }


    private static void BASS_StreamFree(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        int  handle = call.argument("handle");
        boolean b = BASS.BASS_StreamFree(handle);
        result.success(b);
    }


    private static void BASS_StreamCreateFile(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        String filePath = call.argument("filePath");
        int streamCreateFile = BASS.BASS_StreamCreateFile(filePath, 0, 0, BASS.BASS_STREAM_DECODE);
        result.success(streamCreateFile);
    }

    private static void BASS_Mixer_StreamCreate(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        int freq = call.argument("freq");
        int chans = call.argument("chans");
        int flags = call.argument("flags");
//        int mixer = BASSmix.BASS_Mixer_StreamCreate(freq, chans, BASS.BASS_STREAM_DECODE | BASSmix.BASS_MIXER_END);
        int mixer = BASSmix.BASS_Mixer_StreamCreate(freq, chans, flags);
        result.success(mixer);
    }

    public static void BASS_ChannelSetAttribute(@NonNull MethodCall call, @NonNull MethodChannel.Result result){
        int handle = call.argument("handle");
        int attrib = call.argument("attrib");
        float value = Float.valueOf(call.argument("value").toString());
        boolean b = BASS.BASS_ChannelSetAttribute(handle, attrib, value);
        result.success(b);
    }
    private static void BASS_ChannelGetInfo(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        int handle = call.argument("handle");
        BASS.BASS_CHANNELINFO info = new BASS.BASS_CHANNELINFO();
        boolean b = BASS.BASS_ChannelGetInfo(handle, info);
        String toJson = new Gson().toJson(info);
        result.success(toJson);
    }

    private static void BASS_Mixer_StreamAddChannel(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        int handle = call.argument("handle");
        int chan = call.argument("chan");
        boolean b = BASSmix.BASS_Mixer_StreamAddChannel(handle, chan, BASSmix.BASS_MIXER_NORAMPIN);
        result.success(b);
    }
}
