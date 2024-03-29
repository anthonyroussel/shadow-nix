# Changelog

## [1.5.0](https://github.com/anthonyroussel/shadow-nix/compare/v1.4.0...v1.5.0) (2023-11-23)


### Features

* **ci:** use magic-nix-cache-action to speed-up build ([b7952d6](https://github.com/anthonyroussel/shadow-nix/commit/b7952d6081f7f626611c560b73ee24bf3ba4ba98))
* move .drirc file from blade-shadow-beta repository ([992dab6](https://github.com/anthonyroussel/shadow-nix/commit/992dab68826b5ce5dc23a116863d6178225d9657))


### Bug Fixes

* **ci:** change release-please to bump version in README.md ([d4a336b](https://github.com/anthonyroussel/shadow-nix/commit/d4a336b1d04bd907bc4bd94ea63b7d6ce838b92f))
* remove utilities.{files,debug} and use debug.nix ([2a95c50](https://github.com/anthonyroussel/shadow-nix/commit/2a95c5047280be45af2893f5146802926b9f1891))

## [1.4.0](https://github.com/anthonyroussel/shadow-nix/compare/v1.3.2...v1.4.0) (2023-10-28)


### Features

* **ci:** add release-please Github Action ([f3a9d1b](https://github.com/anthonyroussel/shadow-nix/commit/f3a9d1b683f62382778cb19f793249573a883c5d))
* shadow-prod: 5.0.1161 -> 8.0.10164
* shadow-preprod: 5.0.1158 -> 8.0.10175
* shadow-testing: 5.0.1152 -> 8.0.10177
* Build Shadow Nix with NixOS 22.11
* Improve update script with Git commit messages


### Bug Fixes

* **changelog:** fix changelog format for release-please ([e364740](https://github.com/anthonyroussel/shadow-nix/commit/e36474008bb0b9606b53dc277aea568f2f227043))
* Bump cachix/install-nix-action from 21 to 23
* Bump actions/checkout from 3 to 4
* Bump cachix/install-nix-action from 20 to 21
* Build Shadow Nix with NixOS 23.05
* Fix Home Manager CI
* Bump cachix/install-nix-action from 18 to 20
* Bump cachix/install-nix-action from 17 to 18
* Fix deleted alsaLib package alias with unstable nixpkgs
* Bump actions/checkout from 2 to 3
* Clean default.nix

## [1.3.2](https://github.com/anthonyroussel/shadow-nix/compare/v1.3.1...v1.3.2)

- prod: 5.0.1138 -> 5.0.1161 (#55)
- preprod: 5.0.1153 -> 5.0.1158 (#53)
- testing: 5.0.1149 -> 5.0.1152 (#46)
- Remove support for NixOS 21.11

## [1.3.1](https://github.com/anthonyroussel/shadow-nix/compare/v1.3.0...v1.3.1)

- Fix bad icon path in Shadow's XDG Desktop entry

## [1.3.0](https://github.com/anthonyroussel/shadow-nix/compare/v1.2.0...v1.3.0)

- Upgrade prod from v5.0.1092 to v5.0.1119 (#18)
- Upgrade testing from v5.0.1114 to v5.0.1120 (#17)

## [1.2.0](https://github.com/anthonyroussel/shadow-nix/compare/v1.1.0...v1.2.0)

- Build Shadow on Nix package with NixOS 22.05 (#16)
- Upgrade preprod from v5.0.1090 to v5.0.1117 (#14, #15)
- Upgrade testing from v5.0.1106 to v5.0.1114 (#13)

## [1.1.0](https://github.com/anthonyroussel/shadow-nix/compare/v1.0.6...v1.1.0)

- Upgrade release from testing channel from v5.0.1089 to v5.0.1106 (#12)

## [1.0.6](https://github.com/anthonyroussel/shadow-nix/compare/v1.0.5...v1.0.6)

- Purify Shadow on Nix for Nix flakes and reproducible & immutable builds (#11)

## [1.0.5](https://github.com/anthonyroussel/shadow-nix/compare/v1.0.4...v1.0.5)

- Fix icon path in Shadow's XDG Desktop entry (#7)

## [1.0.4](https://github.com/anthonyroussel/shadow-nix/compare/v1.0.3...v1.0.4)

- Add missing libpulseaudio, libvdpau, libcurl & libxshfence build dependencies (#3)
- Run tests against Nixpkgs 21.11 (#4)

## [1.0.3](https://github.com/anthonyroussel/shadow-nix/compare/v1.0.2...v1.0.3)

- Fix the 2 new dependencies: `xcb-image` and `xcb-render-util`.

## [1.0.2](https://github.com/anthonyroussel/shadow-nix/compare/v1.0.1...v1.0.2)

- Add Home Manager CI import test
- Fix Mesa dependency
- Add `extraChannels` option to install multiple channels

## [1.0.1](https://github.com/anthonyroussel/shadow-nix/compare/v1.0.0...v1.0.1)

[Pull request](https://github.com/NicolasGuilloux/shadow-nix/pull/14)

- Fixing the [#13](https://github.com/NicolasGuilloux/shadow-nix/issues/13) issue about the import with home manager.
- Editing documentation
- Adding Unstable package build

## 1.0.0

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
