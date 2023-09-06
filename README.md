# Selligent Ruby API client

## Install

Install via Rubygems

```bash
gem install selligent
```

... or add to your Gemfile

```ruby
gem 'selligent', '~> 0.1'
```

Access the library in Ruby:

```ruby
require 'selligent'
```

## Configure

```ruby
Selligent.configure do |c|
  c.host = 'www.selligent.com'
  c.api_key = 'key'
  c.api_secret = 'secret'
  c.organization = 'catawiki'
end
```

## API Documentation

To generate API documentation, use yard:

```ruby
yard
```

Documentation can be found in /path/to/selligent/doc/index.html

## Endpoints

### Organization

```ruby
# Get an overview of all organizations
Selligent.organizations

# Get details on the current organization
Selligent.organization
```

### Content

```ruby
# Create simple (HTML only) single language email message content
Selligent.create_email(model, params = {})

# Create mobile push message content
Selligent.create_push_message(model, params = {})

# Create simple page content
Selligent.create_page(model, params = {})

# Create SMS content
Selligent.create_sms(model, params = {})
```

### Journey

```ruby
# Get an overview of all journeys
Selligent.journeys
```

### Single Batch

```ruby
# Get all journeys of type Single Batch
Selligent.single_batches

# Create a Single Batch journey
Selligent.create_single_batch(model)

# Get information on a Single Batch journey
Selligent.single_batch(name)

# Cancel launching of a single batch
Selligent.cancel_single_batch(name)

# Launch a single batch
Selligent.launch_single_batch(name, request)

# Trigger execution of a single batch journey
Selligent.trigger_single_batch(name, model)

# Send single batch with email message
Selligent.send_single_batch_email(model)

# Send single batch mobile push message
Selligent.send_single_batch_push(model)

# Send single batch sms
Selligent.send_single_batch_sms(model)
```

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


### Transactional Bulk

```ruby
# Trigger a bulk journey in a transactional way
Selligent.send_transactional_bulk(name)
```

### Lists

```ruby
# Get an overview of all of the lists
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

# Get relation details based on the list name and the relation scope name
Selligent.relation(list_name, scope)

# Update an existing relation
Selligent.update_relation(list_name, scope, model)

# Get an overview of the segments defined on the given list
Selligent.segments(list_name, options = {})

# Get segment details based on list API name and segment API name
Selligent.segment(list_name, segment_name)
```

### Data

```ruby
# Delete data from the list with the given api-name
Selligent.delete_data(api_name, data, params = {})

# Load data into the list with the given api-name
Selligent.load_data(api_name, data, params = {})

# Search for data records in a specific table
Selligent.search_data(api_name, request, params = {})

# Delete data from the segment with the given segment-api-name
Selligent.delete_data_from_segment(api_name, segment_api_name, data, params = {})

# Load data into the segment using given segment-api-name
Selligent.load_data_into_segment(api_name, segment_api_name, data, params = {})

# Search for data records within a segment of specific table
Selligent.search_data_within_segment(api_name, segment_api_name, request, params = {})
```

### Stored Procedure

```ruby
# Get list of stored procedures
Selligent.stored_procedures(options = {})

# Get details of stored procedure by name
Selligent.stored_procedure(name)
```

### Task

```ruby
# Get collection of tasks
Selligent.tasks(options = {})

# Get task details
Selligent.task(task_name)

# Get actions of task
Selligent.task_actions(task_name)

# Disable a task
Selligent.disable_task(task_name)

# Enable a task
Selligent.enable_task(task_name)

# Run a task
Selligent.run_task(task_name)
```

### Cumulio

```ruby
# Get datasets
Selligent.cumulio_datasets

# Run a cumulio query
Selligent.cumulio_query(model)
```

### Custom journey

```ruby
# Trigger custom journey. Reffer to the docs from CRM team for input.
Selligent.trigger_custom_journey(api_name, entrypoint_name, input)
```

### Status

```ruby
# Get the Selligent status
Selligent.status
```


## Develop

Please take a look at https://github.com/catawiki/selligent/pull/9 and use it as a
blueprint for adding other endpoints. Don't forget to update the readme as well.
