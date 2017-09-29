json.question do
  json.id @question.id
  json.title @question.title
  json.body @question.body
  json.votes_num @question.votes_num
end
