# User manual - Endpoints for interacting with the service

### - The service uses JWT token for security and all the authorization is handled via the devise gem

### - After signing-in with a valid user, you will get a **Bearer token** in the  **Authorization** header of the response. Save this token for this will be required for every request you make.

### - The token expires after one hour of inactivity.

### - You can get a new onesigning-in again.

<br>

## End points:


- `/users`: This is the sign-up enpoint. Must receive a request like:
```
  curl -XPOST -H "Content-Type: application/json" -d '{ "user": { "email": "test@example.com", "password": "123456" } }' http://localhost:3000/users
```
Response:
```
{"message":"Signed up sucessfully."}
```

- `/sign_in`: This is the login enpoint. Must receive a request like:
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
