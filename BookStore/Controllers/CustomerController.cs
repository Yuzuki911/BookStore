using BookStore.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BookStore.Controllers
{

    public class CustomerController : Controller
    {
        private BookStoreDbContext db = new BookStoreDbContext();
        // GET: Customer
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(CUSTOMER acc)
        {
            if (ModelState.IsValid)
            {
                int id = (int)Session["Id"];
                var check = db.CUSTOMERS.Find(id);
                if (check != null)
                {
                    check.ADDRESS = acc.ADDRESS;
                    check.NAME = acc.NAME;
                    check.GENDER = acc.GENDER;
                    check.PHONE = acc.PHONE;
                    db.SaveChanges();
                    return RedirectToAction("Index", "Home");
                }
            }
            return View();
        }
        [HttpPost]
        public JsonResult UpdateAvatar()
        {
            int id = (int)Session["Id"];
            var check = db.CUSTOMERS.Find(id);
            if (Request.Files.Count > 0)
            {
                for (int i = 0; i < Request.Files.Count; i++)
                {
                    HttpPostedFileBase file = Request.Files[i]; //Uploaded file
                                                                //Use the following properties to get file's name, size and MIMEType
                    //int fileSize = file.ContentLength;
                    string fileName = file.FileName;
                    //string mimeType = file.ContentType;
                    //System.IO.Stream fileContent = file.InputStream;
                    //To save file, use SaveAs method
                    var path = Path.Combine(Server.MapPath("~/Content/images/about"), fileName);
                    file.SaveAs(path); //File will be saved in application root
                    check.AVATAR = fileName;
                    Session["AvatarURL"] = check.AVATAR;
                }
            }
            else
            {
                check.AVATAR = Session["AvatarURL"].ToString();
            }
            var avatar = Session["AvatarURL"].ToString();
            db.SaveChanges();
            return Json(new { status = true, avatar}, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Register()
        {
            return View();
        }

        //POST: Register
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(CUSTOMER acc)
        {
            if (ModelState.IsValid)
            {
                var check = db.CUSTOMERS.FirstOrDefault(s => s.EMAIL == acc.EMAIL);
                if (check == null)
                {
                    var pass = BCrypt.Net.BCrypt.HashString(acc.PASSWORD);
                    acc.PASSWORD = pass;
                    acc.AVATAR = "default.jpg";
                    acc.ROLE = 0;
                    db.CUSTOMERS.Add(acc);
                    db.SaveChanges();
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ViewBag.error = "User already exists";
                    return View();
                }
            }
            return View();
        }

        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string name, string password)
        {
            if (ModelState.IsValid)
            {
                var acc = db.CUSTOMERS.SingleOrDefault(a => a.EMAIL.Equals(name) || a.USERNAME.Equals(name));
                if (acc != null)
                {
                    if (BCrypt.Net.BCrypt.Verify(password, acc.PASSWORD))
                    {
                        //add session
                        Session["FullName"] = acc.NAME;
                        Session["UserName"] = acc.USERNAME;
                        Session["PhoneNumber"] = acc.PHONE;
                        Session["Adress"] = acc.ADDRESS;
                        Session["Id"] = acc.ID;
                        Session["Email"] = acc.EMAIL;
                        Session["AvatarURL"] = acc.AVATAR;
                        if (Session["FullName"] == null)
                        {
                            
                            return RedirectToAction("Index", "Customer");
                        }
                        else if (acc.ROLE == 1)
                        {
                            return RedirectToAction("Index", "Admin", new { area = "Admin" });
                        }
                        return RedirectToAction("Index", "Home");
                    }
                }
                else
                {
                    ViewBag.error = "Login failed";
                    return RedirectToAction("Login");
                }
            }
            return View();
        }
        public ActionResult Logout()
        {
            Session.Clear();//remove session
            return RedirectToAction("Index", "Home");
        }
    }
}