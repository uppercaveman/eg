#!/bin/bash

etcd_version="3.4.13"
goreman_version="0.3.7"

etcd_dir="etcd"
goreman_dir="goreman"

if [ "$1" = "--force" ]; then
	rm -rf $etcd_dir
	rm -rf $goreman_dir
fi

if [ ! -f $etcd_dir"/etcd" ]; then
	mkdir $etcd_dir
	wget "https://github.com/etcd-io/etcd/releases/download/v"$etcd_version"/etcd-v"$etcd_version"-linux-amd64.tar.gz" -O $etcd_dir/etcd.tar.gz
	tar xvf $etcd_dir/etcd.tar.gz -C $etcd_dir --strip-components=1
fi

if [ ! -f $goreman_dir"/goreman" ]; then
	mkdir $goreman_dir
	wget "https://github.com/mattn/goreman/releases/download/v"$goreman_version"/goreman_v"$goreman_version"_linux_amd64.tar.gz" -O $goreman_dir/goreman.tar.gz
	tar xvf $goreman_dir/goreman.tar.gz -C $goreman_dir --strip-components=1
fi

docker build -t "etcd-goreman:"$etcd_version .
