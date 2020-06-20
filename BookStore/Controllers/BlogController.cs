using BookStore.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BookStore.Controllers
{
    public class BlogController : Controller
    {
        // GET: Blog
        BookStoreDbContext db = new BookStoreDbContext();
        public ActionResult Index()
        {
            ViewBag.cm = db.COMMENTs.OrderByDescending(b => b.CREATED).Take(5).ToList();
            var model = db.POSTs.OrderBy(b => b.CREATED).Take(5).ToList();
            return View(model);
        }
        public PartialViewResult BlogList(int? page)
        {
            int pageSize = 3;
            int pageIndex = 1;
            pageIndex = page.HasValue ? Convert.ToInt32(page) : 1;
            var Blogs = db.POSTs.OrderByDescending(b => b.CREATED).ToList();
            IPagedList<POST> BlogList = Blogs.ToPagedList(pageIndex, pageSize);
            ViewBag.User = db.CUSTOMERS.ToList();
            return PartialView(BlogList);
        }
        public ViewResult Details(int id)
        {
            ViewBag.cm = db.COMMENTs.OrderByDescending(b => b.CREATED).Take(5).ToList();
            ViewBag.cc = db.COMMENTs.Where(b => b.POST_ID == id).Count();
            ViewBag.comment = db.COMMENTs.Where(b => b.POST_ID == id).ToList();
            ViewBag.model = db.POSTs.OrderBy(b => b.CREATED).Take(5).ToList();
            var model = db.POSTs.Find(id);
            return View(model);
        }
    }
}