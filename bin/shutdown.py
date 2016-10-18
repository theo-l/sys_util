#!/usr/bin/python
# -*- coding=utf-8 -*-

from shell_runner import run_shell

repos=[
        "~/gitworkspace/.dotfiles/",
        "~/gitworkspace/.notes/",
        "~/gitworkspace/.blog/",
        "~/gitworkspace/.doc/",
        "~/gitworkspace/css/",
        "~/gitworkspace/javascriptTutorial/",
        "~/gitworkspace/portugues/",
        "~/gitworkspace/theo-l.github.io/",
        "~/gitworkspace/django18_doc_cn/",
        "~/pythonworkspace/python2/workspace/journey/"
       ]

def update_git_remote_repos():
    
    for repo in repos:
        run_shell("cd %s"%(repo))
        run_shell('git add -A && git commit -m "upload on shutdown" && git push origin master;')

def turn_off():
    print "--------------------","tunrn off computer", "--------------------"
    run_shell('sudo shutdown -h 0')

if __name__ =="__main__":
    
    update_git_remote_repos()
    turn_off()
        
