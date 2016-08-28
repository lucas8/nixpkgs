{ stdenv, fetchurl, glibc, gmp, zlib }:

stdenv.mkDerivation {
  name = "notmuch-web-bin-0.2.0";
  version = "0.2.0";
  src = fetchurl {
    url = "https://bitbucket.org/wuzzeb/notmuch-web/downloads/notmuch-web-0.2.0.x86_64.tar.gz";
    sha256 = "4f9fb6355c80024abd8d27f95bfaef3ed937d5b9defd30465615b74834e85b06";
  };

  libPath = stdenv.lib.makeLibraryPath [
    glibc
    gmp
    zlib
  ];

  phases = [ "unpackPhase" "installPhase" ];
  installPhase = ''
    mkdir -p "$out/opt/notmuch-web"
    install -m 755 notmuch-web "$out/opt/notmuch-web"

    patchelf --set-interpreter $(cat $NIX_CC/nix-support/dynamic-linker) \
      --set-rpath "$libPath" "$out/opt/notmuch-web/notmuch-web"
    mkdir "$out/bin"
    ln -s "$out/opt/notmuch-web/notmuch-web" "$out/bin/notmuch-web"

    mkdir -p "$out/share/notmuch-web"
    cp config/settings.example.yml config/robots.txt config/favicon.ico "$out/share/notmuch-web"
  '';
}
