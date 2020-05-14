using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Test_BS23.Models
{
    public class Post
    {
        public int Id { get; set; }
        [Required]
        public string PostBody { get; set; }
        public int Posted_by { get; set; }
        [DatabaseGenerated(DatabaseGeneratedOption.Computed)]
        public DateTime PostTime { get; set; }
    }
}
