using BookStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BookStore.Controllers
{
    public class WishListController : Controller
    {
        BookStoreDbContext db = new BookStoreDbContext();
        // GET: WishList
        public ActionResult Index()
        {
            var book = db.BOOKS.ToList();
            var user = db.CUSTOMERS.ToList();
            var wishlist = db.WHISHLISTs.ToList();
            var Uid = (int)Session["Id"];
            var model = (from b in book
                                join w in wishlist on b.ID equals w.BOOK_ID
                                join u in user on w.CUSTOMER_ID equals u.ID
                                where u.ID == Uid
                                select b
                                     ).OrderBy(w=>w.ID).ToList();
            return View(model);
        }
        public JsonResult AddItem(int id)
        {
            var Uid = (int)Session["Id"];
            var check = db.WHISHLISTs.Where(b => b.BOOK_ID == id && b.CUSTOMER_ID == Uid).ToList();
            int a = 1;
            if (check != null && check.Count != 0)
            {
                return Json(new { status = true }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                var wishlist = new WHISHLIST();
                wishlist.BOOK_ID = id;
                wishlist.CUSTOMER_ID = (int)Session["Id"];
                db.WHISHLISTs.Add(wishlist);
                db.SaveChanges();
                return Json(new { status = true }, JsonRequestBehavior.AllowGet);
            }
        }
        public ActionResult RemoveWish(int id)
        {
            var Uid = (int)Session["Id"];
            var wishlist = db.WHISHLISTs.Where(b=>b.BOOK_ID == id && b.CUSTOMER_ID == Uid).FirstOrDefault();
            db.WHISHLISTs.Remove(wishlist);
            db.SaveChanges();
            return RedirectToAction("Index","WishList");
        }
    }
}