namespace BookStore.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("POST")]
    public partial class POST
    {
        BookStoreDbContext db = new BookStoreDbContext();
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public POST()
        {
            COMMENTs = new HashSet<COMMENT>();
        }
        //public CUSTOMER author { get; set; }

        public int ID { get; set; }

        [StringLength(255)]
        public string TITLE { get; set; }

        public string EXCERPT { get; set; }

        public string CONTENT { get; set; }

        public int? STATUS { get; set; }

        [Column(TypeName = "date")]
        public DateTime? CREATED { get; set; }

        [StringLength(255)]
        public string POSTURL { get; set; }

        public int? CUSTOMER_ID { get; set; }
        public string AUTHOR()
        {
            var Author = db.CUSTOMERS.Find(this.CUSTOMER_ID);

            return Author.USERNAME;
        }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<COMMENT> COMMENTs { get; set; }

        public virtual CUSTOMER CUSTOMER { get; set; }
    }
}
