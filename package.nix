{
  stdenv,
  pkg-config,
}:
stdenv.mkDerivation {
  name = "upset";
  version = "1.0";
  src = ./.;
  prePatch = ''
    substituteInPlace ./upset_cli.cpp \
      --replace-fail "Syntax: upset_cli" "Syntax: upset"
  '';
  buildPhase = ''
    g++ -std=gnu++0x -I. upset_cli.cpp -o upset
  '';
  installPhase = ''
    mkdir -p $out/bin
    cp upset $out/bin
  '';
}
