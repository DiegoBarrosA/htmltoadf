{
  description = "A Rust project built with Nix Flakes";

  inputs = {
    # Use the latest stable version of Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable"; # or a specific version
  };

  outputs = { self, nixpkgs }: let
    # Define the Rust package
    rustPackage = nixpkgs.rustPackages.callPackage ./default.nix {};
  in {
    # Expose the package
    packages.x86_64-linux.default = rustPackage;

    # Optionally, you can also expose a development shell
    devShell.x86_64-linux = nixpkgs.mkShell {
      buildInputs = [
        nixpkgs.rustc
        nixpkgs.cargo
      ];
    };
  };
}
