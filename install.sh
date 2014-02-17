#!/usr/bin/env bash

bin_dir=${1:-"${HOME}/bin/"}
function download_file(){
  curl -s https://raw.github.com/zph/sack/master/bin/${1} > "${bin_dir}${1}"
  echo "Installed ${1} into ${bin_dir}"
}

download_file 'sack'
download_file 'F'
