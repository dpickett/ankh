---
    layout: page
    title: User Creation
    comments: false
    sharing: false
    footer: true
    ---

    ## create a valid user ##

Sample Request URI:

```
POST /api/users.json?api_token=FASDFGXA14
Body: user[external_id]=external_id
```

Sample Response:

Status: 201

```javascript
{
  "email": "kaya_keebler@example.com",
  "external_id": "external_id",
  "first_name": null,
  "last_name": null,
  "login": "kaya_keebler"
}
```

