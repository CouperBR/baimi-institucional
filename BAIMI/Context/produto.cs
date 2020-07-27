namespace BAIMI.Context
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Web;

    [Table("produto")]
    public partial class produto
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public produto()
        {
            compra_produto = new HashSet<compra_produto>();
        }

        public int id { get; set; }

        [StringLength(100)]
        public string nome { get; set; }

        [StringLength(150)]
        public string descricao_curta { get; set; }

        public int? vendidos { get; set; }

        public decimal? valor { get; set; }

        public int? numero_max_parcelas { get; set; }

        public int? desconto_avista { get; set; }

        public string caracteristicas { get; set; }

        public string descricao_longa { get; set; }

        public string url_foto { get; set; }

        public bool? entrega_gratis { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<compra_produto> compra_produto { get; set; }

        [NotMapped]
        [DataType(DataType.Upload)]
        [Display(Name = "Upload File")]
        public HttpPostedFileBase ImageUpload { get; set; }
    }
}
