export EDITOR=vim
export GOPATH=~/code/go
export PATH="${GOPATH}/bin:${PATH}"
alias g='git'
alias v='vim'
alias fd='find . -type d -name'
alias ff='find . -type f -name'
alias ffg='find . -type f -print0 | xargs -0 grep'
docker-backup-volume() { docker run --rm -v ${1}:/vol -v ${PWD}:/bkp pierreprinetti/bash -c "tar zcvf /bkp/${1}.tar -C /vol ."; }
docker-restore-volume() {
        filepath=$(realpath ${1});
        filename=$(basename "$filepath");
        volname="${filename%.*}";
        echo "filepath: ${filepath}";
        echo "filename: ${filename}";
        echo "volname: ${volname}";
        docker run --rm -v ${volname}:/vol -v ${filepath}:/bkp/${filename} pierreprinetti/bash -c "tar xzvf /bkp/${filename} -C /vol";
}
docker-purge-volumes() { docker volume rm $(docker volume ls -qf dangling=true) }
