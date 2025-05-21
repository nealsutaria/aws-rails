#FIXME replace 1.2.3.4 with your IP addressss
server '44.203.57.4', user: 'deploy', roles: %w{web app db}
set :rails_env, 'production'

