namespace BookStore.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("BOOKS")]
    public partial class BOOK
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public BOOK()
        {
            BOOK_AUTHOR = new HashSet<BOOK_AUTHOR>();
            BOOK_GENRE = new HashSet<BOOK_GENRE>();
            BOOK_IMAGE = new HashSet<BOOK_IMAGE>();
            ORDERDETAILs = new HashSet<ORDERDETAIL>();
            WHISHLISTs = new HashSet<WHISHLIST>();
        }

        public int ID { get; set; }

        [StringLength(255)]
        public string TITLE { get; set; }

        public string EXCERPT { get; set; }

        public string DESCRIPTION { get; set; }

        [Column(TypeName = "date")]
        public DateTime? PUBLISH_DATE { get; set; }

        public int? PRICE { get; set; }

        [StringLength(255)]
        public string BOOK_URL { get; set; }

        [StringLength(255)]
        public string PREVIEW { get; set; }

        public int? PUBLISHER_ID { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BOOK_AUTHOR> BOOK_AUTHOR { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BOOK_GENRE> BOOK_GENRE { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BOOK_IMAGE> BOOK_IMAGE { get; set; }

        public virtual PUBLISHER PUBLISHER { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ORDERDETAIL> ORDERDETAILs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<WHISHLIST> WHISHLISTs { get; set; }
    }
}
