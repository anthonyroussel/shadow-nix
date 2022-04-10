{ lib, ... }:

rec {
  drirc = builtins.fetchGit
    {
      url = "https://github.com/NicolasGuilloux/blade-shadow-beta";
      ref = "master";
      rev = "a58bdba241262723431f65e736e4b6dab1f75454";
    } + "/resources/drirc";
}
