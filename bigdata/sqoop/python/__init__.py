# -*- coding:utf-8 -*-

__author__ = 'wanggen'

import os
from MySQLdb import Connection

conn = Connection(host='wg-linux', user='wanggen', passwd='wanggen', db='groupon', charset='utf8')

cursor = conn.cursor()

cursor.execute('select * from ecp_orders limit 10')


cursor.close()

a="""
 ls -l ../
"""
files = os.popen(a).read()

with open('test', mode='wr') as f:
    f.write(files)
