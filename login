import twitter

# Provide your Twitter API credentials
consumer_key = 'YOUR_CONSUMER_KEY'
consumer_secret = 'YOUR_CONSUMER_SECRET'

# Create an OAuth handler
auth = twitter.oauth.OAuth('', '', consumer_key, consumer_secret)

# Get the authorization URL
twitter_auth = twitter.Twitter(auth=auth)
auth_url = twitter_auth.get_authorization_url()

# Print the authorization URL and instruct the user to visit it
print("Please visit the following URL to authorize the application:")
print(auth_url)

# After the user authorizes the application, obtain the verifier code
verifier = input("Enter the verification code: ")

# Get the access tokens
access_token = twitter_auth.get_access_token(verifier=verifier)

# Use the access tokens for API requests
api = twitter.Twitter(auth=twitter.oauth.OAuth(access_token[0], access_token[1], consumer_key, consumer_secret))

# Example API request
tweets = api.statuses.user_timeline(screen_name='your_screen_name')
for tweet in tweets:
    print(tweet['text'])
