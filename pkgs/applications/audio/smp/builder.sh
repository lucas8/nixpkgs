source $stdenv/setup

bindir=bin
mkdir -p $out/$bindir
install -m 755 $exe $out/$bindir/smp

