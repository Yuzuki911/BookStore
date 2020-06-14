using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BookStore.Models;
using BookStore.Models.BL;
using PagedList;
namespace BookStore.Controllers
{
    public class BooksController : Controller
    {
        BookStoreDbContext db = new BookStoreDbContext();
        // GET: Books
        public ActionResult Index()
        {
            return View();
        }
        public PartialViewResult BookList(int? page,int? genreid) {
            
            int pageSize = 6;
            int pageIndex = 1;
            if (genreid != null)
            {
                pageIndex = page.HasValue ? Convert.ToInt32(page) : 1;
                //var books = db.BOOKS.ToList();
                //var genre = db.GENREs.ToList();
                //var bookgenre = db.BOOK_GENRE.ToList();
                //var bookgenrelist = (from b in books
                //                     join g in bookgenre on b.ID equals g.BOOK_ID
                //                     join c in genre on g.GENRE_ID equals c.ID
                //                     where c.ID == genreid
                //                     select b
                //                         ).ToList();
                BOOKGENREBL a = new BOOKGENREBL();
                var bookgenrelist = a.getBooksByGenre(genreid);
                IPagedList<BOOK> booklistbG = bookgenrelist.ToPagedList(pageIndex,pageSize);

                return PartialView(booklistbG);
            }
            else
            {
                pageIndex = page.HasValue ? Convert.ToInt32(page) : 1;
                IPagedList<BOOK> book = null;
                List<BOOK> booklist = db.BOOKS.ToList();
                book = booklist.ToPagedList(pageIndex, pageSize);
                return PartialView(book);
            }
        }
        public PartialViewResult SideGenre()
        {
            var genre = db.GENREs.OrderBy(x => x.ID).ToList();
            return PartialView(genre);
        }
        
        public ViewResult Details(int id)
        {
            ViewBag.books = db.BOOKS.ToList();
            ViewBag.Image = db.BOOK_IMAGE.Where(x => x.BOOK_ID == id).FirstOrDefault();
            var model = db.BOOKS.Where(x => x.ID == id).FirstOrDefault();
            return View(model);
        }
    }
}