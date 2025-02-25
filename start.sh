rm -rf temp_repo
git clone $REPO_URL temp_repo
mv temp_repo/* temp_repo/.* .
rm -rf temp_repo

./run.sh
