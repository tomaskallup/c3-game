{ pkgs, lib, config, inputs, ... }:

{

  env.RAYLIB_DIR = "${pkgs.raylib}";
  # https://devenv.sh/packages/
  packages = with pkgs; [ git c3c raylib glfw gcc ];

  enterShell = ''
  '';

  # https://devenv.sh/tests/
  enterTest = ''
  '';

  # See full reference at https://devenv.sh/reference/options/
}
