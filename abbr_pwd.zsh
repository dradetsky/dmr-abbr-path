#!/bin/zsh

pathcompsize=${ZSH_ABBR_PWD_PATH_COMP_SIZE:-2}

function get_short_path_comp {
	pwd_list_comp=$1
	if [[ $pathcompsize -ge 2 ]] ; then
		echo $pwd_list_comp | cut -c1-$pathcompsize
	else
		firstchar=$(echo $pwd_list_comp | cut -c1)
		if [[ $firstchar == '.' ]] ; then
			echo $pwd_list_comp | cut -c1,2
		else
			echo $firstchar
		fi
	fi
}

function dmr_pwd_abbr {
	base_pwd=$PWD
	tilda_notation=${base_pwd//$HOME/\~}
	pwd_list=(${(s:/:)tilda_notation})
	list_len=${#pwd_list}

	if [[ $list_len -le 1 ]]; then
		echo $tilda_notation
		return
	fi

	if [[ ${pwd_list[1]} != '~' ]]; then
		formed_pwd='/'
	fi

	firstcomp=$(get_short_path_comp ${pwd_list[1]})

	formed_pwd=${formed_pwd}$firstcomp

	for ((i=2; i <= $list_len; i++)) do
		if [[ $i != ${list_len} ]]; then
			nextcomp=$(get_short_path_comp ${pwd_list[$i]})
			formed_pwd=${formed_pwd}/$nextcomp
		else
			formed_pwd=${formed_pwd}/${pwd_list[$i]}
		fi
	done

	echo $formed_pwd
	return
}
