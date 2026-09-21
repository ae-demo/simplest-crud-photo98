# Domain Model

A single entity captures the whole product: a photo owned by one signed-in user, whose image bytes live in S3 while its metadata lives in `photo-api`'s database.

```mermaid
erDiagram
    USER ||--o{ PHOTO : owns

    USER {
        string id PK
        string username
    }

    PHOTO {
        string id PK
        string ownerId FK
        string title
        string description
        string s3ObjectKey
        string contentType
        int sizeBytes
        datetime createdAt
        datetime updatedAt
    }
```

`USER` is the signed-in identity from Thunder — `photo-api` never stores credentials, only the owner id (`sub`) on each `PHOTO` row. `s3ObjectKey` is the object's key in the S3 bucket; the image bytes themselves never pass through `photo-api`.