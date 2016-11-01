
#!/bin/bash 
# 

if [ $# -eq 0 ]; then
     foreman run bundle exec rake db:create     
     foreman run bundle exec rake db:migrate     
     foreman run bundle exec rake db:seed  
     
     exec foreman start "$@"
else
    exec "$@" 
fi