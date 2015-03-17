#!/bin/sh


set -e

if [ $# -lt 1 ]; then
 echo -e "\033[31m You must assign a target dir!\033[0m" && exit 0
fi

APP=$1
BRI=wanggen@10.211.55.2:/Users/wanggen/

tar -czvf ${APP}.tar.gz ${APP}

scp ${APP}.tar.gz ${BRI}

rm ${APP}.tar.gz

echo -e "\033[31mStarting scp $APP to 10.0.0.8 ... \033[0m"

ssh wanggen@10.211.55.2 <<EOF
    scp ${APP}.tar.gz admin@10.0.0.8:/home/admin/dockerfiles && echo 'Scp finished'  &&\
    rm ${APP}.tar.gz && \
    ssh admin@10.0.0.8 \
        'cd /home/admin/dockerfiles &&\
           mv $APP $APP-bak && tar zxvf $APP.tar.gz &&\
           rm $APP.tar.gz &&\
           rm -rf $APP-bak
        '
EOF


echo -e "\033[32mDeploy finished!\033[0m"