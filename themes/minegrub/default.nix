pkgs:
pkgs.stdenv.mkDerivation {
  pname = "minegrub-theme";
  version = "1.0.0";
  src = pkgs.fetchFromGitHub {
    owner = "Lxtharia";
    repo = "minegrub-theme";
    rev = "8ba52f8402ed642abf0f6eee32c407412a3ceae6";
    hash = "sha256-wTLOBy3l/FaIGJWRGFTVYsITkou0lmDU3uAMxvOCCN8=";
  };
  installPhase = "cp -r $src/minegrub $out";
}
