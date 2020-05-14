using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Test_BS23.Interface;
using Test_BS23.Models;

namespace Test_BS23.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PostsController : ControllerBase
    {
        private readonly IPost _post;

        public PostsController(IPost post)
        {
            _post = post;
        }

        // GET: api/Posts/GetPosts?pageNo=1&pageSize=2
        [HttpGet("GetPosts")]
        public IEnumerable<Post> GetPosts(int pageNo, int pageSize)
        {
            var x= _post.GetPosts(pageNo, pageSize);
            return x;
        }

        // GET: api/Posts/Search?strString=Hi
        [HttpGet("Search")]
        public IEnumerable<Post> Search(string strString)
        {
            return _post.Search(strString);
        }

        // GET: api/Posts/PostCount
        [HttpGet("PostCount")]
        public int PostCount()
        {
            return _post.PostCount();
        }

        // GET: api/Posts/GetCommentLikeCount/1
        [HttpGet("GetCommentLikeCount/{id}")]
        public int GetCommentLikeCount(int id)
        {
            var post = _post.GetCommentLikeCount(id);

            if (post == null)
            {
                return 0;
            }

            return post;
        }


        // GET: api/Posts/GetCommentDislikeCount/2
        [HttpGet("GetCommentDislikeCount/{id}")]
        public int GetCommentDislikeCount(int id)
        {
            var result = _post.GetCommentDislikeCount(id);

            if (result == null)
            {
                return 0;
            }

            return result;
        }

        // GET: api/Posts/GetPostDislikeCount/2
        [HttpGet("GetPostCommentCount/{id}")]
        public int GetPostCommentCount(int id)
        {
            var post = _post.GetPostCommentCount(id);

            if (post == null)
            {
                return 0;
            }

            return post;
        }

        // GET: api/Posts/GetPostComment
        [HttpGet("GetPostComment")]
        public IEnumerable<Comment> GetPostComment()
        {
            return _post.GetPostComment();
        }

        // GET: api/Posts/GetPostComment/2
        [HttpGet("GetPostComment/{id}")]
        public IEnumerable<Comment> GetPostComment(int id)
        {
            return _post.GetPostComment(id);
        }

        // Post: api/Posts/likeComment
        [HttpPost("likeComment")]
        public bool likeComment(Like like)
        {
            var result = _post.LikeComment(like);

            if (result == null)
            {
                return false;
            }

            return true;
        }


        // Post: api/Posts/dislikeComment
        [HttpPost("dislikeComment")]
        public bool dislikeComment(Dislike dislike)
        {
            var result = _post.DislikeComment(dislike);

            if (result == null)
            {
                return false;
            }

            return true;
        }


        // Post: api/Posts/Comment
        [HttpPost("Comment")]
        public bool Comment(Comment comment)
        {
            var result = _post.Comment(comment);

            if (result == null)
            {
                return false;
            }

            return true;
        }

    }
}
