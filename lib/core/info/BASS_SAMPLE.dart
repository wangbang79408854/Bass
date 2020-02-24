// Sample info structure
class BASS_SAMPLE {
  int freq; // default playback rate
  num volume; // default volume (0-1)
  num pan; // default pan (-1=left, 0=middle, 1=right)
  int flags; // BASS_SAMPLE_xxx flags
  int length; // length (in bytes)
  int max; // maximum simultaneous playbacks
  int origres; // original resolution bits
  int chans; // number of channels
  int mingap; // minimum gap (ms) between creating channels
  int mode3d; // BASS_3DMODE_xxx mode
  num mindist; // minimum distance
  num maxdist; // maximum distance
  int iangle; // angle of inside projection cone
  int oangle; // angle of outside projection cone
  num outvol; // delta-volume outside the projection cone
  int vam; // voice allocation/management flags (BASS_VAM_xxx)
  int priority; // priority (0=lowest, 0xffffffff=highest)
}
