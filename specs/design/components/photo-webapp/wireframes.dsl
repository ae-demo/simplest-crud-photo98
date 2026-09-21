screen Gallery "The signed-in user's photo gallery"
  navbar "Photo Gallery"
  row
    heading "My Photos"
    right
    button "Upload Photo" primary -> UploadPhoto
  table "Photo | Title | Description | Updated" -> PhotoDetail
    row "thumb | Sunset | Evening at the beach | 2 hours ago"
    row "thumb | Family | Weekend gathering | 1 day ago"
    row "thumb | Trip | Mountain hike | 3 days ago"

screen UploadPhoto "Upload a new photo"
  navbar "Photo Gallery"
  heading "Upload Photo"
  input "Title"
  textarea "Description"
  image "Choose image file"
  row
    right
    button "Cancel" -> Gallery
    button "Upload" primary -> Gallery

screen PhotoDetail "View, edit, or delete a single photo"
  navbar "Photo Gallery"
  breadcrumb "My Photos / Sunset"
  image "Full-size photo"
  heading "Sunset"
  text "Evening at the beach"
  row
    right
    button "Delete" danger -> Gallery
    button "Edit" primary -> EditPhoto

screen EditPhoto "Edit a photo's title, description, or image"
  navbar "Photo Gallery"
  breadcrumb "My Photos / Sunset / Edit"
  heading "Edit Photo"
  input "Title"
  textarea "Description"
  image "Replace image file (optional)"
  row
    right
    button "Cancel" -> PhotoDetail
    button "Save" primary -> PhotoDetail

flow "Manage my photos"
  role "User"
  description "A signed-in user uploads, browses, views, edits, and deletes their own photos"
  Gallery
  UploadPhoto
  PhotoDetail
  EditPhoto
