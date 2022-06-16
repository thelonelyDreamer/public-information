git checkout --orphan latest_branch
git add -A
git commit -am "auto clear history"
git branch -D master
git branch -m master

git_push(){
    git push -f origin master
    if [ $? -eq 0 ]; then
        echo "succeed"
    else
        git_push -f origin master
    fi  
}
git_push

git push --set-upstream origin master

