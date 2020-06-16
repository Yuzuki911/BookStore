using BookStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls.WebParts;

namespace BookStore.Controllers
{
    public class HomeController : Controller
    {
        BookStoreDbContext db = new BookStoreDbContext();   
        public ActionResult Index()
        {
            var book = db.BOOKS.Where(b => b.TITLE != null).ToList();
            ViewBag.newb = book.OrderByDescending(b => b.PUBLISH_DATE).Take(6).ToList();

            return View(book);
        }
        //public JsonResult BookListPartial(int? genre)
        //{
        //    if (genre != null && genre !=0)
        //    {
        //        var books = db.BOOKS.ToList();
        //        var bookgenre = db.BOOK_GENRE.ToList();
        //        var genreb = db.GENREs.ToList();
        //        var BookGenre = (from b in books
        //                       join g in bookgenre on b.ID equals g.BOOK_ID
        //                       join c in genreb on g.GENRE_ID equals c.ID
        //                       where c.ID == genre
        //                       select b
        //                       ).ToList();
        //        return Json(BookGenre);
        //    }
        //    else
        //    {
        //        var Book = db.BOOKS.OrderByDescending(x => x.ID).ToList();
        //        return Json(Book);
        //    }
        //}
        public ActionResult Header()
        {
            return PartialView();
        }
        
        public ActionResult Footer()
        {
            return PartialView();
        }
        public ActionResult CartTop()
        {
            return PartialView();
        }
        public ActionResult About()
        {
            return View();
        }

        public ActionResult Contact()
        {      
            return View();
        }
    }
}