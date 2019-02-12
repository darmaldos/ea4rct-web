#! /bin/bash
#This is a simple script for update hugo web page hosted on gitea
# Due to the bad documentation of Gitea and Drone, this is a partial solution
#
# YOU HAVE TO SET BASE_DIR AS A ENV VARIABLE LIKE THIS `export WEB_BASE_DIR="PATHOFHUGOREPO/"``

#Check the existance of env variable, if not, set a default value
BASE_DIR="${WEB_BASE_DIR:-PATHOFHUGOREPO/}"

logger "[ea4rct-web] Updating git repository on $BASE_DIR"
cd $BASE_DIR
git checkout master
git pull

logger "[ea4rct-web] Building web page"
hugo
