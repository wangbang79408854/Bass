class BASSmix {
  // additional BASS_SetConfig option
  static final int BASS_CONFIG_MIXER_BUFFER = 0x10601;
  static final int BASS_CONFIG_MIXER_POSEX = 0x10602;
  static final int BASS_CONFIG_SPLIT_BUFFER = 0x10610;

  // BASS_Mixer_StreamCreate flags
  static final int BASS_MIXER_END = 0x10000; // end the stream when there are no sources
  static final int BASS_MIXER_NONSTOP = 0x20000; // don't stall when there are no sources
  static final int BASS_MIXER_RESUME = 0x1000; // resume stalled immediately upon new/unpaused source
  static final int BASS_MIXER_POSEX = 0x2000; // enable BASS_Mixer_ChannelGetPositionEx support

  // source flags
  static final int BASS_MIXER_BUFFER = 0x2000; // buffer data for BASS_Mixer_ChannelGetData/Level
  static final int BASS_MIXER_LIMIT = 0x4000; // limit mixer processing to the amount available from this source
  static final int BASS_MIXER_MATRIX = 0x10000; // matrix mixing
  static final int BASS_MIXER_PAUSE = 0x20000; // don't process the source
  static final int BASS_MIXER_DOWNMIX = 0x400000; // downmix to stereo/mono
  static final int BASS_MIXER_NORAMPIN = 0x800000; // don't ramp-in the start

  // mixer attributes
  static final int BASS_ATTRIB_MIXER_LATENCY = 0x15000;

  // splitter flags
  static final int BASS_SPLIT_SLAVE = 0x1000; // only read buffered data
  static final int BASS_SPLIT_POS = 0x2000;

  // splitter attributes
  static final int BASS_ATTRIB_SPLIT_ASYNCBUFFER = 0x15010;
  static final int BASS_ATTRIB_SPLIT_ASYNCPERIOD = 0x15011;



  // envelope types
   static final int BASS_MIXER_ENV_FREQ = 1;
   static final int BASS_MIXER_ENV_VOL = 2;
   static final int BASS_MIXER_ENV_PAN = 3;
   static final int BASS_MIXER_ENV_LOOP = 0x10000; // flag: loop

  // additional sync type
   static final int BASS_SYNC_MIXER_ENVELOPE = 0x10200;
   static final int BASS_SYNC_MIXER_ENVELOPE_NODE = 0x10201;

  // additional BASS_Mixer_ChannelSetPosition flag
   static final int BASS_POS_MIXER_RESET = 0x10000; // flag: clear mixer's playback buffer

  // BASS_CHANNELINFO type
   static final int BASS_CTYPE_STREAM_MIXER = 0x10800;
   static final int BASS_CTYPE_STREAM_SPLIT = 0x10801;
}
