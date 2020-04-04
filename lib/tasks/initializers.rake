desc 'Generates a secret token for the application.'

file 'config/initializers/secret_token.rb' do
  path = File.join(Rails.root, 'config', 'initializers', 'secret_token.rb')
  secret = SecureRandom.hex(40)
  File.open(path, 'w') do |f|
    f.write <<"EOF"
# This file was generated by 'rake generate_secret_token', and should
# not be made visible to public.
# If you have a load-balancing Redmine cluster, you will need to use the
# same version of this file on each machine. And be sure to restart your
# server when you modify this file.
#
# Your secret key for verifying cookie session data integrity. If you
# change this key, all old sessions will become invalid! Make sure the
# secret is at least 30 characters and all random, no regular words or
# you'll be exposed to dictionary attacks.
RedmineApp::Application.config.secret_key_base = '#{secret}'
EOF
  end
end

desc 'Generates a secret token for the application.'
task :generate_secret_token => ['config/initializers/secret_token.rb']
