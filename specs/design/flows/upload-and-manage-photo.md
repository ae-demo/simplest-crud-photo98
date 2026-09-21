# Upload a Photo

A signed-in User uploads a photo: the browser gets a presigned URL from `photo-api`, uploads the image bytes straight to S3, then confirms the upload so `photo-api` records the photo's metadata.

```mermaid
sequenceDiagram
    actor User
    participant photo-webapp
    participant photo-api
    participant aws-s3

    User->>photo-webapp: choose image, title, description
    photo-webapp->>photo-api: request upload URL
    photo-api->>photo-webapp: presigned PUT URL + object key
    photo-webapp->>aws-s3: PUT image bytes
    aws-s3-->>photo-webapp: upload ok
    photo-webapp->>photo-api: create photo (title, description, object key)
    photo-api-->>photo-webapp: photo created
    User->>photo-webapp: open photo
    photo-webapp->>photo-api: request view URL
    photo-api->>photo-webapp: presigned GET URL
    photo-webapp->>aws-s3: fetch image bytes
```

