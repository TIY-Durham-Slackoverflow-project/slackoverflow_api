json.answer do
  json.id @answer.id
  json.body @answer.body
  json.code @answer.code
  json.question do
    json.id @answer.question.id
    json.title @answer.question.title
  end
end
