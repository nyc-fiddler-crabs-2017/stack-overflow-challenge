require 'faker'
# create users

user1 = User.create(username: Faker::Internet.user_name ,password:"password")
user2 = User.create(username: Faker::Internet.user_name ,password:"password")
user3 = User.create(username: Faker::Internet.user_name ,password:"password")
user4 = User.create(username: Faker::Internet.user_name ,password:"password")
user5 = User.create(username: Faker::Internet.user_name ,password:"password")
user6 = User.create(username: Faker::Internet.user_name ,password:"password")

# create questions
Question.create(body:"How long should I boil my eggs for?", user_id: 1)
Question.create(body:"My stove doesn't turn on... HELP!", user_id: 2)
Question.create(body:"Gas stove vs. electric stove?", user_id: 3)
Question.create(body:"Best stove brand?", user_id: 4)
Question.create(body:"I think my stove is haunted... anyone else?", user_id: 5)
Question.create(body:"What are the best ways to clean a stove?", user_id: 6)
Question.create(body:"Anyone else give shoutouts to their stoves?", user_id: 2)
Question.create(body:"I'm trying to make my own stove. Does anyone have recommend any tutorials?", user_id: 2)
Question.create(body:"When was the stove created?", user_id: 3)

Question.create(body: Faker::Hacker.say_something_smart, user_id: 1)
Question.create(body: Faker::Hacker.say_something_smart, user_id: 2)
Question.create(body: Faker::Hacker.say_something_smart, user_id: 3)
Question.create(body: Faker::Hacker.say_something_smart, user_id: 4)
Question.create(body: Faker::Hacker.say_something_smart, user_id: 5)
Question.create(body: Faker::Hacker.say_something_smart, user_id: 6)
Question.create(body: Faker::Hacker.say_something_smart, user_id: 2)
Question.create(body: Faker::Hacker.say_something_smart, user_id: 2)
Question.create(body: Faker::Hacker.say_something_smart, user_id: 3)

# create answers
Answer.create(body: "I would recommend 12 minutes", user_id:2, question_id: 1)
Answer.create(body: "Call 1-800-411-PAIN", user_id:3, question_id: 2)
Answer.create(body: "I personally like gas stoves.", user_id:4, question_id: 3)
Answer.create(body: "I've heard Viking stove is a pretty realible brand.", user_id:5, question_id: 4)
Answer.create(body: "Yes. I think it is a bit common.", user_id:6, question_id: 5)
Answer.create(body: "I used cooked top cleaner wipes. They are magical.", user_id:1, question_id: 6)
Answer.create(body: "Cooks and Cooks should be helpful. Check their website out.", user_id:3, question_id: 7)
Answer.create(body: "The earliest recorded instances of a wood burning kitchen stove was the so-called stew stove (developed in 1735 by the French designer François de Cuvilliés and officially termed the Castrol Stove).", user_id:4, question_id: 8)

# create comments
Comment.create(body: Faker::Hipster.sentence, commentable_id: 1, commentable_type: "Question", user_id:1)
Comment.create(body: Faker::Hipster.sentence, commentable_id: 2, commentable_type: "Answer", user_id:1)
Comment.create(body: Faker::Hipster.sentence, commentable_id: 3, commentable_type: "Answer", user_id:2)
Comment.create(body: Faker::Hipster.sentence, commentable_id: 6, commentable_type: "Question", user_id:2)

Comment.create(body: "I would also love to know!", commentable_id: 1, commentable_type: "Question", user_id:6)
Comment.create(body: "Yes, they are very reliable.", commentable_id: 2, commentable_type: "Answer", user_id:4)
Comment.create(body: "I second that. I think the food tastes better.", commentable_id: 3, commentable_type: "Answer", user_id:1)
Comment.create(body: "What type of stove do you have?", commentable_id: 6, commentable_type: "Question", user_id:1)

Vote.create(up_down: 1, user_id: 4, votable_id:5, votable_type: "Answer")
Vote.create(up_down: 1, user_id: 5, votable_id:2, votable_type: "Question")
Vote.create(up_down: -1, user_id: 1, votable_id:4, votable_type: "Answer")
Vote.create(up_down: -1, user_id: 2, votable_id:3, votable_type: "Answer")
Vote.create(up_down: 1, user_id: 3, votable_id:5, votable_type: "Answer")
Vote.create(up_down: 1, user_id: 2, votable_id:5, votable_type: "Answer")
