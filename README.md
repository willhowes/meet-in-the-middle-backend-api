[![Build Status](https://travis-ci.com/Timdavidcole/meet-in-the-middle-backend-api.svg?branch=master)](https://travis-ci.com/Timdavidcole/meet-in-the-middle-backend-api)

# 'meet in the midl' back-end API

This is the back-end API for our final group project at Makers Academy, 'meet In the midl' - a location app built in React (front-end) and Ruby on Rails (back-end).

This is repository is for the back-end API built in Rails for basic User CRUD and Sessions.

The front-end can be found [here](https://github.com/gennyallcroft/meet-in-the-middle-react-front-end)

## How to Install
Run the following in your command line:
```
git clone git@github.com:willhowes/meet-in-the-middle-backend-api.git
cd meet-in-the-middle-backend-api
bundle install
rails db:migrate
```

## How to run the tests
Having clones the repository (see above) and moved into the project directory, run the following in your command line:
```
rspec
```

## Usage

The base URL for all requests is https://meet-in-the-middle-backend-api.herokuapp.com/

Or to use locally run:

```
rails server -p 3001
```
and use the URL http://localhost:3001

## API Routes

The routes are:

```
POST /users - creates a new user
GET /users/:id - returns a user JSON
PATCH /users/:id - updates a user
DELETE /users/:id - deletes a user

GET /users/[id]/avatar - returns a user's avatar

POST /sessions - creates a new session
DELER /sessions - destroys the current session
```

### POST /users

Header should contain:

```
Content-Type: multipart/form-data
```

Body should contain a JSON:

```
{
  "user":
  {
  "name": "Test2",
  "email": "test2@test.com",
  "password": "aaaaaaaaa",
  "password_confirmation": "aaaaaaaaa",
  "avatar": "[FILEPATH]"   
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

URL should include the user ID:

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
N.B. The user's avatar does not form part of JSON being returned. See below for how to request to get a user's avatar.

### PATCH /users/:id

URL should include user ID:

```
https://meet-in-the-middle-backend-api.herokuapp.com/users/2
```

Header should contain (if not updating the user's avatar):

```
Content-Type: application/json
```
or, header should contain (if the user's avatar is being updated):

```
Content-Type: multipart/form-data
```

Body should contain a JSON of information you wish to update:

```
{
  "user":
  {
  "name": "Test2update",
  "email": "test2@test.com",
  "password": "aaaaaaaaa",
  "password_confirmation": "aaaaaaaaa",
  "avatar": "[FILEPATH]"      
  }
}
```

And will return a JSON of the user with updated information from the database (except an updated avatar which will not be returned):

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

URL should include user ID:

```
https://meet-in-the-middle-backend-api.herokuapp.com/users/2
```

Nothing returned, user is deleted.

### GET /users/[id]/avatar

Needs to include the id of the user:

Example:
```
https://meet-in-the-middle-backend-api.herokuapp.com/users/2/avatar
```
The avatar image is returned.

### POST /sessions

Header should contain:

```
Content-Type: application/json
```

Body should contain a JSON of the user's email and password:

```
{
  "email": "test@test.com",
  "password": "123456"
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

URL should include the an ID but this can be anything:

```
https://meet-in-the-middle-backend-api.herokuapp.com/sessions/1
```

## Instructions on how to contribute to the project
Clone the repo (see above)
Submit a pull request on github.

## Contact
Please send a message on GitHub to the repository owner
