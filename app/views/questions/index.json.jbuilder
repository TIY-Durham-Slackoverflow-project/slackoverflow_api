json.questions @questions do |question|
  json.id question.id
  json.url question_url(question)
  json.title question.title
  json.body question.body
  json.user question.user
  json.votes_num question.votes_num
  json.votes question.votes
  json.views question.views
  json.answers_num question.answers_num
  json.created_at question.created_at
  json.tags question.tags
  if question.answers
    json.answers question.answers do |answer|
      json.answer_body answer.body
      json.validated answer.validated
      json.answer_user answer.user
      json.votes_num answer.answer_num
      if answer.code
        json.code answer.code
      end
    end
  end
end
