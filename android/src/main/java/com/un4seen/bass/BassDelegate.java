package com.un4seen.bass;

import android.os.Handler;
import android.os.Looper;

import com.google.gson.Gson;

import java.math.BigDecimal;
import java.text.NumberFormat;

import androidx.annotation.NonNull;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodCodec;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.common.StandardMethodCodec;
import io.flutter.plugin.common.StringCodec;

//插件方法对照表
class BassDelegate {

    private final static String proSyn = "com.un4seen.bass/eventSYNCPROC";


    static final String Init = "init";
    static final String BASS_ChannelPlay = "BASS_ChannelPlay";
    static final String BASS_StreamCreateFile = "BASS_StreamCreateFile";
    static final String BASS_StreamFree = "BASS_StreamFree";
    static final String BASS_Mixer_StreamCreate = "BASS_Mixer_StreamCreate";
    static final String BASS_ChannelGetInfo = "BASS_ChannelGetInfo";
    static final String BASS_Mixer_StreamAddChannel = "BASS_Mixer_StreamAddChannel";
    static final String BASS_ChannelSetAttribute = "BASS_ChannelSetAttribute";
    static final String BASS_ChannelGetPosition = "BASS_ChannelGetPosition";
    static final String BASS_ChannelSetPosition = "BASS_ChannelSetPosition";
    static final String BASS_ChannelGetLength = "BASS_ChannelGetLength";
    static final String BASS_ChannelBytes2Seconds = "BASS_ChannelBytes2Seconds";
    static final String BASS_ChannelSeconds2Bytes = "BASS_ChannelSeconds2Bytes";
    static final String BASS_ChannelPause = "BASS_ChannelPause";
    static final String BASS_ChannelStop = "BASS_ChannelStop";
    static final String BASS_ChannelIsActive = "BASS_ChannelIsActive";


    static final String BASS_ChannelSetSync = "BASS_ChannelSetSync";

    {
        NumberFormat nf = NumberFormat.getInstance();
        nf.setGroupingUsed(false);// 不用科学计数
    }

    static void handleMethod(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        switch (call.method) {
            case BassDelegate.Init:
                BassDelegate.init(call, result);
                break;
            case BassDelegate.BASS_ChannelPlay:
                BassDelegate.BASS_ChannelPlay(call, result);
                break;
            case BassDelegate.BASS_ChannelPause:
                BassDelegate.BASS_ChannelPause(call, result);
                break;
            case BassDelegate.BASS_ChannelStop:
                BassDelegate.BASS_ChannelStop(call, result);
                break;
            case BassDelegate.BASS_ChannelIsActive:
                BassDelegate.BASS_ChannelIsActive(call, result);
                break;
            case BassDelegate.BASS_ChannelSetSync:
                BassDelegate.BASS_ChannelSetSync(call, result);
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
            case BassDelegate.BASS_ChannelGetPosition:
                BassDelegate.BASS_ChannelGetPosition(call, result);
                break;
            case BassDelegate.BASS_ChannelSetPosition:
                BassDelegate.BASS_ChannelSetPosition(call, result);
                break;

            case BassDelegate.BASS_ChannelGetLength:
                BassDelegate.BASS_ChannelGetLength(call, result);
                break;
            case BassDelegate.BASS_ChannelBytes2Seconds:
                BassDelegate.BASS_ChannelBytes2Seconds(call, result);
                break;
            case BassDelegate.BASS_ChannelSeconds2Bytes:
                BassDelegate.BASS_ChannelSeconds2Bytes(call, result);
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


    private static void BASS_ChannelPause(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        int handle = call.argument("handle");
        boolean isplay = BASS.BASS_ChannelPause(handle);
        result.success(isplay);
    }

    private static void BASS_ChannelStop(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        int handle = call.argument("handle");
        boolean isplay = BASS.BASS_ChannelStop(handle);
        result.success(isplay);
    }

    private static void BASS_ChannelIsActive(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        int handle = call.argument("handle");
        int isActive = BASS.BASS_ChannelIsActive(handle);
        result.success(isActive);
    }

    private static void BASS_ChannelSetSync(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        final BasicMessageChannel<String> messageChannel = new BasicMessageChannel<>(BassPlugin.binaryMessenger, proSyn, StringCodec.INSTANCE);
        int handle = call.argument("handle");
        int type = call.argument("type");
        long param = Long.valueOf(call.argument("param").toString());

        final Handler handler = new Handler(Looper.getMainLooper());
        BASS.BASS_ChannelSetSync(handle, type, param, new BASS.SYNCPROC() {

            @Override
            public void SYNCPROC(int handle, int channel, int data, Object user) {
                SYNCPROCINFO syncprocinfo = new SYNCPROCINFO(handle, channel, data);
                final String json = new Gson().toJson(syncprocinfo);
                handler.post(new Runnable() {
                    @Override
                    public void run() {
                        messageChannel.send(json);
                    }
                });

            }
        }, 0);

    }


    private static void BASS_StreamFree(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        int handle = call.argument("handle");
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

    public static void BASS_ChannelSetAttribute(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        int handle = call.argument("handle");
        int attrib = call.argument("attrib");
        float value = Float.valueOf(call.argument("value").toString());
        boolean b = BASS.BASS_ChannelSetAttribute(handle, attrib, value);
        result.success(b);
    }

    public static void BASS_ChannelGetPosition(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        int handle = call.argument("handle");
        int mode = call.argument("mode");
        long b = BASS.BASS_ChannelGetPosition(handle, mode);
        result.success(b);
    }

    public static void BASS_ChannelSetPosition(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        int handle = call.argument("handle");

        BigDecimal bd = new BigDecimal(call.argument("pos").toString());
        int mode = call.argument("mode");
        boolean b = BASS.BASS_ChannelSetPosition(handle, bd.longValueExact(), mode);
        result.success(b);
    }

    public static void BASS_ChannelGetLength(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        int handle = call.argument("handle");
        int mode = call.argument("mode");
        long b = BASS.BASS_ChannelGetLength(handle, mode);
        result.success(b);
    }

    public static void BASS_ChannelBytes2Seconds(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        int handle = call.argument("handle");
        long pos = Long.parseLong(call.argument("pos").toString());
        double b = BASS.BASS_ChannelBytes2Seconds(handle, pos);
        result.success(b);
    }

    public static void BASS_ChannelSeconds2Bytes(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
        int handle = call.argument("handle");
        double pos = Double.parseDouble(call.argument("pos").toString());
        double b = BASS.BASS_ChannelSeconds2Bytes(handle, pos);
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

    public static class SYNCPROCINFO {
        public int handle;
        public int channel;
        public int data;

        public SYNCPROCINFO(int handle, int channel, int data) {
            this.handle = handle;
            this.channel = channel;
            this.data = data;
        }

    }
}
