#!/usr/bin/env bash

if [[ ! -z $BASH ]]; then

    SOFT_LIST_HOME=$(cd $(dirname ${BASH_SOURCE[0]}) && pwd )

elif [[ ! -z $ZSH_NAME ]]; then
	SOFT_LIST_HOME=$(dirname $0)
fi

SOFTWARE_LIST_FILE=$SOFT_LIST_HOME/installed_soft_list

# wrapper for apt-get install
INSTALL_CMD="sudo apt-get install"

__apt_install() {

	echo -e "$SOFTWARE_LIST_FILE\n"
	if [[ ! -f $SOFTWARE_LIST_FILE ]]; then
		touch $SOFTWARE_LIST_FILE
	fi

	install_soft_list=$@


	for soft in ${install_soft_list[@]}; do

		# If the soft not installed in system
		if [[ -z $(which $soft) && -z $(dpkg --list | grep -E "\b${soft}[^-]") ]]; then

			# If install  soft succeed
			if [[  $($INSTALL_CMD $soft 2>&1) && $? == 0 ]]; then
                
                echo -e "$soft install succeed\n"
				# record installed soft if not recorded before
				if [[ -z $(cat $SOFTWARE_LIST_FILE| grep -e "==${soft}==") ]]; then
						echo "==$soft==" >> $SOFTWARE_LIST_FILE
				fi
			fi
		else
			# record installed soft that not recorded before
			if [[ -z $(cat $SOFTWARE_LIST_FILE| grep -e "==${soft}==") ]]; then
				echo -e "$soft installed before without call this script\n"
				echo "==$soft==" >> $SOFTWARE_LIST_FILE
			fi

		fi

	done

}

__apt_install $*
