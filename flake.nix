{
  description = "Ozo's Neovim configuration";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs = {
    flake-parts,
    nixvim,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem = {
        system,
        pkgs,
        ...
      }: let
        nixvimLib = nixvim.lib.${system};
        nixvim' = nixvim.legacyPackages.${system};

        makeNvimWithPolarity = polarity: let
          nixvimModule = import ./config {inherit polarity;};
        in
          nixvim'.makeNixvimWithModule {
            inherit pkgs;
            module = nixvimModule;
          };

        nvim = makeNvimWithPolarity "dark";
      in {
        checks = {
          default = nixvimLib.check.mkTestDerivationFromNixvimModule {
            inherit pkgs;
            module = import ./config {polarity = "dark";};
          };
        };

        packages = {
          default = nvim;
          nvim = nvim;
          nvim-light = makeNvimWithPolarity "light";
          nvim-dark = makeNvimWithPolarity "dark";
        };

        apps.default = {
          type = "app";
          program = "${nvim}/bin/nvim";
        };
      };
    };
}
