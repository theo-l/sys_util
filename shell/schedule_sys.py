#!/usr/bin/env python
# encoding:utf-8

# 个人偏好系统调度器程序

import os
import schedule
import time
from git import Repo

# 调度器的时间间隔单位
SECONDS = 'seconds'
MINUTES = 'minutes'
HOURS = 'hours'
DAYS = 'days'
WEEKS = 'weeks'

# 星期日期
MONDAY = 'monday'
TUESDAY = 'tuesday'
WEDNESDAY = 'wednesday'
THURSDAY = 'thursday'
FRIDAY = 'friday'
SATURDAY = 'saturday'
SUNDAY = 'sunday'

# 个人 git 项目所在目录
PROJECT_BASE = os.path.expanduser("~/projects")
sep = os.path.sep


def schedule_job(interval=None, unit=None, at=None, start_day=None):

    def job_wrapper(func):
        # schedule at a specific time of weekday or day or hour
        if at is not None:
            if start_day is not None and unit is None:
                if hasattr(schedule.every(), start_day):
                    getattr(schedule.every(), start_day).at(at).do(func)
            if unit == DAYS:
                getattr(schedule.every(), DAYS).at(
                    at).do(func)
            if unit == HOURS:
                getattr(schedule.every(), HOURS).at(
                    at).do(func)

            # schedule job loop for every interval
        else:
            _interval = interval if interval is not None else 1

            if unit in [SECONDS, MINUTES, HOURS]:
                getattr(schedule.every(_interval), unit).do(func)

        def job_func(*args, **kwargs):

            func(*args, **kwargs)

        return job_func

    return job_wrapper


#@schedule_job(interval=1, unit=MINUTES)
def schedule_test():
    print("Testing Schedule ")

ignored_repos = [
        "jco-backend-python", 
        "dangyuan-python",
        'dangyuan',
        'taiga-back',
        'taiga-events',
        'taiga-front-dist',
        'taiga-front'
        ]

@schedule_job(interval=90, unit=MINUTES)
def update_projects():
    # 更新个人项目目录中的所有项目目录
    project_names = os.listdir(PROJECT_BASE)
    for project_name in project_names:
        
        # 这些目录软件仓库不需要自动更新
        if project_name in ignored_repos:
            continue
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


@schedule_job(interval=1, unit=HOURS)
def rest_notification():
    import subprocess
    subprocess.Popen(['notify-send', "It's time to have a rest!"])
    return


@schedule_job(at="21:00")
def shutdown_notification():
    import subprocess
    subprocess.Popen(
        ['notify-send', "Now it is time to shutdown the computer"])
    # os.system('sudo shutdown -h 0')
    return


if __name__ == "__main__":

    # 每隔30分钟调用一次程序更新本地项目文件
    # schedule.every(30).minutes.do(update_projects)
    # schedule.every(60).minutes.do(rest_notification)
    # schedule.every().day.at('22:10').do(shutdown_notification)

    while True:
        schedule.run_pending()
        time.sleep(1)
