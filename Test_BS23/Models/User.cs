﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Test_BS23.Models
{
    public class User
    {
        [Key]
        public int ID { get; set; }
        [Required]
        public string Username { get; set; }
        [Required]
        public string Email { get; set; }
        public string Gender { get; set; }
    }
}
