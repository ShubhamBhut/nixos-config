services.mpd = {
  enable = true;
  musicDirectory = "/path/to/music";
  extraConfig = ''
    # must specify one or more outputs in order to play audio!
    # (e.g. ALSA, PulseAudio, PipeWire), see next sections
  '';

};

