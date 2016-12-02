#!/usr/bin/env python3
# encoding:utf-8

# 个人偏好系统调度器程序

import os
import schedule
import time
from git import Repo

# 个人 git 项目所在目录
PROJECT_BASE = os.path.expanduser("~/projects")
sep = os.path.sep


def update_projects():
    # 更新个人项目目录中的所有项目目录
    project_names = os.listdir(PROJECT_BASE)
    for project_name in project_names:
        if project_name.startswith("."):
            print("Directory:%s ignored" %
                  (sep.join([PROJECT_BASE, project_name])))
            continue
        project_path = sep.join([PROJECT_BASE, project_name])

        if not os.path.exists(sep.join([project_path, '.git'])):
            print("project: %s is not a git repository" % (project_path))
            continue

        os.chdir(project_path)
        repo = Repo(project_path)
        if repo.is_dirty():
            print("=========Updating: %s " % (project_path))
            os.system(
                '''
                git add -A;
                git commit -m "commit by schedule";
                git push origin master
                '''
            )
        else:
            print("----------Repository {%s} is clean" % (project_path))


def rest_notification():
    import subprocess
    subprocess.Popen(['notify-send', "It's time to have a rest!"])
    return


def shutdown_notification():
    import subprocess
    subprocess.Popen(
        ['notify-send', "Now it is time to shutdown the computer"])
    os.system('suso shutdown -h 0')


if __name__ == "__main__":

    # 每隔30分钟调用一次程序更新本地项目文件
    schedule.every(30).minutes.do(update_projects)
    schedule.every(1).minutes.do(rest_notification)
    schedule.every().day.at('19:31').do(shutdown_notification)

    while True:
        schedule.run_pending()
        time.sleep(1)
