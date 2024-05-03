NUM_USERS = 20
NUM_POSTS_PER_USER = 10
NUM_COMMENTS_PER_POST = 5
NUM_LIKES_PER_POST = 3
NUM_LIKES_PER_COMMENT = 2

NUM_USERS.times do
  user = User.create(
    email: Faker::Internet.email,
    password: "password"
  )
  puts "Created user: #{user.email}"
end

User.all.each do |user|
  NUM_POSTS_PER_USER.times do
    post = user.posts.create(
      content: Faker::Lorem.sentence
    )
    puts "Created post with ID #{post.id} for user: #{user.email}"

    NUM_COMMENTS_PER_POST.times do
      comment = post.comments.create(
        content: Faker::Lorem.sentence,
        user: User.all.sample
      )
      puts "Created comment with ID #{comment.id} for post ID #{post.id}"
      
      NUM_LIKES_PER_COMMENT.times do
        like = comment.likes.create(
          user: User.all.sample
        )
        puts "Liked comment with ID #{comment.id} by user: #{like.user.email}"
      end
    end

    NUM_LIKES_PER_POST.times do
      like = post.likes.create(
        user: User.all.sample
      )
      puts "Liked post with ID #{post.id} by user: #{like.user.email}"
    end
  end
end

User.all.each do |user|
  following = User.all.sample(NUM_USERS / 2) 
  following.each do |followed_user|
    follow = Follow.create(follower_id: user.id, following_id: followed_user.id)
    puts "User #{follow.follower.email} is now following user #{follow.following.email}"
  end
end
