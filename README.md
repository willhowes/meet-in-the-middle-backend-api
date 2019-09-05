# README

This is the back-end for our final group project at Makers Academy, Meet In The Middle, a location app built in React and Rails.

This is a simple backend API built in Rails for basic User CRUD.

## Usage

The base URL for all request is https://meet-in-the-middle-backend-api.herokuapp.com/

At the moment all routes are:

```
POST /users - creates a new user

GET /users/:id - returns a user JSON
PATCH /users/:id - updates a user
DELETE /users/:id - deletes a user
```

### POST /users 

Header should contain:

```
Content-Type: application/json
```

Body should contain a JSON:

```
{
    "user":
    {
    "name": "Test2",
    "email": "test2@test.com",
    "password": "aaaaaaaaa",
    "password_confirmation": "aaaaaaaaa"    
    }
}
```
And will return a JSON of created user from database:

```
{
   "id": 2,
   "name": "Test2",
   "email": "test2@test.com",
   "password_digest": "$2a$12$v2wHW7AtHCbq1zTh62Fyfe9e3TtGYsLLE0TgYEE.KD1bbOUTNN2W6",
   "created_at": "2019-09-05T10:38:57.660Z",
   "updated_at": "2019-09-05T10:38:57.660Z"
}
```

### GET /users/:id 

URL should include User Id:

```
https://meet-in-the-middle-backend-api.herokuapp.com/users/2
```

Header should contain:

```
Content-Type: application/json
```

And will return a JSON of created user from database:

```
{
   "id": 2,
   "name": "Test2",
   "email": "test2@test.com",
   "password_digest": "$2a$12$v2wHW7AtHCbq1zTh62Fyfe9e3TtGYsLLE0TgYEE.KD1bbOUTNN2W6",
   "created_at": "2019-09-05T10:38:57.660Z",
   "updated_at": "2019-09-05T10:38:57.660Z"
}
```

