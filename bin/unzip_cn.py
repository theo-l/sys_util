#!/usr/bin/env python

# -*- encoding: utf-8 -*-

import os
import sys
import zipfile

def unzip_cn_file(filename):
    with zipfile.ZipFile(filename,'r') as fd:
        for name in fd.namelist():
            utf8name = name.decode('gbk')
            print(utf8name)
            print(u"Extracting: {}".format(utf8name))
            pathname = os.path.dirname(utf8name)
            print(pathname)
            if pathname and not os.path.exists(pathname):
                os.makedirs(pathname)

            data = fd.read(name)
            if not os.path.exists(utf8name):
                with open(utf8name,'w') as fo:
                    fo.write(data)


if __name__ =='__main__':
    filename = sys.argv[1]
    print("Processing File:{}".format(filename))
    unzip_cn_file(filename)
