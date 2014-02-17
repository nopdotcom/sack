#!/usr/bin/env bash

bin_dir=${1:-'~bin/'}
function download_file(){
  curl -q https://raw.github.com/zph/sack/master/bin/${1} > "${bin_dir}${1}"
}

download_file 'sack'
download_file 'F'
