json.user do
  json.id @user.id
  json.username @user.username
  json.avatar @user.avatar
  json.bio_text @user.bio_text
  json.token @user.token
end
