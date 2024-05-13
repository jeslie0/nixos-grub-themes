pkgs:
pkgs.stdenv.mkDerivation {
  pname = "hyperfluent-grub-theme";
  version = "1.0.1";
  src = pkgs.fetchFromGitHub {
    owner = "Coopydood";
    repo = "HyperFluent-GRUB-Theme";
    rev = "v1.0.1";
    hash = "sha256-LGQahTnS6v23big5KC8LHS709zLXgp3QYcJ1lBTl2SM=";
  };
  installPhase = "cp -r $src/nixos $out";
}
