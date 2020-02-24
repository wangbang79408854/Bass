class BASS_INFO {
  int flags; // device capabilities (DSCAPS_xxx flags)
  int hwsize; // size of total device hardware memory
  int hwfree; // size of free device hardware memory
  int freesam; // number of free sample slots in the hardware
  int free3d; // number of free 3D sample slots in the hardware
  int minrate; // min sample rate supported by the hardware
  int maxrate; // max sample rate supported by the hardware
  int eax; // device supports EAX? (always FALSE if BASS_DEVICE_3D was not used)
  int minbuf; // recommended minimum buffer length in ms (requires BASS_DEVICE_LATENCY)
  int dsver; // DirectSound version
  int latency; // delay (in ms) before start of playback (requires BASS_DEVICE_LATENCY)
  int initflags; // BASS_Init "flags" parameter
  int speakers; // number of speakers available
  int freq; // current output rate
}
