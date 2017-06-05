__install_github_vimcolor() {

    color_github_url=$1
    echo "Installing vim color from $color_github_url"

    color_path=~/.vim/colors/
    color_tmp_name='color_tmp'
    git clone $color_github_url ${color_path}${color_tmp_name}

    cd ${color_path}${color_tmp_name}/colors

    echo $(pwd)

    cp ./*.vim $color_path


    rm -rf ${color_path}${color_tmp_name}


}

__install_github_vimcolor $1
