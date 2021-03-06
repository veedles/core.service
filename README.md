# RESTpack core.service [![Build Status](https://travis-ci.org/RESTpack/core.service.png)](https://travis-ci.org/RESTpack/core.service) [![Dependency Status](https://gemnasium.com/RESTpack/core.service.png)](https://gemnasium.com/RESTpack/core.service)

A REST API for configuring channels, applications and domains.

**Channels** are a way of partitioning your users and data. You may have one channel called 'Coffee Roulette App' and another called 'Tech Jobs Websites'. Channels can contain multiple applications and these will share data such as user accounts etc.

**Applications** have names such as 'Ruby Jobs', 'Python Jobs' and 'Coffee Roulette'. They belong to a channel and can have multiple domains.

**Domains** are the endpoints to your application. Some examples are 'www.rubyjobs.io', 'api.rubyjobs.io', 'auth.rubyjobs.io'.

**Configurations** are key => values which can belong to a Channel, Application, Domain or be global. The key is a string such as 'omniauth' and the value can be any JSON structure.

## Developer Environment Setup

```
bundle install
rake db:migrate
rake db:dev_seed
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

(password is '1234', username can be anything, to log out just visit http://foo@localhost:1111/)

1. http://localhost:1111/api/v1/channels.json
2. http://localhost:1111/api/v1/domains.json
3. http://localhost:1111/api/v1/configuration/all.json
