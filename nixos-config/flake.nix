{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };
  outputs = { self, nixpkgs, ...}:
  	let 

      system = "x86_64-linux";
	  pkgs = import nixpkgs {inherit system; };
	  in {
	  	devShells.x86_64-linux.default = pkgs.mkShell {
			buildInput = with pkgs; [
				glfw
				raylib
			];
			shellHook = ''
				echo "in dev shell?"
				export LD_LIBRARY_PATH="${pkgs.glfw}/lib:${pkgs.raylib}/lib:$LD_LIBRARY_PATH"
			'';
		};

		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			modules = [ ./configuration.nix ];
		};
	};

    #nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      #system = "x86_64-linux";
      #modules = [ ./configuration.nix ];
    #};
}
