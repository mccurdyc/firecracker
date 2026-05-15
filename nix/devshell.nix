# Development shell configuration for this specific project
{
  perSystem = { self', pkgs, ... }: {
    formatter = pkgs.treefmt;

    # https://nixos.org/manual/nixpkgs/stable/#sec-pkgs-mkShell
    devShells.default = pkgs.mkShell {
      inputsFrom = [
        self'.devShells.rust
      ];

      packages = with pkgs; [
        rust-analyzer

        # Nix tools
        statix
        nil
        nixfmt
        deadnix
        tree-sitter
      ];
    };
  };
}
