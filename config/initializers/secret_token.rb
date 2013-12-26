# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#SampleApp::Application.config.secret_key_base = 'a85ccbba05ba23f106d31e7a28785aa2fdfedff1ee013e16aeca6f930dbf3ba53a60cf5632bbccecbbaa1ba1f2c475bc77a9d2c1f3c0f930ee64a40a4df1eed7'

require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
		# Use the existing token
		File.read(token_file).chomp
	else
		#	Generate a new token and store it in token_file
		token = SecureRandom.hex(64)
		File.write(token_file, token)
	end 
end

SampleApp::Application.config.secret_key_base = secure_token
