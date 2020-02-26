class BASS {
  static final int BASSVERSION = 0x204; // API version
  static final String BASSVERSIONTEXT = "2.4";

  // Error codes returned by BASS_ErrorGetCode
  static final int BASS_OK = 0; // all is OK
  static final int BASS_ERROR_MEM = 1; // memory error
  static final int BASS_ERROR_FILEOPEN = 2; // can't open the file
  static final int BASS_ERROR_DRIVER = 3; // can't find a free/valid driver
  static final int BASS_ERROR_BUFLOST = 4; // the sample buffer was lost
  static final int BASS_ERROR_HANDLE = 5; // invalid handle
  static final int BASS_ERROR_FORMAT = 6; // unsupported sample format
  static final int BASS_ERROR_POSITION = 7; // invalid position
  static final int BASS_ERROR_INIT = 8; // BASS_Init has not been successfully
  static final int BASS_ERROR_START = 9; // BASS_Start has not been successfully
  static final int BASS_ERROR_SSL = 10; // SSL/HTTPS support isn't available
  static final int BASS_ERROR_ALREADY = 14; // already initialized/paused/whate
  static final int BASS_ERROR_NOTAUDIO = 17; // file does not contain audio
  static final int BASS_ERROR_NOCHAN = 18; // can't get a free channel
  static final int BASS_ERROR_ILLTYPE = 19; // an illegal type was specified
  static final int BASS_ERROR_ILLPARAM = 20; // an illegal parameter was specifi
  static final int BASS_ERROR_NO3D = 21; // no 3D support
  static final int BASS_ERROR_NOEAX = 22; // no EAX support
  static final int BASS_ERROR_DEVICE = 23; // illegal device number
  static final int BASS_ERROR_NOPLAY = 24; // not playing
  static final int BASS_ERROR_FREQ = 25; // illegal sample rate
  static final int BASS_ERROR_NOTFILE = 27; // the stream is not a file stream
  static final int BASS_ERROR_NOHW = 29; // no hardware voices available
  static final int BASS_ERROR_EMPTY = 31; // the MOD music has no sequence data
  static final int BASS_ERROR_NONET =
  32; // no internet connection could be open
  static final int BASS_ERROR_CREATE = 33; // couldn't create the file
  static final int BASS_ERROR_NOFX = 34; // effects are not available
  static final int BASS_ERROR_NOTAVAIL = 37; // requested data/action is not ava
  static final int BASS_ERROR_DECODE =
  38; // the channel is a "decoding channel"
  static final int BASS_ERROR_DX =
  39; // a sufficient DirectX version is not inst
  static final int BASS_ERROR_TIMEOUT = 40; // connection timedout
  static final int BASS_ERROR_FILEFORM = 41; // unsupported file format
  static final int BASS_ERROR_SPEAKER = 42; // unavailable speaker
  static final int BASS_ERROR_VERSION = 43; // invalid BASS version (used by ad
  static final int BASS_ERROR_CODEC = 44; // codec is not available/supported
  static final int BASS_ERROR_ENDED = 45; // the channel/file has ended
  static final int BASS_ERROR_BUSY = 46; // the device is busy
  static final int BASS_ERROR_UNSTREAMABLE = 47; // unstreamable file
  static final int BASS_ERROR_UNKNOWN = -1; // some other mystery problem
  static final int BASS_ERROR_JAVA_CLASS = 500; // object class problem

// BASS_SetConfig options
  static final int BASS_CONFIG_BUFFER = 0;
  static final int BASS_CONFIG_UPDATEPERIOD = 1;
  static final int BASS_CONFIG_GVOL_SAMPLE = 4;
  static final int BASS_CONFIG_GVOL_STREAM = 5;
  static final int BASS_CONFIG_GVOL_MUSIC = 6;
  static final int BASS_CONFIG_CURVE_VOL = 7;
  static final int BASS_CONFIG_CURVE_PAN = 8;
  static final int BASS_CONFIG_FLOATDSP = 9;
  static final int BASS_CONFIG_3DALGORITHM = 10;
  static final int BASS_CONFIG_NET_TIMEOUT = 11;
  static final int BASS_CONFIG_NET_BUFFER = 12;
  static final int BASS_CONFIG_PAUSE_NOPLAY = 13;
  static final int BASS_CONFIG_NET_PREBUF = 15;
  static final int BASS_CONFIG_NET_PASSIVE = 18;
  static final int BASS_CONFIG_REC_BUFFER = 19;
  static final int BASS_CONFIG_NET_PLAYLIST = 21;
  static final int BASS_CONFIG_MUSIC_VIRTUAL = 22;
  static final int BASS_CONFIG_VERIFY = 23;
  static final int BASS_CONFIG_UPDATETHREADS = 24;
  static final int BASS_CONFIG_DEV_BUFFER = 27;
  static final int BASS_CONFIG_DEV_DEFAULT = 36;
  static final int BASS_CONFIG_NET_READTIMEOUT = 37;
  static final int BASS_CONFIG_HANDLES = 41;
  static final int BASS_CONFIG_SRC = 43;
  static final int BASS_CONFIG_SRC_SAMPLE = 44;
  static final int BASS_CONFIG_ASYNCFILE_BUFFER = 45;
  static final int BASS_CONFIG_OGG_PRESCAN = 47;
  static final int BASS_CONFIG_DEV_NONSTOP = 50;
  static final int BASS_CONFIG_VERIFY_NET = 52;
  static final int BASS_CONFIG_DEV_PERIOD = 53;
  static final int BASS_CONFIG_FLOAT = 54;
  static final int BASS_CONFIG_NET_SEEK = 56;
  static final int BASS_CONFIG_AM_DISABLE = 58;
  static final int BASS_CONFIG_NET_PLAYLIST_DEPTH = 59;
  static final int BASS_CONFIG_NET_PREBUF_WAIT = 60;
  static final int BASS_CONFIG_ANDROID_SESSIONID = 62;
  static final int BASS_CONFIG_ANDROID_AAUDIO = 67;

  // BASS_SetConfigPtr options
  static final int BASS_CONFIG_NET_AGENT = 16;
  static final int BASS_CONFIG_NET_PROXY = 17;
  static final int BASS_CONFIG_LIBSSL = 64;

  // BASS_Init flags
  static final int BASS_DEVICE_8BITS = 1; // 8 bit
  static final int BASS_DEVICE_MONO = 2; // mono
  static final int BASS_DEVICE_3D = 4; // enable 3D functionality
  static final int BASS_DEVICE_16BITS = 8; // limit output to 16 bit
  static final int BASS_DEVICE_LATENCY = 0x100; // calculate device latency (BAS
  static final int BASS_DEVICE_SPEAKERS =
  0x800; // force enabling of speaker assig
  static final int BASS_DEVICE_NOSPEAKER = 0x1000; // ignore speaker arrangement
  static final int BASS_DEVICE_FREQ = 0x4000; // set device sample rate
  static final int BASS_DEVICE_AUDIOTRACK = 0x20000; // use AudioTrack output

// BASS_DEVICEINFO flags
  static final int BASS_DEVICE_ENABLED = 1;
  static final int BASS_DEVICE_DEFAULT = 2;
  static final int BASS_DEVICE_INIT = 4;

  static final int BASS_SAMPLE_8BITS = 1; // 8 bit
  static final int BASS_SAMPLE_FLOAT = 256; // 32-bit floating-point
  static final int BASS_SAMPLE_MONO = 2; // mono
  static final int BASS_SAMPLE_LOOP = 4; // looped
  static final int BASS_SAMPLE_3D = 8; // 3D functionality
  static final int BASS_SAMPLE_SOFTWARE = 16; // not using hardware mixing
  static final int BASS_SAMPLE_MUTEMAX = 32; // mute at max distance (3D only)
  static final int BASS_SAMPLE_VAM = 64; // DX7 voice allocation & management
  static final int BASS_SAMPLE_FX = 128; // old implementation of DX8 effects
  static final int BASS_SAMPLE_OVER_VOL = 0x10000; // override lowest volume
  static final int BASS_SAMPLE_OVER_POS = 0x20000; // override longest playing
  static final int BASS_SAMPLE_OVER_DIST =
  0x30000; // override furthest from listener (3D only)

  static final int BASS_STREAM_PRESCAN =
  0x20000; // enable pin-point seeking/length (MP3/MP2/MP1)
  static final int BASS_MP3_SETPOS = BASS_STREAM_PRESCAN;
  static final int BASS_STREAM_AUTOFREE =
  0x40000; // automatically free the stream when it stop/ends
  static final int BASS_STREAM_RESTRATE =
  0x80000; // restrict the download rate of internet file streams
  static final int BASS_STREAM_BLOCK =
  0x100000; // download/play internet file stream in small blocks
  static final int BASS_STREAM_DECODE =
  0x200000; // don't play the stream, only decode (BASS_ChannelGetData)
  static final int BASS_STREAM_STATUS =
  0x800000; // give server status info (HTTP/ICY tags) in DOWNLOADPROC

  static final int BASS_MUSIC_FLOAT = BASS_SAMPLE_FLOAT;
  static final int BASS_MUSIC_MONO = BASS_SAMPLE_MONO;
  static final int BASS_MUSIC_LOOP = BASS_SAMPLE_LOOP;
  static final int BASS_MUSIC_3D = BASS_SAMPLE_3D;
  static final int BASS_MUSIC_FX = BASS_SAMPLE_FX;
  static final int BASS_MUSIC_AUTOFREE = BASS_STREAM_AUTOFREE;
  static final int BASS_MUSIC_DECODE = BASS_STREAM_DECODE;
  static final int BASS_MUSIC_PRESCAN =
      BASS_STREAM_PRESCAN; // calculate playback length
  static final int BASS_MUSIC_CALCLEN = BASS_MUSIC_PRESCAN;
  static final int BASS_MUSIC_RAMP = 0x200; // normal ramping
  static final int BASS_MUSIC_RAMPS = 0x400; // sensitive ramping
  static final int BASS_MUSIC_SURROUND = 0x800; // surround sound
  static final int BASS_MUSIC_SURROUND2 = 0x1000; // surround sound (mode 2)
  static final int BASS_MUSIC_FT2PAN =
  0x2000; // apply FastTracker 2 panning to XM files
  static final int BASS_MUSIC_FT2MOD =
  0x2000; // play .MOD as FastTracker 2 does
  static final int BASS_MUSIC_PT1MOD = 0x4000; // play .MOD as ProTracker 1 does
  static final int BASS_MUSIC_NONINTER =
  0x10000; // non-interpolated sample mixing
  static final int BASS_MUSIC_SINCINTER =
  0x800000; // sinc interpolated sample mixing
  static final int BASS_MUSIC_POSRESET =
  0x8000; // stop all notes when moving position
  static final int BASS_MUSIC_POSRESETEX =
  0x400000; // stop all notes and reset bmp/etc when moving position
  static final int BASS_MUSIC_STOPBACK =
  0x80000; // stop the music on a backwards jump effect
  static final int BASS_MUSIC_NOSAMPLE = 0x100000; // don't load the samples

// Speaker assignment flags
  static final int BASS_SPEAKER_FRONT = 0x1000000; // front speakers
  static final int BASS_SPEAKER_REAR = 0x2000000; // rear/side speakers
  static final int BASS_SPEAKER_CENLFE =
  0x3000000; // center & LFE speakers (5.1)
  static final int BASS_SPEAKER_REAR2 = 0x4000000; // rear center speakers (7.1)
  static int BASS_SPEAKER_N(int n) {
    return n << 24;
  } // n'th pair of speakers (max 15)

  static final int BASS_SPEAKER_LEFT = 0x10000000; // modifier: left
  static final int BASS_SPEAKER_RIGHT = 0x20000000; // modifier: right
  static final int BASS_SPEAKER_FRONTLEFT =
  BASS_SPEAKER_FRONT | BASS_SPEAKER_LEFT;
  static final int BASS_SPEAKER_FRONTRIGHT =
  BASS_SPEAKER_FRONT | BASS_SPEAKER_RIGHT;
  static final int BASS_SPEAKER_REARLEFT =
  BASS_SPEAKER_REAR | BASS_SPEAKER_LEFT;
  static final int BASS_SPEAKER_REARRIGHT =
  BASS_SPEAKER_REAR | BASS_SPEAKER_RIGHT;
  static final int BASS_SPEAKER_CENTER =
  BASS_SPEAKER_CENLFE | BASS_SPEAKER_LEFT;
  static final int BASS_SPEAKER_LFE = BASS_SPEAKER_CENLFE | BASS_SPEAKER_RIGHT;
  static final int BASS_SPEAKER_REAR2LEFT =
  BASS_SPEAKER_REAR2 | BASS_SPEAKER_LEFT;
  static final int BASS_SPEAKER_REAR2RIGHT =
  BASS_SPEAKER_REAR2 | BASS_SPEAKER_RIGHT;

  static final int BASS_ASYNCFILE = 0x40000000;

  static final int BASS_RECORD_PAUSE = 0x8000; // start recording paused

  static final int BASS_ORIGRES_FLOAT = 0x10000;

  // BASS_CHANNELINFO types
  static final int BASS_CTYPE_SAMPLE = 1;
  static final int BASS_CTYPE_RECORD = 2;
  static final int BASS_CTYPE_STREAM = 0x10000;
  static final int BASS_CTYPE_STREAM_VORBIS = 0x10002;
  static final int BASS_CTYPE_STREAM_OGG = 0x10002;
  static final int BASS_CTYPE_STREAM_MP1 = 0x10003;
  static final int BASS_CTYPE_STREAM_MP2 = 0x10004;
  static final int BASS_CTYPE_STREAM_MP3 = 0x10005;
  static final int BASS_CTYPE_STREAM_AIFF = 0x10006;
  static final int BASS_CTYPE_STREAM_CA = 0x10007;
  static final int BASS_CTYPE_STREAM_MF = 0x10008;
  static final int BASS_CTYPE_STREAM_AM = 0x10009;
  static final int BASS_CTYPE_STREAM_DUMMY = 0x18000;
  static final int BASS_CTYPE_STREAM_DEVICE = 0x18001;
  static final int BASS_CTYPE_STREAM_WAV = 0x40000; // WAVE flag, LOWORD=codec
  static final int BASS_CTYPE_STREAM_WAV_PCM = 0x50001;
  static final int BASS_CTYPE_STREAM_WAV_FLOAT = 0x50003;
  static final int BASS_CTYPE_MUSIC_MOD = 0x20000;
  static final int BASS_CTYPE_MUSIC_MTM = 0x20001;
  static final int BASS_CTYPE_MUSIC_S3M = 0x20002;
  static final int BASS_CTYPE_MUSIC_XM = 0x20003;
  static final int BASS_CTYPE_MUSIC_IT = 0x20004;
  static final int BASS_CTYPE_MUSIC_MO3 = 0x00100; // MO3 flag



  // BASS_ChannelSetSync types
   static final int BASS_SYNC_POS = 0;
   static final int BASS_SYNC_END = 2;
   static final int BASS_SYNC_META = 4;
   static final int BASS_SYNC_SLIDE = 5;
   static final int BASS_SYNC_STALL = 6;
   static final int BASS_SYNC_DOWNLOAD = 7;
   static final int BASS_SYNC_FREE = 8;
   static final int BASS_SYNC_SETPOS = 11;
   static final int BASS_SYNC_MUSICPOS = 10;
   static final int BASS_SYNC_MUSICINST = 1;
   static final int BASS_SYNC_MUSICFX = 3;
   static final int BASS_SYNC_OGG_CHANGE = 12;
   static final int BASS_SYNC_DEV_FAIL = 14;
   static final int BASS_SYNC_DEV_FORMAT = 15;
   static final int BASS_SYNC_THREAD = 0x20000000;	// flag: call sync in other thread
   static final int BASS_SYNC_MIXTIME = 0x40000000;	// flag: sync at mixtime, else at playtime
   static final int BASS_SYNC_ONETIME = 0x80000000;	// flag: sync only once, else continuously


  // BASS_ChannelIsActive return values
  static final int BASS_ACTIVE_STOPPED = 0;
  static final int BASS_ACTIVE_PLAYING = 1;
  static final int BASS_ACTIVE_STALLED = 2;
  static final int BASS_ACTIVE_PAUSED = 3;
  static final int BASS_ACTIVE_PAUSED_DEVICE = 4;

  // Channel attributes
  static final int BASS_ATTRIB_FREQ = 1;
  static final int BASS_ATTRIB_VOL = 2;
  static final int BASS_ATTRIB_PAN = 3;
  static final int BASS_ATTRIB_EAXMIX = 4;
  static final int BASS_ATTRIB_NOBUFFER = 5;
  static final int BASS_ATTRIB_VBR = 6;
  static final int BASS_ATTRIB_CPU = 7;
  static final int BASS_ATTRIB_SRC = 8;
  static final int BASS_ATTRIB_NET_RESUME = 9;
  static final int BASS_ATTRIB_SCANINFO = 10;
  static final int BASS_ATTRIB_NORAMP = 11;
  static final int BASS_ATTRIB_BITRATE = 12;
  static final int BASS_ATTRIB_BUFFER = 13;
  static final int BASS_ATTRIB_GRANULE = 14;
  static final int BASS_ATTRIB_MUSIC_AMPLIFY = 0x100;
  static final int BASS_ATTRIB_MUSIC_PANSEP = 0x101;
  static final int BASS_ATTRIB_MUSIC_PSCALER = 0x102;
  static final int BASS_ATTRIB_MUSIC_BPM = 0x103;
  static final int BASS_ATTRIB_MUSIC_SPEED = 0x104;
  static final int BASS_ATTRIB_MUSIC_VOL_GLOBAL = 0x105;
  static final int BASS_ATTRIB_MUSIC_VOL_CHAN = 0x200; // + channel #
  static final int BASS_ATTRIB_MUSIC_VOL_INST = 0x300; // + instrument #

  // BASS_ChannelSlideAttribute flags
  static final int BASS_SLIDE_LOG = 0x1000000;

  // BASS_ChannelGetData flags
  static final int BASS_DATA_AVAILABLE = 0; // query how much data is buffered
  static final int BASS_DATA_FIXED = 0x20000000; // flag: return 8.24 fixed-point data
  static final int BASS_DATA_FLOAT = 0x40000000; // flag: return floating-point sample data
  static final int BASS_DATA_FFT256 = 0x80000000; // 256 sample FFT
  static final int BASS_DATA_FFT512 = 0x80000001; // 512 FFT
  static final int BASS_DATA_FFT1024 = 0x80000002; // 1024 FFT
  static final int BASS_DATA_FFT2048 = 0x80000003; // 2048 FFT
  static final int BASS_DATA_FFT4096 = 0x80000004; // 4096 FFT
  static final int BASS_DATA_FFT8192 = 0x80000005; // 8192 FFT
  static final int BASS_DATA_FFT16384 = 0x80000006; // 16384 FFT
  static final int BASS_DATA_FFT32768 = 0x80000007; // 32768 FFT
  static final int BASS_DATA_FFT_INDIVIDUAL = 0x10; // FFT flag: FFT for each channel, else all combined
  static final int BASS_DATA_FFT_NOWINDOW = 0x20; // FFT flag: no Hanning window
  static final int BASS_DATA_FFT_REMOVEDC = 0x40; // FFT flag: pre-remove DC bias
  static final int BASS_DATA_FFT_COMPLEX = 0x80; // FFT flag: return complex data
  static final int BASS_DATA_FFT_NYQUIST = 0x100; // FFT flag: return extra Nyquist value

  // BASS_ChannelGetLevelEx flags
   static final int BASS_LEVEL_MONO = 1;
   static final int BASS_LEVEL_STEREO = 2;
   static final int BASS_LEVEL_RMS = 4;
   static final int BASS_LEVEL_VOLPAN = 8;

  // BASS_ChannelGetTags types : what's returned
   static final int BASS_TAG_ID3 = 0; // ID3v1 tags : TAG_ID3
   static final int BASS_TAG_ID3V2 = 1; // ID3v2 tags : ByteBuffer
   static final int BASS_TAG_OGG = 2; // OGG comments : String array
   static final int BASS_TAG_HTTP = 3; // HTTP headers : String array
   static final int BASS_TAG_ICY = 4; // ICY headers : String array
   static final int BASS_TAG_META = 5; // ICY metadata : String
   static final int BASS_TAG_APE = 6; // APE tags : String array
   static final int BASS_TAG_MP4 = 7; // MP4/iTunes metadata : String array
   static final int BASS_TAG_VENDOR = 9; // OGG encoder : String
   static final int BASS_TAG_LYRICS3 = 10; // Lyric3v2 tag : String
   static final int BASS_TAG_WAVEFORMAT = 14; // WAVE format : ByteBuffer containing WAVEFORMATEEX structure
   static final int BASS_TAG_AM_MIME = 15; // Android Media MIME type : String
   static final int BASS_TAG_AM_NAME = 16; // Android Media codec name : String
   static final int BASS_TAG_RIFF_INFO = 0x100; // RIFF "INFO" tags : String array
   static final int BASS_TAG_RIFF_BEXT = 0x101; // RIFF/BWF "bext" tags : TAG_BEXT
   static final int BASS_TAG_RIFF_CART = 0x102; // RIFF/BWF "cart" tags : TAG_CART
   static final int BASS_TAG_RIFF_DISP = 0x103; // RIFF "DISP" text tag : String
   static final int BASS_TAG_RIFF_CUE = 0x104; // RIFF "cue " chunk : TAG_CUE structure
   static final int BASS_TAG_RIFF_SMPL = 0x105; // RIFF "smpl" chunk : TAG_SMPL structure
   static final int BASS_TAG_APE_BINARY = 0x1000; // + index #, binary APE tag : TAG_APE_BINARY
   static final int BASS_TAG_MUSIC_NAME = 0x10000; // MOD music name : String
   static final int BASS_TAG_MUSIC_MESSAGE = 0x10001; // MOD message : String
   static final int BASS_TAG_MUSIC_ORDERS = 0x10002; // MOD order list : ByteBuffer
   static final int BASS_TAG_MUSIC_AUTH = 0x10003; // MOD author : UTF-8 string
   static final int BASS_TAG_MUSIC_INST = 0x10100; // + instrument #, MOD instrument name : String
   static final int BASS_TAG_MUSIC_SAMPLE = 0x10300; // + sample #, MOD sample name : String
   static final int BASS_TAG_BYTEBUFFER = 0x10000000; // flag: return a ByteBuffer instead of a String or TAG_ID3

// BASS_ChannelGetLength/GetPosition/SetPosition modes
   static final int BASS_POS_BYTE = 0;		// byte position
   static final int BASS_POS_MUSIC_ORDER = 1;		// order.row position, MAKELONG(order,row)
   static final int BASS_POS_OGG = 3;		// OGG bitstream number
   static final int BASS_POS_RESET = 0x2000000; // flag: reset user file buffers
   static final int BASS_POS_RELATIVE = 0x4000000; // flag: seek relative to the current position
   static final int BASS_POS_INEXACT = 0x8000000; // flag: allow seeking to inexact position
   static final int BASS_POS_DECODE = 0x10000000; // flag: get the decoding (not playing) position
   static final int BASS_POS_DECODETO = 0x20000000; // flag: decode to the position instead of seeking
   static final int BASS_POS_SCAN = 0x40000000; // flag: scan to the position


}
