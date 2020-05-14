using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Test_BS23.Models;

namespace Test_BS23.Interface
{
    public interface IPost
    {
        IEnumerable<Post> GetPosts(int pageNo, int pageSize);

        IEnumerable<Post> Search(string strString);

        int PostCount();

        int GetCommentLikeCount(int id);

        int GetCommentDislikeCount(int id);

        int GetPostCommentCount(int id);

        Like LikeComment(Like like);

        Dislike DislikeComment(Dislike dislike);

        Comment Comment(Comment comment);

        IEnumerable<Comment> GetPostComment(int id);
    }
}
