import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:bass/Bass.dart';
import 'package:bass/core/BASS.dart';
import 'package:bass/core/info/all.dart';

class MixerPage extends StatefulWidget {
  @override
  _MixerPageState createState() => _MixerPageState();
}

class Muss {
  String path;
  num vol = 1.0; // 默认1
  int handle;

  //播放进度
  double pos =0;

  //文件总长度
  double totoalSeconds =0;

}

class _MixerPageState extends State<MixerPage> {
  List<Muss> paths = [];
  int mixer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initBass();
  }
  var _timerPeriodic;
  void initBass() async {
    var init = await Bass.init();
    print("bass 初始化 $init");
    
     _timerPeriodic = new Timer.periodic(Duration(milliseconds: 500), (Timer timer){
       for(var item in paths){
         handlePlayProgress(item);
       }
    });
    
  }

  void handlePlayProgress(Muss muss) async{
    num tick = await Bass.BASS_ChannelGetPosition(muss.handle,BASS.BASS_POS_BYTE);
    double   current=  await Bass.BASS_ChannelBytes2Seconds(muss.handle,tick);
    muss.pos = current;
    setState(() {

    });
  }

  void addVol(int index) async {
    paths[index].vol = paths[index].vol + 0.1;
    Bass.BASS_ChannelSetAttribute(
        paths[index].handle, BASS.BASS_ATTRIB_VOL, paths[index].vol);
    setState(() {
    });
  }

  void decreaseVal(int index) async {
    if(paths[index].vol == 0){
      return;
    }
    paths[index].vol = paths[index].vol - 0.1;
    Bass.BASS_ChannelSetAttribute(
        paths[index].handle, BASS.BASS_ATTRIB_VOL, paths[index].vol);
    setState(() {});
  }

  void play() async {
      var chan1 = paths[0].handle;
      BASS_CHANNELINFO data = await Bass.BASS_ChannelGetInfo(chan1);
      mixer = await Bass.BASS_Mixer_StreamCreate(
          chans: data.chans, freq: data.freq);
      for (var item in paths) {
        Bass.BASS_Mixer_StreamAddChannel(mixer, item.handle);
      }
      Bass.BASS_ChannelPlay(mixer);
  }

  void chooseFile() async {
    File file = await FilePicker.getFile();
    if (file == null) return;
    var path = file.path;
    var chan = await Bass.BASS_StreamCreateFile(path);
    num length = await Bass.BASS_ChannelGetLength(chan,BASS.BASS_POS_BYTE);
    num totoalSeconds = await Bass.BASS_ChannelBytes2Seconds(chan,length);
    var muss = new Muss();
    muss.path = path;
    muss.handle = chan;
    muss.totoalSeconds = totoalSeconds;
    paths.add(muss);
    setState(() {});
  }

  void setPosition(int index,double pos) async{

    paths[index].pos = pos;
    setState(() {});

    num bass_channelSeconds2Bytes = await Bass.BASS_ChannelSeconds2Bytes(paths[index].handle,pos);
    await Bass.BASS_ChannelSetPosition(paths[index].handle, bass_channelSeconds2Bytes,BASS.BASS_POS_BYTE);



  }

  void removeFile(int index) async {
    await Bass.BASS_StreamFree(paths[index].handle);
    paths.removeAt(index);
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

          Text(
            "删除channel后声音能够正常删除，如果在播放后继续添加channel，需要重新调用channelPlay方法",
            style: TextStyle(fontSize: 18,color: Colors.red),
          ),
          liner(),
          Expanded(
              child: ListView.builder(
                  itemCount: paths.length,
                  padding: new EdgeInsets.all(5.0),
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        new Text("第${index + 1}首:${paths[index].path}"),
                        Row(
                          children: <Widget>[
                            RaisedButton(
                              onPressed: () {
                                removeFile(index);
                              },
                              child: Text("删除"),
                            ),
                            RaisedButton(
                              onPressed: () {
                                addVol(index);
                              },
                              child: Text("添加音量"),
                            ),
                            RaisedButton(
                              onPressed: () {
                                decreaseVal(index);
                              },
                              child: Text("减少音量"),
                            ),
                            Text("当前音量${paths[index].vol.toStringAsFixed(1)}")
                          ],
                        ),

                        Row(
                          children: <Widget>[
                            Slider(
                              value: paths[index].pos,
                              onChanged: (v) {


                                print("pos = $v");
                                setPosition(index,v);
                              },
                              max: paths[index].totoalSeconds,
                              min: 0,
                            ),
                            Text("${paths[index].pos.toStringAsFixed(0)}/"),
                            Text("${paths[index].totoalSeconds.toStringAsFixed(0)}s")
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
