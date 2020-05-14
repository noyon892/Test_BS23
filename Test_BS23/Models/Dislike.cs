using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Test_BS23.Models
{
    public class Dislike
    {
        [Key]
        public int Id { get; set; }
        [Required]
        public int Comment_id { get; set; }
        [Required]
        public int Disliked_by { get; set; }
    }
}
