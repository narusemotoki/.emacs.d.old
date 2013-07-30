#!/bin/sh

# JSONのflymakeに必要
sudo npm install -g jsonlint

# CoffeeScriptのflymakeに必要
sudo npm install -g coffeelint

# 通知
sudo apt-get install python-notify2

# TypeScriptの補完と構文チェックに必要
git clone https://github.com/clausreinke/typescript-tools
git clone git://github.com/clausreinke/typescript-tools.git
cd typescript-tools/
sudo npm install -g
