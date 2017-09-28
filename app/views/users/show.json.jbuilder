json.user do
  json.id @user.id
  json.url user_url(@user)
  json.username @user.username
  json.avatar @user.avatar
  json.bio_text @user.bio_text
  json.questions_asked_num @user.questions_asked_num
  json.questions_answered_num @user.questions_answered_num
end
