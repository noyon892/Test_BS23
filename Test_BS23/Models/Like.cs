using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Test_BS23.Models
{
    public class Like
    {
        [Key]
        public int Id { get; set; }
        [Required]
        public int Comment_id { get; set; }
        [Required]
        public int Liked_by { get; set; }
    }
}
