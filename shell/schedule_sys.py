#!/usr/bin/python
# encoding:utf-8

import os

project_base=os.path.expanduser("~/projects")
sep=os.path.sep

def update_projects():
    projects=os.listdir(project_base)
    for project in projects:
        if project.startswith("."):
            print("hidden project :%s ignored"%(sep.join([project_base,project])))
            continue
        project_path=sep.join([project_base, project])

        if not os.path.exists(sep.join([project_path,'.git'])):
            print("project: %s is not a git repository" %(project_path))
            continue
        os.chdir(project_path)
        os.system('git add -A; git commit -m "commit by schedule; git push origin master"')


if __name__ == "__main__":
    update_projects()
