#FIXME replace 1.2.3.4 with your IP addressss
server '44.201.239.155', user: 'deploy', roles: %w{web app db}
set :rails_env, 'production'

