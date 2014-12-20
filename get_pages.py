#! /usr/bin/env python
# -*- coding: utf-8 -*-
import urllib2
from modules import json_io

pages = json_io.read_json('urls.json')

for category, urls in pages.iteritems():
    page_count = 0
    for url in urls:
        page_count += 1
        file_name = category + str(page_count)
        with open('pages/' + file_name, 'w') as output_file:
            page = urllib2.urlopen(url).read()
            output_file.write(page)
