{ stdenv, fetchurl, git, bash }:

let version = "1.0"; in
let link = "https://raw.githubusercontent.com/lucas8/Shell-Music-Player/${version}"; in
stdenv.mkDerivation {
  name = "smp-${version}";
  isLibrary = false;
  isExecutable = true;

  exe = fetchurl {
    url = "${link}/smp.sh";
    sha256 = "75288c86d43fa152facf7d985b24c68dcc7aa86eea2575fcf26896de99e9405f";
  };

  builder = ./builder.sh;

  meta = {
    homepage = "https://github.com/lucas8/smp";
    description = "Shell Music Player";
    licence = stdenv.lib.licenses.gpl3;
    platforms = stdenv.lib.platforms.unix;
  };
}

