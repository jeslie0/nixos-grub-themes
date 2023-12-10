pkgs:

pkgs.stdenv.mkDerivation {
  name = "bigsur-grub2-theme";
  src = pkgs.fetchFromGitHub {
    owner = "Teraskull";
    repo = "bigsur-grub2-theme";
    rev = "5bf0a9711282e4463eec82bb4430927fdc9c662a";
    hash = "sha256-BSZHTd6Eg/QZ1ekGTd3W+xHI6RbSmwCrcDxaCWD/DbI=";
  };
  installPhase = "cp -r bigsur $out";
}
