#!/usr/bin/env python3
# encoding:utf-8

import os
import schedule
import time

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
        print("=========Updating: %s==========="%(project_path))
        os.chdir(project_path)
        os.system('git add -A; git commit -m "commit by schedule; git push origin master"')


if __name__ == "__main__":
    schedule.every(30).minutes.do(update_projects)
    schedule.every().day.at('23:51').do(update_projects)

    while True:
        schedule.run_pending()
        time.sleep(1)
