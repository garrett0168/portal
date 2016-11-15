#!/bin/bash 
# 
DB_READY=1
DB_CHECK_COUNT=0
DB_MAX_CHECKS=15

# Temp workaround until db/web race condition can be solved.
sleep 10s

if [ $# -eq 0 ]; then

     # Wait for db to be fully ready, with timeout
     while [ $DB_READY -ne 0 ] 
     do 
        sleep 2
        netcat -z db 5432
        DB_READY=$?
        ((DB_CHECK_COUNT++))
        if [ $DB_CHECK_COUNT -gt $DB_MAX_CHECKS ]
        then
         exit 1
        fi
     done

     foreman run bundle exec rake db:create     
     foreman run bundle exec rake db:migrate     
     foreman run bundle exec rake db:seed  
     
     exec foreman start 
else
    exec "$@"
fi

