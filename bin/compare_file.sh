#!/bin/bash

function compare_dir {

    local dir1=$1
    local dir2=$2
    
#    echo $dir1 $dir2
    #echo $dir1
    #echo $dir2
    
    for f in `ls $dir1` ; do
        
        if [[ -d "${dir1}${f}" ]]; then
            compare_dir "${dir1}${f}/" "${dir2}${f}/"

        elif [[ -f "${dir2}${f}" ]]; then
    
            s1=`md5sum ${dir1}${f}`
            s2=`md5sum ${dir2}${f}`
    
            IFS=" "
    
            set -- "$s1"
            declare -a sa1=($*)          
    
            set -- "$s2"
            declare -a sa2=($*)          
            
    #        echo "$f  ${sa1[0]}  ${sa2[0]}"
    
            IFS=$ifs_bak
    
            if [[ ${sa1[0]} != ${sa2[0]} ]]; then
                echo ${sa1[1]} ${sa2[1]}
                echo "$f is different in two directories"
            fi
    
        else
            echo "${dir1}${f} not exists in $dir2"
        fi
    done
    

}

ifs_bak=$IFS
compare_dir $1 $2
IFS=$ifs_bak
