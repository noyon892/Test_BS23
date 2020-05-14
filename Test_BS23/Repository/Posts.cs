using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Test_BS23.Interface;
using Test_BS23.Models;

namespace Test_BS23.Repository
{
    public class Posts : IPost
    {
        private readonly DataContext _context;

        public Posts(DataContext context)
        {
            _context = context;
        }

        public IEnumerable<Models.Post> GetPosts(int pageNo, int pageSize)
        {
            return _context.Posts.FromSqlRaw<Post>("[dbo].[Usp_GetPost] {0},{1}", pageNo, pageSize);
        }


        public IEnumerable<Models.Post> Search(string strString)
        {
            return _context.Posts.Where(s => s.PostBody.Contains(strString));
        }



        public int PostCount()
        {
            return _context.Posts.Count();
        }


        public int GetCommentLikeCount(int id)
        {
            return _context.Likes.Where(s => s.Comment_id == id).Count();
        }



        public int GetCommentDislikeCount(int id)
        {
            return _context.Dislikes.Where(s => s.Comment_id == id).Count();
        }



        public int GetPostCommentCount(int id)
        {
            return _context.Comments.Where(s => s.Post_id == id).Count();
        }


        public IEnumerable<Comment> GetPostComment(int id)
        {
            return _context.Comments.Where(s => s.Post_id == id);
        }

        public IEnumerable<Comment> GetPostComment()
        {
            return _context.Comments;
        }


        public Like LikeComment(Like like)
        {
            _context.Likes.Add(like);
            _context.SaveChanges();
            return like;
        }



        public Dislike DislikeComment(Dislike dislike)
        {
            _context.Dislikes.Add(dislike);
            _context.SaveChanges();
            return dislike;
        }



        public Comment Comment(Comment comment)
        {
            _context.Comments.Add(comment);
            _context.SaveChanges();
            return comment;
        }


    }
}
