{
  description = "A flake of nixos grub themes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs =
          nixpkgs.legacyPackages.${system};

        themeDirectories =
          let dirContents =
                builtins.readDir ./themes;

              dirNames =
                builtins.attrNames dirContents;
          in
            builtins.filter (name: dirContents.${name} == "directory") dirNames;

        packages =
            builtins.foldl' (acc: name: acc // {${name} = import ./themes/${name}/default.nix pkgs; }) {} themeDirectories;
      in
        {
          packages = packages;
          checks = packages;
      }
    );

}
