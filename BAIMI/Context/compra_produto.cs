namespace BAIMI.Context
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class compra_produto
    {
        public int produto_id { get; set; }

        public int compra_id { get; set; }

        public int id { get; set; }

        public virtual compra compra { get; set; }

        public virtual produto produto { get; set; }
    }
}
