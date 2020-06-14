using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookStore.Models.BL
{
    public class BOOKGENREBL
    {
        BookStoreDbContext db = new BookStoreDbContext();
        public List<BOOK> getBooksByGenre(int? id)
        {
            var books = db.BOOKS.ToList();
            var genre = db.GENREs.ToList();
            var bookgenre = db.BOOK_GENRE.ToList();
            var bookgenrelist = (from b in books
                                 join g in bookgenre on b.ID equals g.BOOK_ID
                                 join c in genre on g.GENRE_ID equals c.ID
                                 where c.ID == id
                                 select b
                                     ).ToList();
            return bookgenrelist;
        }
    }
}