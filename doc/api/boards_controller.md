## GET /boards
ボード一覧を取得する.

### Example

#### Request
```
GET /boards HTTP/1.1
Accept: application/json
Content-Length: 0
Content-Type: application/json
Host: api.example.com
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 147
Content-Type: application/json; charset=utf-8
ETag: W/"4b38bfdac5a34a70398a83d187f15a32"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 0795b505-6bd4-4970-85f4-3737f34437f2
X-Runtime: 0.004953
X-XSS-Protection: 1; mode=block

[
  {
    "id": 316,
    "title": "Voluptatem id non mollitia quo commodi unde.",
    "text": "Est laborum sed repellendus ab aspernatur velit voluptatum voluptatem."
  }
]
```

## GET /board/:id
ボードを取得する.

### Example

#### Request
```
GET /boards.318 HTTP/1.1
Accept: application/json
Content-Length: 0
Content-Type: application/json
Host: api.example.com
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 147
Content-Type: application/json; charset=utf-8
ETag: W/"daf9972a244471080cbb3d9ffec99750"
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 7f9bb097-fa93-4886-8e12-a7f6eff6d3ce
X-Runtime: 0.003812
X-XSS-Protection: 1; mode=block

[
  {
    "id": 318,
    "title": "Voluptatem id non mollitia quo commodi unde.",
    "text": "Est laborum sed repellendus ab aspernatur velit voluptatum voluptatem."
  }
]
```

## POST /boards
ボードを作成する.

### Example

#### Request
```
POST /boards HTTP/1.1
Accept: application/json
Content-Length: 31
Content-Type: application/json
Host: api.example.com

{
  "title": "title",
  "text": "text"
}
```

#### Response
```
HTTP/1.1 201
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 120
Content-Type: application/json; charset=utf-8
ETag: W/"6497130f517d2c78febf7758e9b3b84c"
Set-Cookie: request_method=POST; path=/
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: a5442336-3d3c-4088-b843-b84c46da84fa
X-Runtime: 0.008883
X-XSS-Protection: 1; mode=block

{
  "id": 322,
  "title": "title",
  "text": "text",
  "created_at": "2016-04-25T18:55:12.503Z",
  "updated_at": "2016-04-25T18:55:12.503Z"
}
```

## PUT /boards
ボードを更新する.

### Example

#### Request
```
PUT /boards/324 HTTP/1.1
Accept: application/json
Content-Length: 39
Content-Type: application/json
Host: api.example.com

{
  "title": "new_title",
  "text": "new_text"
}
```

#### Response
```
HTTP/1.1 200
Cache-Control: max-age=0, private, must-revalidate
Content-Length: 128
Content-Type: application/json; charset=utf-8
ETag: W/"cbbf2e46c6d5d0ac0070c579887ef980"
Set-Cookie: request_method=PUT; path=/
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: 7fba325c-ea6b-431e-a3ad-4ea3d3ac9d3c
X-Runtime: 0.009716
X-XSS-Protection: 1; mode=block

{
  "id": 324,
  "title": "new_title",
  "text": "new_text",
  "created_at": "2016-04-25T18:55:12.000Z",
  "updated_at": "2016-04-25T18:55:12.597Z"
}
```

## DELETE /boards
ボードを削除する.

### Example

#### Request
```
DELETE /boards/326 HTTP/1.1
Accept: application/json
Content-Length: 2
Content-Type: application/json
Host: api.example.com

{
}
```

#### Response
```
HTTP/1.1 204
Cache-Control: no-cache
Set-Cookie: request_method=DELETE; path=/
X-Content-Type-Options: nosniff
X-Frame-Options: SAMEORIGIN
X-Request-Id: cb1b9be3-e1b3-4d5a-8ddd-fd4cc1a75f7a
X-Runtime: 0.008012
X-XSS-Protection: 1; mode=block
```
