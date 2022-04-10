# Changelog

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
