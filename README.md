# KiNoYo-Rotation

## Description

<abbr title="World of Warcraft">WoW</abbr> addon to help you get the most of your class rotation.

This is a reboot of [RotationBuilder](http://wow.curseforge.com/addons/rotation-builder/) with the aim to:

* use lastest development tools and frameworks
* add some functionalities we were missing
* break free of the legacy code

## To Do list

- [ ] Core
    - [ ] Create rotation model
    - [ ] Import/export funtionality
- [ ] Interface
    - [ ] Create rotation management IHM
    - [ ] Create a box to display the actions to launch

## Ideas

* Remove long cooldown actions from the rotation and put them in another panel for information
* display more efficiently buff/debuff to refresh
* add a way to give advise on the fly
* Make this addon more easy to mod with other addons

## Installation for development

Clone the repository into your github repository directory:

```bash
cd <path_to_github_repository>
git clone --recursive https://github.com/KiNoYo/KiNoYo-Rotation.git KiNoYo-Rotation
```

Install the cloned repository as an addon for World of Warcraft:

```bash
cd <path_to_WoW>\Interface\AddOns
mklink /J KiNoYo-Rotation <path_to_github_repository>\KiNoYo-Rotation
```
