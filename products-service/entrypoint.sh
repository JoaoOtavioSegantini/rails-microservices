#!/bin/bash

# turn on bash's job control
set -m

# Start the primary process and put it in the background
bundle install && bin/rails db:create && bin/rails db:migrate && bundle exec unicorn -c config/unicorn.rb &

# Start the helper process
nginx -g 'daemon off;' 

# the my_helper_process might need to know how to wait on the
# primary process to start before it does its work and returns


# now we bring the primary process back into the foreground
# and leave it there
fg %1
