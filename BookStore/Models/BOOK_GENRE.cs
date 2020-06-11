namespace BookStore.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class BOOK_GENRE
    {
        public int ID { get; set; }

        public int? BOOK_ID { get; set; }

        public int? GENRE_ID { get; set; }

        public virtual BOOK BOOK { get; set; }

        public virtual GENRE GENRE { get; set; }
    }
}
