using BookStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BookStore.Controllers
{
    public class CommentController : Controller
    {
        BookStoreDbContext db = new BookStoreDbContext();
        // GET: Comment
        public ActionResult Index()
        {
            return View();
        }
        public JsonResult AddComment(string Name,string Email,string Content,int PostId)
        {
            var comment = new COMMENT();
            comment.NAME = Name;
            comment.EMAIL = Email;
            comment.CONTENT = Content;
            comment.POST_ID = PostId;
            comment.CREATED = DateTime.Now;
            comment.STATUS = 0;
            db.COMMENTs.Add(comment);
            var day = comment.CREATED?.ToString("MMM dd, yyyy");
            var hour = comment.CREATED?.ToString("h:mm tt");
            var time = day + " at " + hour;
            db.SaveChanges();
            var cmc = db.COMMENTs.Where(b => b.POST_ID == PostId).Count();
            //return PartialView("~/Views/Comment/_Comment.cshtml", comment);
            return Json(new { status = true, Name, Content, time, cmc }, JsonRequestBehavior.AllowGet);
        }
    }
}