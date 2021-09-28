
![](https://img.shields.io/badge/TucuSoft-Software%20Solutions-red)

# Booking services with providers API

## Objective

This project is created as a challenge for a job offer.

## Features

- This service lets clientes book appointments with providers
- The service requires you signup with a username and password for security
- After singning-in, you get a JWT token, which you must include in every request, if not, the service considers the request invalid.
- The JWT token is valid for an hour after the last usage
- Every user has a role: Admin, Client or Provider. By default, the Client role is provided if none specified (view the endpoints details further below)
- All requests are responded with JSON objects.

Try it, share it with your family and compete against each other!

- Extra feature added: Users scoreboard


## Enhancements To-Do list

- UI for admin staff
- Variety of reports
- Recover password
- 
- 
-



## Live link

Visit [Book-Provider-Services API](h#).
The backend is hosted in Heroku.
## Endpoints

- `/users`: This is the sign-up enpoint. Must receive a request like:
```
  curl -XPOST -H "Content-Type: application/json" -d '{ "user": { "email": "test@example.com", "password": "123456" } }' http://localhost:3000/users
```
Response:
```
{"message":"Signed up sucessfully."}
```

-`/sign_in`: This is the login enpoint. Must receive a request like:
```
  curl -XPOST -i -H "Content-Type: application/json" -d '{ "user": { "email": "test@example.com", "password": "123456" } }' http://localhost:3000/users/sign_in
```
Response:
<pre>
HTTP/1.1 200 OK
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Permitted-Cross-Domain-Policies: none
Referrer-Policy: strict-origin-when-cross-origin
Content-Type: application/json; charset=utf-8
Vary: Accept, Origin
Authorization: <b>Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjIwNDkzOTUzLCJleHAiOjE2MjA0OTc1NTMsImp0aSI6IjlmZjkzMDA2LTAxNTMtNDc5YS1hYjY2LTZiMDBhOWU2NjM1ZCJ9.K6oHIUI0AuZ4HfDV1iElFe9OZoMh_st3l1rfhD0PIqY</b>"
ETag: W/"4f46b654dd4b5ef6187f2663ef5a55c4
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 498ef50b-4bbb-44b6-9b39-dd45d03aa7b4
X-Runtime: 0.293374
Transfer-Encoding: chunked

{ message: 'You are logged in. Your token will be valid for one hour after las use. After that you need to sign in again to get a new one.' }, status: :ok
</pre>

- `/sign_out`: This is the logout enpoint. Must receive a request like:
```
  curl -XDELETE -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjIwNDk2NTE3LCJleHAiOjE2MjA1MDAxMTcsImp0aSI6IjAyMjY4NTQzLTg0M2YtNGI1Zi1iMTBkLTgwYmU4NzYxOWI2ZCJ9.3sp3LWO1UB-qPBj2YQjPnTt4GFyyuc6UptmLpFkrvL4" -H "Content-Type: application/json" http://localhost:3000/users/sign_out
```
Response:
```
{ message: "You are succesfully logged out." }, status: :ok
```

- `/providers`: This is the sign-up enpoint. Must receive a request like:
<pre>
  curl -XGET -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjIwNDkzOTUzLCJleHAiOjE2MjA0OTc1NTMsImp0aSI6IjlmZjkzMDA2LTAxNTMtNDc5YS1hYjY2LTZiMDBhOWU2NjM1ZCJ9.K6oHIUI0AuZ4HfDV1iElFe9OZoMh_st3l1rfhD0PIqY" -H "Content-Type: application/json" http://localhost:3000/providers
</pre>
Response:
<pre>
{
  "providers":
"[
  {"id": 1, "name":"Provider 1"},
  {"id": 2, "name":"Provider 2"}
 ]"
}
</pre>

-
-

## Repository

- You can find the repo [here](hhttps://github.com/MiguelArgentina/ror-appointments-api).

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