# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
EventsManager::Application.config.secret_key_base = 'b128f05bf1b0986983606d15391e1d82531cd4fef239e3a67c6f15eaec74efd97450eabd70760cf87aaa9adb5779f14d1a15883b69665f42fd492811524822e6'
