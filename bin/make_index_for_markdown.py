#!/usr/bin/python
# encoding:utf-8

def make_index_for_markdown(filename):
    import re
    header_lines=[]
    content_lines=[]

    print filename
    with open(filename, mode='r+') as fd:

        for line in fd.readlines():
#            print line
            header=re.findall('#+([^#]+)#+', line)
            if header:
                header_lines.append(header[0].strip(' '))
            content_lines.append(line)
            
    with open(filename, mode='w') as fd:

        for header in header_lines:
            if ' ' not  in header:
                continue
            level, title=header.split(' ', 1)
            print ("%s [%s](#%s)"%(level, title,title.lower()))
            fd.write("%s [%s](#%s) \n"%(level, title, level.replace('.','')+"-"+title.lower().replace(' ','-')))
        fd.write("\n")
        for line in content_lines:
            fd.write(line)

#    fd=open(filename )
#    print "doing"
#    index_lines=[]
#    for line in fd.readlines():
#        print line
#        header=re.findall('#+(\w+)#+',line)
#        if len(header) == 0:
#            continue
#        header_name=header[0].strip(' ')
#        index_lines.append(header_name)
#    for index in index_lines:
#        print index,'\n'


if __name__ == "__main__":
    import sys
    import os

    if len(sys.argv)<2:
        print "Usage %s filename,..." % os.path.basename(__file__)
    else:
        for f in sys.argv[1:]:
            if os.path.exists(f):
                print "Processing filename: %s" % f
                make_index_for_markdown(f)
            else:
                print "File <%s> not exists" % f
    




    
    
