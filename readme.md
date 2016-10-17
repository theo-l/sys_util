# linux 系统个人使用工具相关配置工具包

##1. 常用个人软件列表的安装 以及软件的基本配置 ##
    
    software_install.sh



##2. 安装个人偏好设置相关的 Github 仓库 ##
    
    git_repositories_install.sh


##3. Vim 相关环境配置 ##
    
    vim_config.sh
    vim/
        config/ # 在vimrc文件中引用的配置文件列表
                plugin_config.vim  # 插件列表以及配置文件
                common_settings.vim # vim 的通用设置
                function_config.vim # 个人定制函数文件
                filetype_config.vim # 个人文件类型配置文件
                common_mappings.vim # 个人键映射偏好配置文件
                common_abbrevs.vim # 个人缩写偏好配置文件

                
        colors/ # Vim 配色方案文件目录
                ...
        after/
            ftplugin/
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
            templates.vim

        templates/ # 文件类型的新建文件模板
            html
            xhtml
            python
            sh
            zsh


