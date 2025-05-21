#FIXME replace 1.2.3.4 with your IP addressss
server '3.94.170.178', user: 'deploy', roles: %w{web app db}
set :rails_env, 'production'

