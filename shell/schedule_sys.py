#!/usr/bin/env python3
# encoding:utf-8

# 个人偏好系统调度器程序

import os
import schedule
import time

project_base = os.path.expanduser("~/projects")
sep = os.path.sep


def update_projects():
    projects = os.listdir(project_base)
    for project in projects:
        if project.startswith("."):
            print("hidden project :%s ignored" % (sep.join([project_base, project])))
            continue
        project_path = sep.join([project_base, project])

        if not os.path.exists(sep.join([project_path, '.git'])):
            print("project: %s is not a git repository" % (project_path))
            continue
        print("=========Updating: %s===========" % (project_path))
        os.chdir(project_path)
        # os.system('''
        #     if [[ -z $(git status| grep "nothing") ]]; then
        #         printf "Updating project: %-s\n" $pro
        #         git add -A ; git commit -m 'push by shutdown'; git push origin master;
        #     fi
        #     ''')
        os.system('git add -A; git commit -m "commit by schedule"; git push origin master')
  

if __name__ == "__main__":

    # 每隔30分钟调用一次程序更新本地项目文件
    schedule.every(1).minutes.do(update_projects)

    while True:
        schedule.run_pending()
        time.sleep(1)
