﻿using Microsoft.EntityFrameworkCore;

namespace Invoice.Data.Models
{
    public partial class DynamcisLinkDBContext : DbContext
    {

        //private ObjectContext _objectContext;
        //private System.Data.Entity.DbContextTransaction _transaction;

        public DynamcisLinkDBContext(DbContextOptions<DynamcisLinkDBContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Invoice> Invoice { get; set; }
        public virtual DbSet<InvoiceDetails> InvoiceDetails { get; set; }
        public virtual DbSet<Items> Items { get; set; }
        public virtual DbSet<Stores> Stores { get; set; }
        public virtual DbSet<Units> Units { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#pragma warning disable CS1030 // #warning: 'To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.'
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=DESKTOP-KSTACTV;Database=DynamcisLinkDB;Trusted_Connection=True;");
#pragma warning restore CS1030 // #warning: 'To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.'
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Invoice>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Taxes)
                    .HasColumnName("taxes")
                    .HasColumnType("decimal(18, 0)");

                entity.Property(e => e.InvoiceDate)
                    .HasColumnName("invoice_date")
                    .HasColumnType("datetime");

                entity.Property(e => e.InvoiceNo).HasColumnName("invoice_no");

                entity.Property(e => e.Net)
                    .HasColumnName("net")
                    .HasColumnType("decimal(18, 0)");

                entity.Property(e => e.StoreId).HasColumnName("store_id");

                entity.Property(e => e.Total)
                    .HasColumnName("total")
                    .HasColumnType("decimal(18, 0)");

                entity.HasOne(d => d.Store)
                    .WithMany(p => p.Invoice)
                    .HasForeignKey(d => d.StoreId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Invoice_Stores");
            });

            modelBuilder.Entity<InvoiceDetails>(entity =>
            {
                entity.ToTable("Invoice_Details");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Discount)
                    .HasColumnName("discount")
                    .HasColumnType("decimal(18, 0)");

                entity.Property(e => e.InvoiceId).HasColumnName("invoice_id");

                entity.Property(e => e.ItemId).HasColumnName("item_id");

                entity.Property(e => e.Net)
                    .HasColumnName("net")
                    .HasColumnType("decimal(18, 0)");

                entity.Property(e => e.Price)
                    .HasColumnName("price")
                    .HasColumnType("decimal(18, 0)");

                entity.Property(e => e.Qty).HasColumnName("qty");

                entity.Property(e => e.Total)
                    .HasColumnName("total")
                    .HasColumnType("decimal(18, 0)");

                entity.Property(e => e.UnitId).HasColumnName("unit_id");

                entity.HasOne(d => d.Invoice)
                    .WithMany(p => p.InvoiceDetails)
                    .HasForeignKey(d => d.InvoiceId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Invoice_Details_Invoice");

                entity.HasOne(d => d.Item)
                    .WithMany(p => p.InvoiceDetails)
                    .HasForeignKey(d => d.ItemId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Invoice_Details_Items");

                entity.HasOne(d => d.Unit)
                    .WithMany(p => p.InvoiceDetails)
                    .HasForeignKey(d => d.UnitId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Invoice_Details_Units");
            });

            modelBuilder.Entity<Items>(entity =>
            {
                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .ValueGeneratedNever();

                entity.Property(e => e.ItemName)
                    .HasColumnName("item_name")
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Stores>(entity =>
            {
                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .ValueGeneratedNever();

                entity.Property(e => e.StoreName)
                    .HasColumnName("store_name")
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Units>(entity =>
            {
                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .ValueGeneratedNever();

                entity.Property(e => e.UnitName)
                    .HasColumnName("unit_name")
                    .HasMaxLength(50);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);

        //public void BeginTransaction()
        //{
        //    _objectContext = ((IObjectContextAdapter)this).ObjectContext;
        //    if (_objectContext.Connection.State == ConnectionState.Open)
        //    {
        //        if (_transaction == null)
        //        {
        //            _transaction = _objectContext.Connection.BeginTransaction();
        //        }

        //        return;
        //    }

        //    _objectContext.Connection.Open(); // At this Line, I am getting Exception
        //    if (_transaction == null)
        //    {
        //        _transaction = _objectContext.Connection.BeginTransaction();
        //    }
        //}

        //public int Commit()
        //{
        //    var saveChanges = SaveChanges();
        //    _transaction.Commit();
        //    return saveChanges;
        //}

        //public void Rollback()
        //{
        //    _transaction.Rollback();
        //}
    }
}
