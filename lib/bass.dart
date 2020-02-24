import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

import 'core/BASSmix.dart';
import 'core/info/all.dart';

class Bass {
  static const MethodChannel _channel = const MethodChannel('bass');

  static int defaultFreq = 44100;

  //Bass 初始化入口
  static Future<bool> init({int device, int freq, int flags}) async {
    if (device == null) device = -1;
    if (freq == null) freq = defaultFreq;
    if (flags == null) flags = 0;
    var params = {"device": device, "freq": freq, "flags": flags};
    return await _channel.invokeMethod('init', params);
  }

  static Future<bool> BASS_ChannelPlay(int chan,
      {bool isRestart = false}) async {
    var params = {"chan": chan, "isRestart": isRestart};
    return await _channel.invokeMethod('BASS_ChannelPlay', params);
  }

  static Future<int> BASS_StreamCreateFile(String filePath) async {
    var params = {"filePath": filePath};
    return await _channel.invokeMethod('BASS_StreamCreateFile', params);
  }

  static Future<bool> BASS_StreamFree(int handle) async {
    var params = {"handle": handle};
    return await _channel.invokeMethod('BASS_StreamFree', params);
  }

  static Future<BASS_CHANNELINFO> BASS_ChannelGetInfo(int handle) async {
    var params = {"handle": handle};
    String json = await _channel.invokeMethod('BASS_ChannelGetInfo', params);
    var jsonDecoder = new JsonDecoder().convert(json);
    var bass_channelinfo = BASS_CHANNELINFO.fromJson(jsonDecoder);
    return bass_channelinfo;
  }

  static Future<bool> BASS_ChannelSetAttribute(
      int handle, int attrib, num value) async {
    var params = {"handle": handle, "attrib": attrib, "value": value};
    return await _channel.invokeMethod('BASS_ChannelSetAttribute', params);
  }


  static Future<num> BASS_ChannelGetLength(int handle, int mode) async{
    var params = {"handle": handle, "mode": mode};
    return await _channel.invokeMethod('BASS_ChannelGetLength', params);
  }

  static Future<double> BASS_ChannelBytes2Seconds(int handle, num pos) async{
    var params = {"handle": handle, "pos": pos};
    return await _channel.invokeMethod('BASS_ChannelBytes2Seconds', params);
  }

  static Future<double> BASS_ChannelSeconds2Bytes(int handle,num pos) async{
    var params = {"handle": handle, "pos": pos};
    return await _channel.invokeMethod('BASS_ChannelSeconds2Bytes', params);
  }


  static Future<num> BASS_ChannelGetPosition(int handle, int mode) async {
    var params = {"handle": handle, "mode": mode};
    return await _channel.invokeMethod('BASS_ChannelGetPosition', params);
  }

  static Future<bool> BASS_ChannelSetPosition(int handle, num pos, int mode) async{
    var params = {"handle": handle,"pos":pos, "mode": mode};
    return await _channel.invokeMethod('BASS_ChannelSetPosition', params);
  }


  //mixer create Stream
  static Future<int> BASS_Mixer_StreamCreate(
      {int freq, int chans, int flags}) async {
    int defaultFlag = BASSmix.BASS_MIXER_END;

    var params = {
      "freq": freq == null ? defaultFreq : freq,
      "chans": chans == null ? -1 : chans,
      "flags": flags == null ? defaultFlag : flags
    };

    final int mixer =
        await _channel.invokeMethod('BASS_Mixer_StreamCreate', params);
    return mixer;
  }

  static Future<bool> BASS_Mixer_StreamAddChannel(int handle, int chan) async {
    var params = {
      "handle": handle,
      "chan": chan,
      "flags": BASSmix.BASS_MIXER_NORAMPIN,
    };
    return await _channel.invokeMethod('BASS_Mixer_StreamAddChannel', params);
  }
}
