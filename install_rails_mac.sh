#!/bin/sh

# XCcode命令行组件
xcode-select --install

# Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Rails必需系统组件
brew install libxml2 libxslt libiconv

# RVM
curl -L https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm

sed -i .bak -E 's!https?://cache.ruby-lang.org/pub/ruby!https://ruby.taobao.org/mirrors/ruby!' $rvm_path/config/db

# 安装Ruby
rvm install 2.2.4
rvm 2.2.4 --default

# RubyGems设置和安装bundler
gem sources --add https://ruby.taobao.org/ --remove https://rubygems.org/
gem install bundler
