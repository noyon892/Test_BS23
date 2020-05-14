using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Test_BS23.Models
{
    public class Comment
    {
        public int Id { get; set; }
        [Required]
        public int Post_id { get; set; }
        [Required]
        public int Commented_by { get; set; }
        [Required]
        public string CommentMessage { get; set; }
        [DatabaseGenerated(DatabaseGeneratedOption.Computed)]
        public DateTime Comment_Time { get; set; }
    }
}
