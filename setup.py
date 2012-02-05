#!/usr/bin/env python

import os

IGNORE = ['.gitignore', '.git']

if __name__ == "__main__":
    this_dir = os.path.dirname(__FILE__)
    print this_dir
