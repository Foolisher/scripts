#!/usr/bin/env bash
. list-jobs.sh

_jobs=$1
jobs_file=${_jobs:='jobs'}

for job in `cat ${jobs_file}`;do
	sqoop job --exec ${job} >> job-exec-`date +'%F'`.log 1>>job-exec-`date +'%F'`.log 2>>job-exec-`date +'%F'`.log
	rm `echo ${job} | sed "s/job_.*imp_\(.*\)/\1.java/"`
done
