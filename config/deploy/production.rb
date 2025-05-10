#FIXME replace 1.2.3.4 with your IP addressss
server '98.84.163.2', user: 'deploy', roles: %w{web app db}
set :rails_env, 'production'

