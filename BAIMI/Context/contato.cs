namespace BAIMI.Context
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("contato")]
    public partial class contato
    {
        public int id { get; set; }

        [Required]
        [StringLength(50)]
        public string nome { get; set; }

        [Required]
        [StringLength(500)]
        public string email { get; set; }

        [Required]
        [StringLength(100)]
        public string assunto { get; set; }

        [Required]
        public string mensagem { get; set; }

        public DateTime data { get; set; }
    }
}
