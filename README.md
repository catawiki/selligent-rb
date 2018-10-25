# Selligent Ruby API client

## Configure

```ruby
Selligent.configure do |c|
  c.username = 'the_user'
  c.host = 'www.selligent.com'
  c.api_key = 'key'
  c.api_secret = 'secret'
  c.organization = 'catawiki'
end
```

## Endpoints

### Transactional

```ruby
# List all transactional journeys
Selligent.transactionals

# Returns information on the transactional journey with the given name
Selligent.transactional(name)

# Sends transactional messages to the journey with the given name. See rdoc for model
# definition.
Selligent.send_transactional(name, model)

# Create or update a user profile and trigger a transactional message. See rdoc for model
# definition.
Selligent.update_profile_and_send_transactional(api_name, model)

# Get a list of status objects for the given message ids
Selligent.transactionals_status(ids)

# Get the status of a given message
Selligent.transactional_status(id)
```

## Develop

Please take a look at https://github.com/catawiki/selligent/pull/9 and use it as a
blueprint for adding other endpoints. Don't forget to update the readme as well.

