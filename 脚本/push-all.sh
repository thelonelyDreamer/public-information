# 保证提交成功
git_push(){
    git push
    if [ $? -eq 0 ]; then
        echo "succeed"
    else
        git_push
    fi  
}

# 自动提交
auto_commit(){
    echo -e "\033[31m `pwd` \033[0m"
    git add .
    git commit -m auto
    git_push
}

# 定义一个根目录数组
root_arr=("github" "gitee")

# 进入一个目录，如果是仓库目录，则提交，如果不是，则遍历子目录，遍历完成退出
push_dir(){
    cd $1
    if [ -d .git ]; then
        auto_commit
        echo "auto_commit"
    else
        for file in `ls .`
        do 
            if [ -d $file ]; then
                push_dir $file
            fi
        done
    fi 
    cd ..
}

for root_dir in ${root_arr[@]}
do
    push_dir $root_dir
done