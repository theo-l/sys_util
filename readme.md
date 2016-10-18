# linux 系统个人使用工具相关配置工具包

##1. 常用个人软件列表的安装 以及软件的基本配置 ##
    
    software_install.sh
    
*********** vim安装文件可能需要手动进行安装最新版本 **

##2. Shell的个人偏好相关设置 ##
    将 shell/shell_startup.sh 配置到系统的 .zshrc/.bashrc 中以便开启个人的shell偏好设置

    bin/ 目录中为个人定制的命令偏好设置

##3. Vim 相关环境配置 ##
    
    vim_config.sh
    vim/
        autoload/
            plug.vim                #该文件为 vim-plug 插件管理器

        config/                     # 在vimrc文件中引用的配置文件列表
                plugin_config.vim   # 插件列表以及配置文件, 使用 vim-plug 作为插件管理器
                common_settings.vim # vim 的通用设置
                function_config.vim # 个人定制函数文件
                filetype_config.vim # 个人文件类型配置文件
                common_mappings.vim # 个人键映射偏好配置文件
                common_abbrevs.vim  # 个人缩写偏好配置文件

                
        colors/                     # Vim 配色方案文件目录
                ...
        after/
            ftplugin/               # 目录中为个人对于文件类型的特定设定
                css.vim
                html.vim
                java.vim
                markdown.vim
                python.vim
                sh.vim
                vim.vim
                xhtml.vim
                xml.vim
                zsh.vim
                
        plugin/
            templates.vim           # 该插件为不同文件类型的初始化模板管理器， 用来创建初始化模板

        templates/                  # 文件类型的新建文件模板
            html
            xhtml
            python
            sh
            zsh


##4. 配置文件目录 ##
    
    config/
        ideavimrc                   # Pycharm 的 ideavim 插件的配置文件
        vimrc                       # vim 的配置文件
        vrapperrc                   # Eclipse 的 vrapper 插件配置文件
        tmux.config                 # tmux的配置文件
