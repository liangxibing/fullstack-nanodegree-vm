#
# Database access functions for the web forum.
# 

import psycopg2

## Database connection
DB = []

## Get posts from database.
def GetAllPosts():
    '''Get all the posts from the database, sorted with the newest first.

    Returns:
      A list of dictionaries, where each dictionary has a 'content' key
      pointing to the post content, and 'time' key pointing to the time
      it was posted.
    '''
    conn = psycopg2.connect("dbname=forum");
    cur = conn.cursor()
    cur.execute("select content, time from posts order by time desc")
    DB = cur.fetchall()
    posts = [{'content': str(row[1]), 'time': str(row[0])} for row in DB]
    conn.close()
    return posts

## Add a post to the database.
def AddPost(content):
    '''Add a new post to the database.

    Args:
      content: The text content of the new post.
    '''
    conn = psycopg2.connect("dbname=forum");
    cur = conn.cursor()
    cur.execute("insert into posts(content) values('%s')" % (content))
    conn.commit()
    conn.close()
