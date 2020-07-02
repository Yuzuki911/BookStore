using BookStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BookStore.Controllers
{
    public class CartController : Controller
    {
        // GET: Cart
        private BookStoreDbContext db = new BookStoreDbContext();
        public ActionResult Index()
        {
            var cart = (CART)Session["CartSession"];
            if (cart == null)
            {
                cart = new CART();
            }
            return View(cart);
        }

        public JsonResult AddItem(int id,int Soluong)
        {
            var book = db.BOOKS.Find(id);
            var cart = (CART)Session["CartSession"];
            if (cart != null)
            {
                cart.AddItem(book, Soluong);

                Session["CartSession"] = cart;
            }
            else
            {
                cart = new CART();
                cart.AddItem(book, Soluong);
                Session["CartSession"]= cart;
                
            }
            return Json(new { status = true }, JsonRequestBehavior.AllowGet);
        }
        //public ActionResult AddItem(int id, string returnURL)
        //{
        //    var book = db.BOOKS.Find(id);
        //    var cart = (CART)Session["CartSession"];
        //    if (cart != null)
        //    {
        //        cart.AddItem(book, 1);

        //        Session["CartSession"] = cart;
        //    }
        //    else
        //    {
        //        cart = new CART();
        //        cart.AddItem(book, 1);
        //        Session["CartSession"] = cart;
        //    }
        //    if (string.IsNullOrEmpty(returnURL))
        //    {
        //        return RedirectToAction("Index");
        //    }
        //    return Redirect(returnURL);
        //}

        public ActionResult RemoveLine(int id)
        {
            var book = db.BOOKS.Find(id);
            var cart = (CART)Session["CartSession"];
            if (cart != null)
            {
                cart.RemoveLine(book);
                Session["CartSession"] = cart;
            }
            return RedirectToAction("Index");
        }

        public ActionResult UpdateCart(int[] masp,int[] qty)
        {
            var cart = (CART)Session["CartSession"];

            if (cart != null)
            {
                for (int i = 0; i < masp.Count(); i++)
                {
                    var book = db.BOOKS.Find(masp[i]);
                    cart.UpdateItem(book, qty[i]);
                }

                Session["CartSession"] = cart;
            }

            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Payment()
        {
            var cart = (CART)Session["CartSession"];
            if (cart == null)
            {
                cart = new CART();
            }
            return View(cart);
        }

        [HttpPost]

        public ActionResult Payment(ORDER model)
        {

            return View();
        }

    }
}