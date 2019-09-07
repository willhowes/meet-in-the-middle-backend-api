# README

This is the back-end for our final group project at Makers Academy, Meet In The Middle, a location app built in React and Rails.

This is a simple backend API built in Rails for basic User CRUD and Sessions.

The front-end can be found [here](https://github.com/gennyallcroft/meet-in-the-middle-react-front-end)

## Usage

The base URL for all requests is https://meet-in-the-middle-backend-api.herokuapp.com/

The routes are:

```
POST /users - creates a new user
GET /users/:id - returns a user JSON
PATCH /users/:id - updates a user
DELETE /users/:id - deletes a user

POST /sessions - creates a new session
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

### PATCH /users/:id

URL should include User Id:

```
https://meet-in-the-middle-backend-api.herokuapp.com/users/2
```

Header should contain:

```
Content-Type: application/json
```

Body should contain a JSON of information you wise to update:

```
{
  "user":
  {
  "name": "Test2update",
  "email": "test2@test.com",
  "password": "aaaaaaaaa",
  "password_confirmation": "aaaaaaaaa"    
  }
}
```

And will return a JSON of user with update information from database:

```
{
  "id": 2,
  "name": "Test2update",
  "email": "test2@test.com",
  "password_digest": "$2a$12$G3/kSbciewIOWUi4/XxKwOKvDLbpQo8QbsbGHiERBjY9bgxMarh9C",
  "created_at": "2019-09-05T12:33:56.750Z",
  "updated_at": "2019-09-05T12:38:18.137Z"
}
```

### DELETE /users/:id

URL should include User Id:

```
https://meet-in-the-middle-backend-api.herokuapp.com/users/2
```

Header should contain:

```
Content-Type: application/json
```

Body should contain a JSON of information you wise to update:

```
{
  "user":
  {
  "name": "Test2update",
  "email": "test2@test.com",
  "password": "aaaaaaaaa",
  "password_confirmation": "aaaaaaaaa"    
  }
}
```

And will return a JSON of user with update information from database:

```
{
  "id": 2,
  "name": "Test2update",
  "email": "test2@test.com",
  "password_digest": "$2a$12$G3/kSbciewIOWUi4/XxKwOKvDLbpQo8QbsbGHiERBjY9bgxMarh9C",
  "created_at": "2019-09-05T12:33:56.750Z",
  "updated_at": "2019-09-05T12:38:18.137Z"
}
```

### POST /sessions

Header should contain:

```
Content-Type: application/json
```

Body should contain a JSON of the user's email and password:

```
{
  "email": "test@test.com",
  "password": "123456",
}
```

On success will return a JSON in the following format:

```
{
  "status": "created",
  "logged_in": true,
  "user": {
      "id": 1,
      "name": "Test",
      "email": "test@test.com",
      "password_digest": "$2a$12$cNFkP2OtiMPrWbvazs8TA.TLnhiQwODllGUO8t7CAwVby5o0axPdi",
      "created_at": "2019-09-05T17:43:56.246Z",
      "updated_at": "2019-09-05T17:43:56.246Z"
  }
}
```

### DELETE /sessions

Destroys the current session

Header should contain:

```
Content-Type: application/json
```

Body should contain a JSON of the user id:

```
{
  "id": "1",
}
```
