services.mpd = {
  enable = true;
  musicDirectory = "./Music/";
  extraConfig = ''
    # must specify one or more outputs in order to play audio!
    # (e.g. ALSA, PulseAudio, PipeWire), see next sections
    audio_output {
      type            "pipewire"
      name            "PipeWire Sound Server"
    }

    audio_output {
      type            "pulse"
      name            "PulseAudio"
    }

    bind_to_address "127.0.0.1"
    port "6600"

    auto_update "yes"
  '';
};

