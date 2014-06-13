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

sudo apt-get install -y fontforge

cd /tmp

git clone git://github.com/yascentur/Ricty.git
cd Ricty

wget http://levien.com/type/myfonts/Inconsolata.otf
wget -O migu-1m.zip 'http://sourceforge.jp/frs/redir.php?m=jaist&f=%2Fmix-mplus-ipa%2F59022%2Fmigu-1m-20130617.zip'
unzip migu-1m.zip
mv migu-1m-20130617/*.ttf .

./ricty_generator.sh Inconsolata.otf migu-1m-regular.ttf migu-1m-bold.ttf

mkdir -p ~/.fonts
cp *.ttf ~/.fonts/.
sudo fc-cache -vf
