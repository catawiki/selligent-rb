# Selligent Ruby API client

## Configure

```ruby
Selligent.configure do |c|
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

### Lists

```ruby
# Returns an overview of all of the lists in this organization
Selligent.lists(options = {})

# Create a new list
Selligent.create_list(model)

# Delete a list
Selligent.delete_list(list_name, options = {})

# Get details for the list with the given name
Selligent.list(list_name)

# Update a list
Selligent.update_list(list_name, model)

# Get list fields for the given list
Selligent.fields(list_name)

# Create list fields
Selligent.create_fields(list_name, model)

# Delete a list field
Selligent.delete_field(list_name, field_name)

# Update a list field
Selligent.update_field(list_name, field_name, model)

# Get the number of records for the given list
Selligent.records_count(list_name)

# Delete a single record by id
Selligent.delete_record(list_name, record_id)

# Get all relations associated with a list
Selligent.relations(list_name)

# Create a relation between two lists
Selligent.create_relation(list_name, model)

# Delete a relation between two lists
Selligent.delete_relation(list_name, scope)

# Get relation details based based on the list name and the relation scope name
Selligent.relation(list_name, scope)

# Update an existing relation
Selligent.update_relation(list_name, scope, model)

# Get an overview of the segments defined on the given list
Selligent.segments(list_name, options = {})

# Get segment details based on list API name and segment API name
Selligent.segment(list_name, segment_name)
```

## Develop

Please take a look at https://github.com/catawiki/selligent/pull/9 and use it as a
blueprint for adding other endpoints. Don't forget to update the readme as well.

