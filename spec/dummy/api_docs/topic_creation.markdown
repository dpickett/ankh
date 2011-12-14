---
    layout: page
    title: Topic Creation
    comments: false
    sharing: false
    footer: true
    ---

    ## authenticated user can create a topic ##

Sample Request URI:

```
POST /api/topics.json?api_token=FASDFGXA12
Body: topic[title]=topic+title&topic[description]=topic+description&topic[external_id]=1234
```

Sample Response:

Status: 201

```javascript
{
  "average_rating_score": null,
  "closed_at": null,
  "created_at": "2011-12-12T22:34:30Z",
  "description": "topic description",
  "external_id": "1234",
  "id": 296,
  "partner_id": 551,
  "ratings_count": 0,
  "title": "topic title",
  "updated_at": "2011-12-12T22:34:30Z"
}
```

## authenticated user can not create a topic without a title or description ##

Sample Request URI:

```
POST /api/topics.json?api_token=FASDFGXA13
Body: topic[title]=here+is+a+title&topic[description]=
```

Sample Response:

Status: 422

```javascript
{
  "description": [
    "can't be blank"
  ]
}
```

## unauthenticated user can not create a topic ##

Sample Request URI:

```
POST /unauthenticated
Body: topic[title]=topic+title&topic[description]=topic+description
```

Sample Response:

Status: 401

```javascript
{
  "error": "You need to sign in or sign up before continuing."
}
```

