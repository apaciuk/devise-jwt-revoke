# devise-jwt-revoke

# Sign up

curl -XPOST -H "Content-Type: application/json" -d '{ "user": { "email": "test@example.com", "password": "12345678" } }' http://localhost:3000/users

# Sign in

curl -XPOST -i -H "Content-Type: application/json" -d '{ "user": { "email": "test@example.com", "password": "12345678" } }' http://localhost:3000/users/sign_in # (grab token for signout, and member login))

# Sign out

curl -XDELETE -H "Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI2YWM4MjNlNi0yODlkLTQzMjUtOTc1MS05MTlmMDM3OWQ3YWMiLCJqdGkiOiI2YWM4MjNlNi0yODlkLTQzMjUtOTc1MS05MTlmMDM3OWQ3YWMiLCJzdWIiOiIxIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjc5NTY5MDE0LCJleHAiOjE2ODA4NjUwMTR9.8KhMpuAfL8bxO8f2QrvN86ZfQQFPjOXEsj4YFQ27lCs" -H "Content-Type: application/json" http://localhost:3000/users/sign_out # (use Bearer token from login, not this one)
