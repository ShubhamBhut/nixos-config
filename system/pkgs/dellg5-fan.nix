{ lib, stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "dellg5-fan";
  version = "3.4";
  src = fetchFromGitHub {
    owner = "DavidLapous";
    repo = "DellG5SE-Fan-Linux";
    rev = "v${version}";
    hash = "sha256-k+U0ojq2oSHgB/gp5DfcMBe7xonggDvECqs43FGKid4=";
  };
  buildPhase = ''
    g++ DellFan.cpp -o dellg5-fan
  '';
  installPhase = ''
    mkdir -p $out/bin
    mv dellg5-fan $out/bin
  '';
  meta = with lib; {
    description = "Adjust Fans for DellG5SE";
    homepage = "https://github.com/DavidLapous/DellG5SE-Fan-Linux";
    license = licenses.mit;
    platforms = platforms.linux;
  };
}
