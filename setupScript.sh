# This is a simple script for update hugo web page hosted on gitea
# Due to the bad documentation of Gitea and Drone, this is a partial solution

BASE_DIR="PATHOFHUGOREPO/"

logger "[ea4rct-web] Updating git repository on $BASE_DIR"
cd $BASE_DIR
git checkout master
git pull

logger "[ea4rct-web] Building web page"
hugo
