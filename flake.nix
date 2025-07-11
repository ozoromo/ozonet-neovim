{
  description = "Ozo's Neovim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = {
    nixvim,
    flake-parts,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];

      perSystem = {
        pkgs,
        system,
        ...
      }: let
        nixvimLib = nixvim.lib.${system};
        nixvim_lps = nixvim.legacyPackages.${system};

        # Create a function to build nixvim with a specific polarity
        makeNixvimWithPolarity = polarity: let
          nixvimModule = {
            inherit pkgs;
            module = import ./config {inherit polarity;};

            # You can use `extraSpecialArgs` to pass additional arguments to your module files
            extraSpecialArgs = {
              # inherit (inputs) foo;
            };
          };
        in
          nixvim_lps.makeNixvimWithModule nixvimModule;

        # Create the different variants
        nvim = makeNixvimWithPolarity "dark";
        nvim-light = makeNixvimWithPolarity "light";
        nvim-dark = makeNixvimWithPolarity "dark";

        # Default nixvim module for checks
        nixvimModule = {
          inherit pkgs;
          module = import ./config {};

          # You can use `extraSpecialArgs` to pass additional arguments to your module files
          extraSpecialArgs = {
            # inherit (inputs) foo;
          };
        };
      in {
        checks = {
          # Run `nix flake check .` to verify that your config is not broken
          default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
        };

        packages = {
          # Lets you run `nix run .` to start nixvim (default dark theme)
          default = nvim;
          nvim = nvim;
          nvim-light = nvim-light;
          nvim-dark = nvim-dark;
        };
      };
    };
}
