git add .
git commit -m auto

git_push(){
    git push
    if [ $? -eq 0 ]; then
        echo "succeed"
    else
        git_push
    fi  
}
git_push

