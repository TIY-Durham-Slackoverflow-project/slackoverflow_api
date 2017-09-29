json.question do
  json.id @question.id
  json.url question_url(@question)
  json.title @question.title
  json.body @question.body
  json.user @question.user
  # json.votes @question.votes
  json.views @question.views
  json.tags @question.tags
  json.answers_num @question.answers_num
  json.created_at @question.created_at
  json.answers @question.answers do |answer|
    json.answer_body answer.body
    json.validated answer.validated
    json.answer_user answer.user
    if answer.code
      json.code answer.code
    end
    # json.answer_votes answer.votes
    json.answer_views answer.views
  end
end
