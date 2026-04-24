{
  description = "W1ngD1nGa5ter's NixVim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixvim = {
      url = "github:nix-community/nixvim";
      # inputs.nixpkgs.follows = "nixpkgs";

      # Why not `follows`?
      #
      # <https://nix-community.github.io/nixvim/user-guide/install.html#accessing-nixvim>
      # We recommend against using `inputs.nixpkgs.follows = "nixpkgs";` on the `nixvim` input as we test Nixvim against our Nixpkgs revision.
      # When you use `follows` you opt out of guarantees provided by these tests.
      # If you choose to use it anyway, removing `follows` should be one of the first debugging steps when encountering issues.
    };

    flake-utils.url = "github:numtide/flake-utils";

    pre-commit-hooks = {
      url = "github:cachix/pre-commit-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixvim,
      flake-utils,
      pre-commit-hooks,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
        nixvimLib = nixvim.lib.${system};
        nixvim' = nixvim.legacyPackages.${system};

        nixvimModule = {
          inherit system;
          module = import ./config;
          extraSpecialArgs = {
            inherit self;
            # inherit (inputs) foo;
          };
        };
        nvim = nixvim'.makeNixvimWithModule nixvimModule;
      in
      {
        formatter = pkgs.nixfmt-tree;

        checks = {
          default = nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;
          pre-commit-check = pre-commit-hooks.lib.${system}.run {
            src = ./.;
            hooks = {
              nixfmt.enable = true;
              deadnix.enable = true;
              statix.enable = true;
            };
          };
        };

        packages = {
          default = nvim;
        };

        devShells = {
          default =
            with pkgs;
            mkShell {
              inherit (self.checks.${system}.pre-commit-check) shellHook;
            };
        };
      }
    );
}
