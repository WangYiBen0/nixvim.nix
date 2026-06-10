{
  description = "A Nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";

    git-hooks-nix = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
      ];

      imports = [
        # Import nixvim's flake-parts module;
        # Adds `flake.nixvimModules` and `perSystem.nixvimConfigurations`
        inputs.nixvim.flakeModules.default
        # Import git-hooks-nix's flake-parts module for pre-commit hooks
        inputs.git-hooks-nix.flakeModule
      ];

      nixvim = {
        # Automatically install corresponding packages for each nixvimConfiguration
        # Lets you run `nix run .#<name>`, or simply `nix run` if you have a default
        packages.enable = true;
        # Automatically install checks for each nixvimConfiguration
        # Run `nix flake check` to verify that your config is not broken
        checks.enable = true;
      };

      # You can define your reusable Nixvim modules here
      flake.nixvimModules = {
        default = ./config;
      };

      perSystem =
        {
          config,
          system,
          pkgs,
          ...
        }:
        {
          # Define the formatter for `nix fmt`
          formatter = pkgs.nixfmt-tree;

          # Configure pre-commit hooks
          pre-commit = {
            settings = {
              hooks = {
                nixfmt.enable = true;
                deadnix.enable = true;
                statix.enable = true;
              };
            };
          };

          # Development shell with pre-commit hooks enabled
          devShells.default = pkgs.mkShell {
            # Automatically installs git hooks when entering the shell
            inherit (config.pre-commit) shellHook;
          };

          # You can define actual Nixvim configurations here
          nixvimConfigurations = {
            default = inputs.nixvim.lib.evalNixvim {
              inherit system;
              modules = [
                self.nixvimModules.default
              ];
              # Pass extra arguments to your configuration
              extraSpecialArgs = {
                inherit self;
                # inherit (inputs) foo;
              };
            };
          };
        };
    };
}
