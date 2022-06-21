# 保证提交成功
git_push(){
    echo -e "\033[31m `pwd` push $1 times  \033[0m"
    git push
    if [ $? -eq 0 ]; then
        echo "succeed"
    else
        if [ $1 -lt 15 ]; then
            git_push $[$1+1]
        else
            echo `pwd` >> ~/auto-git-err.log
            echo -e '\r\n' >> ~/auto-git-err.log
        fi
    fi  
}

# 自动提交
auto_commit(){
    git add .
    git commit -m auto
    git_push 1
}

# 定义一个根目录数组
root_arr=("gitee" "github")

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

if [ -f ~/auto-git-err.log ]; then
    cat ~/auto-git-err.log
    exit -1
fi 


for root_dir in ${root_arr[@]}
do
    push_dir $root_dir
done