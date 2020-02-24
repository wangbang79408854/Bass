// Channel info structure
class BASS_CHANNELINFO {
  int chans;
  int ctype;
  String filename;
  int flags;
  int freq;
  int origres;
  int plugin;
  int sample;

  BASS_CHANNELINFO(
      {this.chans,
        this.ctype,
        this.filename,
        this.flags,
        this.freq,
        this.origres,
        this.plugin,
        this.sample});

  BASS_CHANNELINFO.fromJson(Map<String, dynamic> json) {
    chans = json['chans'];
    ctype = json['ctype'];
    filename = json['filename'];
    flags = json['flags'];
    freq = json['freq'];
    origres = json['origres'];
    plugin = json['plugin'];
    sample = json['sample'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chans'] = this.chans;
    data['ctype'] = this.ctype;
    data['filename'] = this.filename;
    data['flags'] = this.flags;
    data['freq'] = this.freq;
    data['origres'] = this.origres;
    data['plugin'] = this.plugin;
    data['sample'] = this.sample;
    return data;
  }
}