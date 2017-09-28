json.user do
  json.id @user.id
  json.url user_url(@user)
  json.username @user.username
  json.avatar @user.avatar
  json.avatar @user.avatar_big
  json.bio_text @user.bio_text
  json.questions_asked_num @user.questions_asked_num
  json.questions_answered_num @user.questions_answered_num
  if @user.questions
    json.questions @user.questions do |question|
      json.title question.title
      json.quest_url question_url(question)
    end
  end
  if @user.answers
    json.answers @user.answers do |answer|
      json.body answer.body
    end
  end
end
