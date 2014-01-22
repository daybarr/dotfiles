#!/usr/bin/env python

import os

IGNORE = ['.gitignore', '.git']

if __name__ == "__main__":
    this_dir = os.path.abspath(os.path.dirname(__file__))
    home_dir = os.environ['HOME']
    for dotfile in (f for f in os.listdir(this_dir)
                    if f not in IGNORE and f.startswith('.')):
        home_file = os.path.join(home_dir, dotfile)
        repo_file = os.path.join(this_dir, dotfile)
        if not os.path.exists(home_file):
            print "  Linking {0} => {1}".format(home_file, repo_file)
            os.symlink(repo_file, home_file)
            continue
        if not os.path.islink(home_file):
            print "WARNING: {0} already exists".format(home_file)
            continue
        real_home_file = os.path.realpath(home_file)
        real_repo_file = os.path.realpath(repo_file)
        if real_home_file != real_repo_file:
            print "WARNING: {0} already links elsewhere: {1}".format(
                home_file, os.path.realpath(home_file))
        else:
            print "  Done: {0} => {1}".format(home_file, repo_file)
