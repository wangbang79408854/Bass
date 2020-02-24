import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:bass/Bass.dart';
import 'package:bass/core/info/all.dart';

class MixerPage extends StatefulWidget {
  @override
  _MixerPageState createState() => _MixerPageState();
}

class _MixerPageState extends State<MixerPage> {
  List<String> paths = [];
  int mixer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initBass();
  }

  void initBass() async {
    var init = await Bass.init();
    print("bass 初始化 $init");
  }

  void play() async {
    if (paths.length >= 2) {
      num chan1 = await Bass.BASS_StreamCreateFile(paths[0]);
      num chan2 = await Bass.BASS_StreamCreateFile(paths[1]);
      BASS_CHANNELINFO data = await Bass.BASS_ChannelGetInfo(chan1);
      mixer = await Bass.BASS_Mixer_StreamCreate(
          chans: data.chans, freq: data.freq);
      Bass.BASS_Mixer_StreamAddChannel(mixer, chan1);
      Bass.BASS_Mixer_StreamAddChannel(mixer, chan2);
      Bass.BASS_ChannelPlay(mixer);
    }
  }

  void chooseFile() async {
    File file = await FilePicker.getFile();
    var path = file.path;
    paths.add(path);
    setState(() {});
  }

  Widget liner() {
    return SizedBox(
      height: 10,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MixerSample"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              RaisedButton(
                onPressed: chooseFile,
                child: Text("choose mixfile"),
              ),
              SizedBox(
                width: 5.0,
              ),
              RaisedButton(
                onPressed: play,
                child: Text("播放"),
              ),
              SizedBox(
                width: 5.0,
              ),
              RaisedButton(
                onPressed: play,
                child: Text("暂停"),
              ),
            ],
          ),
          liner(),
          Text(
            "待合成的音乐",
            style: TextStyle(fontSize: 18),
          ),
          liner(),
          Expanded(
              child: ListView.builder(
                  itemCount: paths.length,
                  padding: new EdgeInsets.all(5.0),
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        new Text("第${index + 1}首:${paths[index]}"),
                        Row(
                          children: <Widget>[
                            RaisedButton(
                              onPressed: () {
                                paths.removeAt(index);
                                setState(() {});
                              },
                              child: Text("删除"),
                            ),
                            RaisedButton(
                              onPressed: () {},
                              child: Text("添加音量"),
                            ),
                            RaisedButton(
                              onPressed: () {},
                              child: Text("减少音量"),
                            ),
                          ],
                        )
                      ],
                    );
                  }))
        ],
      ),
    );
  }
}
