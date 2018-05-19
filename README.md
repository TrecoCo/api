[![CircleCI](https://circleci.com/gh/TrecoCo/api.svg?style=svg)](https://circleci.com/gh/TrecoCo/api)

# Treco

Rails API for Treco

#### Setup
To run the API, follow the steps below:
```shell
bundle install
bundle exec figaro install
```

After this, execute the following steps:
```shell
rails db:create db:migrate
```
Finally, run the API:
```shell
rails s
```

#### Tests and coverage
Run the tests using:
```shell
bundle exec rspec
```
You can check the coverage for the project opening the `coverage/index.html` generated every time you run the RSpec.

#### Commit
Before pushing a commit, be sure to run the Rubocop and tests:
```shell
rubocop -a
bundle exec rspec
```