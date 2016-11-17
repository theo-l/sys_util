#!/usr/bin/env bash

# 用来进行解压系统中的压缩文件的通用方法


# 检测使用的系统命令是否存在，否则安装该命令
__detect_cmd() {
	$cmd=$1
	if [[ -z $(which $cmd) ]]; then
		sudo apt install $cmd
	fi
}

# 解压缩文件函数
__uncompress_file() {

	archived_file=$1
	dest_dir=$2

	echo "$archived_file, $dest_dir"

	# 解压 .zip 文件
	if [[ $archived_file =~ .*.zip$ ]]; then
		echo -e "This is a zip file\n"
		__detect_cmd unzip
		unzip $archived_file -d $dest_dir

	# 解压 .tar.gz 文件
	elif [[ $archived_file =~ .*.tar.gz$ ]]; then
		echo -e "This is a gzip file\n"
		__detect_cmd tar
		tar -zxvf $archived_file -C $dest_dir

	# 解压 .tar.bz2 文件
	elif [[ $archived_file =~ .*.tar.bz2$ ]]; then
		echo -e "This is a bzip file\n"
		tar -jxvf $archived_file -C $dest_dir

	# 解压 .tar 文件
	elif [[ $archived_file =~ .*.tar$ ]]; then
		echo -e "This is a simple tar file\n"
		tar -xvf $archived_file -C $dest_dir

	# 解压 .tar.Z 文件
	elif [[ $archived_file =~ .*.tar.Z$ ]]; then
		echo -e "This is a Z file\n"
		tar -Zxvf $archived_file $dest_dir


	# 解压 .rar 文件
	elif [[ $archived_file =~ .*.rar$ ]]; then
		echo -e "This is a rar file\n"
		__detect_cmd unrar
		unrar e $archived_file

	fi
}


# 解析用户输入参数

__parse_args() {

	if [[ $# == 2 ]]; then
		archived_file=$1
		dest_dir=$2
	elif [[ $# == 1 ]]; then
		archived_file=$1
		dest_dir=./
	elif [[ $# < 1 ]]; then
		echo -e "使用方法: $0  压缩文件名  解压缩文件路径名\n"
		exit 1
	fi

	__uncompress_file $archived_file $dest_dir
}

__parse_args $@
