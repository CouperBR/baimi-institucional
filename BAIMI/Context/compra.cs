namespace BAIMI.Context
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("compra")]
    public partial class compra
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public compra()
        {
            compra_produto = new HashSet<compra_produto>();
        }

        public int id { get; set; }

        [Required]
        [StringLength(200)]
        public string nome_completo { get; set; }

        [StringLength(11)]
        public string cpf { get; set; }

        public DateTime? data_nascimento { get; set; }

        [Required]
        [StringLength(30)]
        public string telefone_contato { get; set; }

        [Required]
        public string endereco_completo_entrega { get; set; }

        public string ponto_referencia { get; set; }

        [Required]
        [StringLength(500)]
        public string email { get; set; }

        public string indicacao { get; set; }

        [StringLength(30)]
        public string telefone_indicacao { get; set; }

        [StringLength(500)]
        public string forma_pagamento { get; set; }

        public string observacoes { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<compra_produto> compra_produto { get; set; }

        [NotMapped]
        public int produto_id { get; set; }
    }
}
