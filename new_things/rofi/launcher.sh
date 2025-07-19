#!/usr/bin/env bash

dir="$HOME/.config/rofi/themes"
theme='raycast'

## Run
rofi \
    -show run \
    -theme ${dir}/${theme}.rasi
