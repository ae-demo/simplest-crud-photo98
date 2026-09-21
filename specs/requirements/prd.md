# simplest-crud-photo98 — PRD

## Problem Statement

People take and collect photos across devices and have no simple, private place to keep them online without standing up their own storage or dealing with a complicated app. They want a straightforward way to save a photo with a short description, find it again later, and remove it when it's no longer needed — without albums, sharing, or other overhead getting in the way.

## Solution

A simple, single-purpose photo app: a signed-in user uploads photos (each with a title and description) to their own private gallery, backed by durable cloud object storage, and can view, edit, and delete them at any time. No albums, no sharing, no collaboration — just a personal photo list done well.

## Actors

- **User** — a signed-in individual who uploads, views, edits, and deletes their own photos. Cannot see or affect any other user's photos.

## User Stories

1. As a user, I want to sign in, so that my photos are private to me and I can access them from any device.
2. As a user, I want to upload a photo with a title and description, so that I can store and label a picture I care about.
3. As a user, I want to see a list of my uploaded photos, so that I can browse my collection.
4. As a user, I want to open a single photo, so that I can see its full image, title, and description.
5. As a user, I want to edit a photo's title, description, or image file, so that I can correct or update it later.
6. As a user, I want to delete a photo, so that I can remove ones I no longer want to keep.

## Product Decisions

- **Sign-in**: every user signs in via SSO through Thunder, the platform IDP (org default).
- **Photo storage**: uploaded image files are stored in Amazon S3 via the organization's registered `aws-s3` resource; the browser uploads/downloads directly against S3 using short-lived presigned URLs generated server-side (org default consumption pattern).
- **Organization**: photos are a flat, per-user list — no albums or folders (per user's answer).
- **Photo record**: each photo has an image file plus a title and description (per user's answer).
- **Visibility**: a user's photos are private to that user; no sharing or cross-user viewing exists in this product. *assumed*
- **Accepted files**: standard image formats (JPEG, PNG, GIF, WebP) up to 10 MB per upload. *assumed*

## Out of Scope

- Albums, folders, or tagging beyond title/description.
- Sharing a photo with other users or the public.
- Photo editing tools (crop, filters, rotation).
- Commenting, likes, or any social features.
- Bulk upload or bulk delete.

## Open Questions

None outstanding.

## Further Notes

None.

