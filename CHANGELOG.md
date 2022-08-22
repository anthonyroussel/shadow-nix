# Changelog

### Version 1.3.2

- prod: 5.0.1138 -> 5.0.1161 (#55)
- preprod: 5.0.1153 -> 5.0.1158 (#53)
- testing: 5.0.1149 -> 5.0.1152 (#46)
- Remove support for NixOS 21.11


### Version 1.3.1

- Fix bad icon path in Shadow's XDG Desktop entry


### Version 1.3.0

- Upgrade prod from v5.0.1092 to v5.0.1119 (#18)
- Upgrade testing from v5.0.1114 to v5.0.1120 (#17)


### Version 1.2.0

- Build Shadow on Nix package with NixOS 22.05 (#16)
- Upgrade preprod from v5.0.1090 to v5.0.1117 (#14, #15)
- Upgrade testing from v5.0.1106 to v5.0.1114 (#13)


### Version 1.1.0

- Upgrade release from testing channel from v5.0.1089 to v5.0.1106 (#12)


### Version 1.0.6

- Purify Shadow on Nix for Nix flakes and reproducible & immutable builds (#11)


### Version 1.0.5

- Fix icon path in Shadow's XDG Desktop entry (#7)


### Version 1.0.4

- Add missing libpulseaudio, libvdpau, libcurl & libxshfence build dependencies (#3)
- Run tests against Nixpkgs 21.11 (#4)


### Version 1.0.3

- Fix the 2 new dependencies: `xcb-image` and `xcb-render-util`.


### Version 1.0.2

- Add Home Manager CI import test
- Fix Mesa dependency
- Add `extraChannels` option to install multiple channels


### Version 1.0.1

[Pull request](https://github.com/NicolasGuilloux/shadow-nix/pull/14)

- Fixing the [#13](https://github.com/NicolasGuilloux/shadow-nix/issues/13) issue about the import with home manager.
- Editing documentation
- Adding Unstable package build

### Version 1

[Pull request](https://github.com/NicolasGuilloux/shadow-nix/pull/11)

For this version, the ownership was transfered from [Elyhaka](https://github.com/Elyhaka) to [NicolasGuilloux](https://github.com/NicolasGuilloux).

The goal of this version was to simply the code, reorganize it to make it more readable and understandable.

- Adding direct access to the renderer
- Adding CI to check the package integrity
- Adding more documentation
- Cleaning all the code
- Refactoring some features
- Moving imports to the dedicated folder
- Changing tag version naming
