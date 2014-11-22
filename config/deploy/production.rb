set :stage, :production

# Replace 127.0.0.1 with your server's IP address!
server '188.226.157.101', user: 'deploy', roles: %w{web app}
