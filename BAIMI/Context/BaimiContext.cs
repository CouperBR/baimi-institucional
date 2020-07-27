namespace BAIMI.Context
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class BaimiContext : DbContext
    {
        public BaimiContext()
            : base("name=BaimiContext")
        {
        }

        public virtual DbSet<compra> compra { get; set; }
        public virtual DbSet<compra_produto> compra_produto { get; set; }
        public virtual DbSet<contato> contato { get; set; }
        public virtual DbSet<produto> produto { get; set; }
        public virtual DbSet<usuario> usuario { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<compra>()
                .Property(e => e.nome_completo)
                .IsUnicode(false);

            modelBuilder.Entity<compra>()
                .Property(e => e.cpf)
                .IsFixedLength();

            modelBuilder.Entity<compra>()
                .Property(e => e.telefone_contato)
                .IsUnicode(false);

            modelBuilder.Entity<compra>()
                .Property(e => e.endereco_completo_entrega)
                .IsUnicode(false);

            modelBuilder.Entity<compra>()
                .Property(e => e.ponto_referencia)
                .IsUnicode(false);

            modelBuilder.Entity<compra>()
                .Property(e => e.email)
                .IsUnicode(false);

            modelBuilder.Entity<compra>()
                .Property(e => e.indicacao)
                .IsUnicode(false);

            modelBuilder.Entity<compra>()
                .Property(e => e.telefone_indicacao)
                .IsUnicode(false);

            modelBuilder.Entity<compra>()
                .Property(e => e.forma_pagamento)
                .IsUnicode(false);

            modelBuilder.Entity<compra>()
                .Property(e => e.observacoes)
                .IsUnicode(false);

            modelBuilder.Entity<compra>()
                .HasMany(e => e.compra_produto)
                .WithRequired(e => e.compra)
                .HasForeignKey(e => e.compra_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<contato>()
                .Property(e => e.nome)
                .IsUnicode(false);

            modelBuilder.Entity<contato>()
                .Property(e => e.email)
                .IsUnicode(false);

            modelBuilder.Entity<contato>()
                .Property(e => e.assunto)
                .IsUnicode(false);

            modelBuilder.Entity<contato>()
                .Property(e => e.mensagem)
                .IsUnicode(false);

            modelBuilder.Entity<produto>()
                .Property(e => e.nome)
                .IsUnicode(false);

            modelBuilder.Entity<produto>()
                .Property(e => e.descricao_curta)
                .IsUnicode(false);

            modelBuilder.Entity<produto>()
                .Property(e => e.valor)
                .HasPrecision(18, 0);

            modelBuilder.Entity<produto>()
                .Property(e => e.caracteristicas)
                .IsUnicode(false);

            modelBuilder.Entity<produto>()
                .Property(e => e.descricao_longa)
                .IsUnicode(false);

            modelBuilder.Entity<produto>()
                .Property(e => e.url_foto)
                .IsUnicode(false);

            modelBuilder.Entity<produto>()
                .HasMany(e => e.compra_produto)
                .WithRequired(e => e.produto)
                .HasForeignKey(e => e.produto_id)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<usuario>()
                .Property(e => e.nome)
                .IsUnicode(false);

            modelBuilder.Entity<usuario>()
                .Property(e => e.senha)
                .IsUnicode(false);

            modelBuilder.Entity<usuario>()
                .Property(e => e.email)
                .IsUnicode(false);
        }
    }
}
