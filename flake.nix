{
  description = "A flake of nixos grub themes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      supportedSystems =
        [ "aarch64-linux" "x86_64-linux" "aarch64-darwin" "x86_64-darwin" ];

      forAllSystems =
        nixpkgs.lib.genAttrs supportedSystems;

      pkgsFor = forAllSystems (system:
          nixpkgs.legacyPackages.${system}
      );

      themeDirectories =
        let
          dirContents =
            builtins.readDir ./themes;

          dirNames =
            builtins.attrNames dirContents;
        in
          builtins.filter (name: dirContents.${name} == "directory") dirNames;

      packages = system:
        builtins.foldl' (acc: name: acc // {${name} = import ./themes/${name}/default.nix (pkgsFor.${system}); }) {} themeDirectories;
    in
      {
        packages =
          forAllSystems (system: packages system);

        checks =
          forAllSystems (system: packages system);
      };
}
