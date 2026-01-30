pkgs:
pkgs.stdenv.mkDerivation {
  pname = "fallout-grub-theme";
  version = "1.0.0";
  src = pkgs.fetchFromGitHub {
    owner = "shvchk";
    repo = "fallout-grub-theme";
    rev = "b441e25a6d115614dc00ee6d11355d019a4969bf";
    hash = "sha256-dNRLM9tQjWOyi3s4Q2er5Xn2bpG/yQ/D/+F/lfYXrs8=";
  };
  installPhase = "cp -r $src $out";
}
