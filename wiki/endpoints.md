# User manual - Endpoints for interacting with the service

### - The service uses JWT token for security and all the authorization is handled via the devise gem

### - After signing-in with a valid user, you will get a **Bearer token** in the  **Authorization** header of the response. Save this token for this will be required for every request you make.

### - The token expires after one hour of inactivity.

### - You can get a new onesigning-in again.

<br>

## End points:

<hr>

- `/users`: This is the sign-up enpoint. Must receive a request like:
```
  curl -XPOST -H "Content-Type: application/json" -d '{ "user": { "email": "test@example.com", "password": "123456" } }' http://localhost:3000/users
```
Response:
```
{"message":"Signed up sucessfully."}
```
<hr>

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

{ message: 'You are logged in. Your token will be valid for one hour after last use. After that you need to sign in again to get a new one.' }, status: :ok
</pre>
<hr>

- `/sign_out`: This is the logout enpoint. Must receive a request like:
```
  curl -XDELETE -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIzIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjIwNDk2NTE3LCJleHAiOjE2MjA1MDAxMTcsImp0aSI6IjAyMjY4NTQzLTg0M2YtNGI1Zi1iMTBkLTgwYmU4NzYxOWI2ZCJ9.3sp3LWO1UB-qPBj2YQjPnTt4GFyyuc6UptmLpFkrvL4" -H "Content-Type: application/json" http://localhost:3000/users/sign_out
```
Response:
```
{ message: "You are succesfully logged out." }, status: :ok
```
<hr>

- `/providers_list`: You can get a list of all available providers. Must receive a request like:
```
  curl -XGET -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjIwNDkzOTUzLCJleHAiOjE2MjA0OTc1NTMsImp0aSI6IjlmZjkzMDA2LTAxNTMtNDc5YS1hYjY2LTZiMDBhOWU2NjM1ZCJ9.K6oHIUI0AuZ4HfDV1iElFe9OZoMh_st3l1rfhD0PIqY" -H "Content-Type: application/json" http://localhost:3000/providers_list
```
Response:
```
{
  "message":"you reached /providers_list",
  "providers":
  [
    {"id":1,"email":"lin.hickle@boyle-casper.name"},
    {"id":2,"email":"donnell.cronin@beahan.org"}
  ]
}
```
<hr>
curl -XPOST -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjMyOTUyODk0LCJleHAiOjE2MzI5NTY0OTQsImp0aSI6ImUwZjk5NDljLWNjOWQtNDdkZC1hNjVkLTI4MmM5YmJlMGFlMyJ9.9KJ5pMdp-O4Io-EHzt3FV0ebof4k_9WX0xn0S9iSoQM" -d '{ "query": { "provider_id": "1", "date": "24/08/2021", "hour": "15" } }' -H "Content-Type: application/json" http://localhost:3000/provider_available_detail
<hr>

- `/provider_available_detail`: You can validate if a **provider** is available a certain **date** at a certain **hour**:
```
  curl -XPOST -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjMyOTUyODk0LCJleHAiOjE2MzI5NTY0OTQsImp0aSI6ImUwZjk5NDljLWNjOWQtNDdkZC1hNjVkLTI4MmM5YmJlMGFlMyJ9.9KJ5pMdp-O4Io-EHzt3FV0ebof4k_9WX0xn0S9iSoQM" -d '{ "query": { "provider_id": "1", "date": "24/08/2021", "hour": "15" } }' -H "Content-Type: application/json" http://localhost:3000/provider_available_detail
```
Response:
```
{
  "message":"you reached /provider_available_detail",
  "response":
              {"availability":"Not available. Provider booked on 24/08/2021 at 19 hs"}
}
```

or

```
{
  "message":"you reached /provider_available_detail",
  "response":
              {"availability":"Available. Provider free on 24/08/2021 at 19 hs"}
}
```
<hr>

- `/every_provider_available`: You can get a list of all available **providers** for a certain **date**:
```
  curl -XPOST -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjMyOTUyODk0LCJleHAiOjE2MzI5NTY0OTQsImp0aSI6ImUwZjk5NDljLWNjOWQtNDdkZC1hNjVkLTI4MmM5YmJlMGFlMyJ9.9KJ5pMdp-O4Io-EHzt3FV0ebof4k_9WX0xn0S9iSoQM" -d '{ "query": { "date": "24/08/2021" } }' -H "Content-Type: application/json" http://localhost:3000/every_provider_available
```
Response:
```
{
  "message":"you reached /every_provider_available",
  "response":
              [
                {"id":2,"available":"[8, 9, 10] hs on 24/08/2021"},
                {"id":3,"available":"[8, 9, 15, 16, 17] hs on 24/08/2021"}
              ]
}
```

<hr>

- `/provider_services_daily`: You can get a report with a provider's daily **services** within a **month**, for a certain **year**, ordered descending by hour and day:
```
  curl -XPOST -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjMzMDI3MzIzLCJleHAiOjE2MzMwMzA5MjMsImp0aSI6IjdlZjZkNjlkLWE3YzAtNGJlZC04ZjVjLTA1OGQzYTJlODdhMyJ9.KvVz525gEBWfYNS43vBy_gcVHSh6KDjhd1rdRjKv3Ug" -d '{ "query": { "provider_id": "3", "year": "2021", "month": "8" } }' -H "Content-Type: application/json" http://localhost:3000/provider_services_daily
```
Response:
```
{
  "message":"you reached /provider_services_daily",
  "response":
              { "provider_id":"6",
                "accum_hours_report":
                [
                  {"date":"2021-02-24","hours":[14,13],"service":"Retail"},
                  {"date":"2021-02-23","hours":[10,9],"service":"IT"},
                  {"date":"2021-02-21","hours":[10],"service":"Retail"},
                  {"date":"2021-02-16","hours":[13],"service":"Technology"},
                  {"date":"2021-02-15","hours":[19,18,17],"service":"IT"},
                  {"date":"2021-02-15","hours":[13,12,11,10],"service":"Construction"},
                  {"date":"2021-02-15","hours":[13,12],"service":"Healthcare"}
                ] 
              }
}
```

<hr>

- `/providers_hours_monthly`: You can get a report of how many **hours** booked, for a certain **month**,  a **provider** has:
```
  curl -XPOST -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjMzMDI3MzIzLCJleHAiOjE2MzMwMzA5MjMsImp0aSI6IjdlZjZkNjlkLWE3YzAtNGJlZC04ZjVjLTA1OGQzYTJlODdhMyJ9.KvVz525gEBWfYNS43vBy_gcVHSh6KDjhd1rdRjKv3Ug" -d '{ "query": { "provider_id": "3", "year": "2021", "month": "8" } }' -H "Content-Type: application/json" http://localhost:3000/providers_hours_monthly
```
Response:
```
{
  "message":"you reached /providers_hours_monthly",
  "response":
              {"accum_hours_report":"for month 7/2021 provider id:3 has 0 booked hours."}
}
```

<hr>




