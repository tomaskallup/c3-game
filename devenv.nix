{ pkgs, ... }:

let
  custom-glfw = pkgs.glfw.overrideAttrs (old: {
    postInstall = (old.postInstall or "") + ''
      ln -s $out/lib/libglfw.so $out/lib/libglfw3.so
    '';
  });
in
{

  # https://devenv.sh/packages/
  packages = with pkgs; [
    git
    c3c
    custom-glfw
  ];

  enterShell = '''';

  # https://devenv.sh/tests/
  enterTest = '''';

  # See full reference at https://devenv.sh/reference/options/
}
