json.answer do
  json.id @answer.id
  json.body @answer.body
  json.code @answer.code
  json.votes_num @answer.votes_num
  json.question do
    json.id @answer.question.id
    json.title @answer.question.title
    json.votes_num @answer.question.votes_num
  end
end
