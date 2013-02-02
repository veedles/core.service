# RESTful core.service

A REST API for configuring channels, domains and websites.

## Developer Environment Setup

```
bundle exec rake db:migrate
bundle exec rake db:dev_seed
```

## Running Tests

```
rake test
```

## Running the Service

```
rake start
```
The service will be available at http://localhost:1111/

## Service Endpoints:

(password is '1234')

1. http://localhost:1111/api/v1/channels.json
2. http://localhost:1111/api/v1/domains.json
3. http://localhost:1111/api/v1/configuration/all.json
