#FIXME replace 1.2.3.4 with your IP addressss
server '44.206.224.108', user: 'deploy', roles: %w{web app db}
set :rails_env, 'production'

