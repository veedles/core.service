# RESTful core.service

A REST API for configuring channels, domains and websites.

## Developer Environment Setup

bundle exec rake db:migrate
bundle exec rake db:dev_seed

rake start

The service will be available at http://localhost:1111/

## Service Endpoints:

(password is '1234')

http://localhost:1111/api/v1/channels.json
http://localhost:1111/api/v1/domains.json
http://localhost:1111/api/v1/configuration/all.json