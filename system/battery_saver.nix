{
  services.tlp.settings = {
    STOP_CHARGE_THRESH_BAT0 = 80;
    CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
    CPU_SCALING_GOVERNOR_ON_AC = "performance";
    CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
    CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
  };
}
