json.user do
  json.id @user.id
  json.username @user.username
  json.avatar @user.avatar
  json.avatar_big @user.avatar_big
  json.bio_text @user.bio_text
end
