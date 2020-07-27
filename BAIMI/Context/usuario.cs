namespace BAIMI.Context
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("usuario")]
    public partial class usuario
    {
        public int id { get; set; }

        [Required]
        [StringLength(150)]
        public string nome { get; set; }

        [Required]
        public string senha { get; set; }

        [Required]
        [StringLength(500)]
        public string email { get; set; }

        [Column(TypeName = "date")]
        public DateTime created_on { get; set; }

        [Column(TypeName = "date")]
        public DateTime? updated_on { get; set; }
    }
}
