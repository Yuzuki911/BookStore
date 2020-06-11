namespace BookStore.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class BOOK_IMAGE
    {
        public int ID { get; set; }

        [StringLength(255)]
        public string IMAGE1 { get; set; }

        [StringLength(255)]
        public string IMAGE2 { get; set; }

        [StringLength(255)]
        public string IMAGE3 { get; set; }

        [StringLength(255)]
        public string IMAGE4 { get; set; }

        public int? BOOK_ID { get; set; }

        public virtual BOOK BOOK { get; set; }
    }
}
