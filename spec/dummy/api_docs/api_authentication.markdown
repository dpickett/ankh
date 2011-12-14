---
    layout: page
    title: API Authentication
    comments: false
    sharing: false
    footer: true
    ---

    ## allows users to retrieve partner data when a valid api token is specified ##

Sample Request URI:

```
GET /api/partners/acme.json?api_token=FASDFGXA9
```

Sample Response:

Status: 200

```javascript
{
  "created_at": "2011-12-12T22:34:30Z",
  "id": 547,
  "idea_rating_system_id": null,
  "intro_text": null,
  "name": "acme",
  "plan_tier": "freemium",
  "rating_system_id": 996,
  "subdomain": "acme",
  "updated_at": "2011-12-12T22:34:30Z"
}
```

## denies access to the api when an invalid token is specified ##

Sample Request URI:

```
GET /unauthenticated?api_token=431415421451
```

Sample Response:

Status: 401

```javascript
{
  "error": "Invalid authentication token."
}
```

## denies access to the api when a token is not specified ##

Sample Request URI:

```
GET /unauthenticated
```

Sample Response:

Status: 401

```javascript
{
  "error": "You need to sign in or sign up before continuing."
}
```

