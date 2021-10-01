
![](https://img.shields.io/badge/TucuSoft-Software%20Solutions-red)

# Booking services with providers API

## Objective

This project is created as a challenge for a job offer.

## Features

- This service lets clients book appointments with providers
- The service requires you signup with a username and password for security
- After singning-in, you get a JWT token, which you must include in every request, if not, the service considers the request invalid.
- The JWT token is valid for an hour
- Every user has a role: Admin, Client or Provider. By default, the Client role is provided if none specified (view the endpoints details further below)
- All requests are responded with JSON objects.


## Enhancements To-Do list

- UI for admin staff
- Variety of reports
- Recover password
- Booking appointments for a range of days (as of now, users can only book appointments for one day)

## Live link

Refer to the endpoints section where you will get the base URL for testing the API.
The backend is hosted on Heroku.

## Endpoints

[Click here](./wiki/endpoints.md)


## Repository

- You can find the repo [here](https://github.com/MiguelArgentina/ror-appointments-api).

## Built With

- Ruby 2.7.2
- Rails 6.1.4.1

## Prerequisites
- Ruby 3.0.
- Rails 6.1.3
- Postgres: >=9.5
- Node.js
- Yarn

## Getting started

- Open your terminal - Windows: `Win + R`, then type `cmd` | Mac: `Command + space`, then type `Terminal`
- Navigate to a directory of your choosing using the `cd` command
- Run this command in your OS terminal: `git clone ggit@github.com:MiguelArgentina/ror-appointments-api.git` to get a copy of the project.
- Navigate to the project's directory using the `cd` command
- Install gems with: `bundle install`  
- Setup database with:

```
   rails db:create
   rails db:migrate
```
- Fill in the database with test data using:

```
   rails db:seed
```

### Usage

- Start server with:

```
    rails server
```

- Open `http://localhost:3000/` in your browser to see server interaction with user requests.
- You can use  `curl` commands for sending requests or [Postman](https://www.postman.com/downloads/). Remember to add the authorization token received after sing-in for every request you make. **Refer to endpoints section to get a list of all available options**


## Author

👤 &nbsp; **Miguel Ricardo Gomez**

- GitHub: [@MiguelArgentina](https://github.com/MiguelArgentina)
- Twitter: [@Qete_arg](https://twitter.com/Qete_arg)
- LinkedIn: [Miguel Ricardo Gomez](https://www.linkedin.com/in/miguelricardogomez/)

<br>

## Show your support

Give a ⭐️ &nbsp; if you like this project!


## Acknowledgments

- Thanks to [GreekDataGuy](https://greekdataguy.medium.com/) for his excellent [Devise-JWT Tutorial](https://medium.com/ruby-daily/a-devise-jwt-tutorial-for-authenticating-users-in-ruby-on-rails-ca214898318e). 

## License

Available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).