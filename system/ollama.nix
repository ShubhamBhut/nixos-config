{ config, lib, ... }: {
  services.ollama = {
    enable = true;
    acceleration = "rocm";
  };
 }
