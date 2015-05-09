#!/usr/bin/env bash
. sqoop-env.sh

sqoop job --list | grep '^ *job_'  > jobs

echo "#!/usr/bin/env bash" > jobs_delete.sh
echo ". sqoop-env.sh" >> jobs_delete.sh
sqoop job --list | grep "^ *job_" | awk '{print "sqoop job --delete",$0}'  >> jobs_delete.sh
chmod 777 jobs_delete.sh