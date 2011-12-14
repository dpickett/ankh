---
    layout: page
    title: Partner Creation
    comments: false
    sharing: false
    footer: true
    ---

    ## allows partner creation if valid api token ##

Sample Request URI:

```
POST /api/partners.json?api_token=FASDFGXA10
Body: partner[name]=new_partner&partner[subdomain]=new_subdomain
```

Sample Response:

Status: 201

```javascript
{
  "created_at": "2011-12-12T22:34:30Z",
  "id": 550,
  "idea_rating_system_id": null,
  "intro_text": null,
  "name": "new_partner",
  "plan_tier": "freemium",
  "rating_system_id": 999,
  "subdomain": "new_subdomain",
  "updated_at": "2011-12-12T22:34:30Z"
}
```

## denies partner creation if no partner name or subdomain is provided ##

Sample Request URI:

```
POST /api/partners.json?api_token=FASDFGXA11
Body: 
```

Sample Response:

Status: 422

```javascript
{
  "name": [
    "can't be blank"
  ],
  "subdomain": [
    "can't be blank"
  ]
}
```

## denies partner creation if no api token is provided ##

Sample Request URI:

```
POST /unauthenticated
Body: partner[name]=new_partner&partner[subdomain]=new_subdomain
```

Sample Response:

Status: 401

```javascript
{
  "error": "You need to sign in or sign up before continuing."
}
```

