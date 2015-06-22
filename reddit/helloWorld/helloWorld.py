import praw

r = praw.Reddit('Hello World bot by /u/IAMAtalkingduckAMA')
r.login('bot_username', 'bot_password')
submission = r.get_submission(submission_id=raw_input("Enter the ID of the post you want to use: "))
flat_comments = praw.helpers.flatten_tree(submission.comments)
already_done = set()
for comment in flat_comments:
    if comment.body == "Hello" and comment.id not in already_done:
        comment.reply(' world!')
        already_done.add(comment.id)
