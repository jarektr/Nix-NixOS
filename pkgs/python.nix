{ pkgs, ... }:
{
  with pkgs;
  let
    default-python = python310.withPackages (python-packages:
      with python-packages; [
        pip
        black
        flake8
        setuptools
        wheel
        twine
        flake8
        virtualenv
      ]);
}
