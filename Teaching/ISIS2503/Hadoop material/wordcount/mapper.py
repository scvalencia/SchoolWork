#!/usr/bin/env python

import sys
import json

for line in sys.stdin:
    line = line.strip()
    line = json.loads(line)
    try:
        if not line['lang'] == 'en':
            continue
        line = line['text']  # extract the tweet
        words = line.encode('ascii', 'ignore') # handle non-ascii values
    except KeyError:
        continue  # skip any dicts without text
    words = words.split()
    for word in words:
        if word:
            print "%s\t%s" % (word, 1)
        
