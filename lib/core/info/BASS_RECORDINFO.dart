// Recording device info structure
class BASS_RECORDINFO {
  int flags; // device capabilities (DSCCAPS_xxx flags)
  int formats; // supported standard formats (WAVE_FORMAT_xxx flags)
  int inputs; // number of inputs
  bool singlein; // TRUE = only 1 input can be set at a time
  int freq; // current input rate
}
