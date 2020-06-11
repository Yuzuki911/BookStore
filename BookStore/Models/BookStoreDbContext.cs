namespace BookStore.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class BookStoreDbContext : DbContext
    {
        public BookStoreDbContext()
            : base("name=BookStoreDbContext")
        {
        }

        public virtual DbSet<AUTHOR> AUTHORs { get; set; }
        public virtual DbSet<BOOK_AUTHOR> BOOK_AUTHOR { get; set; }
        public virtual DbSet<BOOK_GENRE> BOOK_GENRE { get; set; }
        public virtual DbSet<BOOK_IMAGE> BOOK_IMAGE { get; set; }
        public virtual DbSet<BOOK> BOOKS { get; set; }
        public virtual DbSet<COMMENT> COMMENTs { get; set; }
        public virtual DbSet<CUSTOMER> CUSTOMERS { get; set; }
        public virtual DbSet<GENRE> GENREs { get; set; }
        public virtual DbSet<ORDER> ORDERs { get; set; }
        public virtual DbSet<ORDERDETAIL> ORDERDETAILs { get; set; }
        public virtual DbSet<POST> POSTs { get; set; }
        public virtual DbSet<PUBLISHER> PUBLISHERs { get; set; }
        public virtual DbSet<WHISHLIST> WHISHLISTs { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AUTHOR>()
                .HasMany(e => e.BOOK_AUTHOR)
                .WithOptional(e => e.AUTHOR)
                .HasForeignKey(e => e.AUTHOR_ID)
                .WillCascadeOnDelete();

            modelBuilder.Entity<BOOK>()
                .HasMany(e => e.BOOK_AUTHOR)
                .WithOptional(e => e.BOOK)
                .HasForeignKey(e => e.BOOK_ID)
                .WillCascadeOnDelete();

            modelBuilder.Entity<BOOK>()
                .HasMany(e => e.BOOK_GENRE)
                .WithOptional(e => e.BOOK)
                .HasForeignKey(e => e.BOOK_ID)
                .WillCascadeOnDelete();

            modelBuilder.Entity<BOOK>()
                .HasMany(e => e.BOOK_IMAGE)
                .WithOptional(e => e.BOOK)
                .HasForeignKey(e => e.BOOK_ID)
                .WillCascadeOnDelete();

            modelBuilder.Entity<BOOK>()
                .HasMany(e => e.ORDERDETAILs)
                .WithOptional(e => e.BOOK)
                .HasForeignKey(e => e.BOOK_ID);

            modelBuilder.Entity<BOOK>()
                .HasMany(e => e.WHISHLISTs)
                .WithOptional(e => e.BOOK)
                .HasForeignKey(e => e.BOOK_ID)
                .WillCascadeOnDelete();

            modelBuilder.Entity<CUSTOMER>()
                .HasMany(e => e.ORDERs)
                .WithOptional(e => e.CUSTOMER)
                .HasForeignKey(e => e.CUSTOMER_ID);

            modelBuilder.Entity<CUSTOMER>()
                .HasMany(e => e.POSTs)
                .WithOptional(e => e.CUSTOMER)
                .HasForeignKey(e => e.CUSTOMER_ID)
                .WillCascadeOnDelete();

            modelBuilder.Entity<CUSTOMER>()
                .HasMany(e => e.WHISHLISTs)
                .WithOptional(e => e.CUSTOMER)
                .HasForeignKey(e => e.CUSTOMER_ID)
                .WillCascadeOnDelete();

            modelBuilder.Entity<GENRE>()
                .HasMany(e => e.BOOK_GENRE)
                .WithOptional(e => e.GENRE)
                .HasForeignKey(e => e.GENRE_ID)
                .WillCascadeOnDelete();

            modelBuilder.Entity<ORDER>()
                .HasMany(e => e.ORDERDETAILs)
                .WithOptional(e => e.ORDER)
                .HasForeignKey(e => e.ORDER_ID)
                .WillCascadeOnDelete();

            modelBuilder.Entity<POST>()
                .HasMany(e => e.COMMENTs)
                .WithOptional(e => e.POST)
                .HasForeignKey(e => e.POST_ID)
                .WillCascadeOnDelete();

            modelBuilder.Entity<PUBLISHER>()
                .HasMany(e => e.BOOKS)
                .WithOptional(e => e.PUBLISHER)
                .HasForeignKey(e => e.PUBLISHER_ID)
                .WillCascadeOnDelete();
        }
    }
}
