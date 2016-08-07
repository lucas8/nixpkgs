{ stdenv, fetchurl, fetchFromGitHub }:
# TODO: Find how to specify runtime dependencies

let version = "ccae0cae2e765a1174b0446c9c73c88e430d493f"; in
stdenv.mkDerivation {
  name = "diana-${version}";

  src = fetchFromGitHub {
    owner  = "baskerville";
    repo   = "diana";
    rev    = "${version}";
    sha256 = "1h642gpx7rmyzcgpjwynkw0syk1i3qsy090blfcwgr7ah4a5ykwm";
  };

  buildCommand = ''
    mkdir -p $out/bin
    install -m 755 $src/diana $out/bin/
    install -m 755 $src/dad   $out/bin/
  '';

  meta = {
    homepage = "https://github.com/barkerville/diana";
    description = "A command line interface to the aria2 daemon";
    licence = stdenv.lib.licenses.unknown;
    platforms = stdenv.lib.platforms.unix;
  };
}

