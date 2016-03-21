BASE_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [ `uname` = "Linux" ];then
    export OS="linux"
    mkdir $BASE_DIR/$OS
    # git-prompt.sh
    curl -fLo $BASE_DIR/$OS/git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
    # git-completion.bash
    curl -fLo $BASE_DIR/$OS/git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
else
    export OS="macosx"
    ln -sfh /usr/local/etc/bash_completion.d/ $BASE_DIR/$OS
fi
