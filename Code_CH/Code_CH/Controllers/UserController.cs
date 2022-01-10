using Code_CH.Models;
using System;
using System.Configuration;
using System.Net;
using System.Linq;
using System.Web.Mvc;
using System.IO;
using Common;
using Microsoft.Extensions.Configuration;
using PayPal.Api;
using PayPalHttp;
using System.Collections.Generic;

namespace Code_CH.Controllers
{
    public  class UserController : Controller
    {

        CuaHangEntities database = new CuaHangEntities();
        // GET: User
        public  ActionResult Index()
        {
            ViewBag.hethang = "sản phẩm đã hết!";
            var animation = database.Animations.Where(a => a.idAnimation == 1).FirstOrDefault();
            ViewBag.ani1 = animation.Img_animation_1;
            ViewBag.ani2 = animation.Img_animation_2;
            ViewBag.ani3 = animation.Img_animation_3;
            ViewBag.ani4 = animation.Img_animation_4;
            /* return View(database.DauSanPhams.ToList());*/
            //áp dụng singleton

            // Lỗi thời gian biên dịch: Hàm tạo SingleObject () không hiển thị
            // Đối tượng SanPhamSingleton = new SanPhamSingleton();

            // Lấy đối tượng duy nhất có sẵn
            SanPhamSingleton.Instance.Init(database);
            var listDauSanPham = SanPhamSingleton.Instance.listDauSanPham;
            return View(listDauSanPham);
        }
        public ActionResult About()
        {
            return View();
        }
        [HttpGet]
        public ActionResult ChiTietSanPham(int id)
        {
            var dausanpham = database.DauSanPhams.Where(a => a.maDSP == id).FirstOrDefault();
           
            var sanpham = database.SanPhams.Where(a => a.maDSP == id && a.matinhTrang == 1).ToList();
            var sp = database.SanPhams.Where(a => a.maDSP == id && a.matinhTrang == 1).FirstOrDefault();

            var ao = sanpham.Select(x => x.size).Distinct().ToList();
            /*  int san = database.SanPhams.Where(a => a.maDSP == id && a.matinhTrang == 1).Count();
              ViewBag.count = san;*/
            if (ao != null)
            {
                ViewBag.size = ao;
            }    

            ViewBag.listDauSanPham = database.DauSanPhams.ToList();
            ViewBag.masanpham = sp.maSP;

            ViewBag.maDauSanPham = dausanpham.maDSP;
            ViewBag.TenSanPham = dausanpham.tenSP;
            ViewBag.SoLuongSP = dausanpham.soluongSP;
            ViewBag.GiaSanPham = dausanpham.giaSP;
            ViewBag.LoaiSanPham = dausanpham.loaiSP;
            ViewBag.HinhAnh9 = dausanpham.hinhanhSP;
            ViewBag.hinhanh1 = dausanpham.hinhanhphu1;
            ViewBag.hinhanh2 = dausanpham.hinhanhphu2;
            ViewBag.hinhanh3 = dausanpham.hinhanhphu3;
            ViewBag.hinhanh4 = dausanpham.hinhanhphu4;
            ViewBag.hinhanh5 = dausanpham.hinhanhphu5;
            ViewBag.GhiChu = dausanpham.ghichu;
            return View(database.SanPhams.Where(a => a.maDSP == id).ToList());
        }
        /*Tạo tài khoản khách hàng*/
        public ActionResult TaoTaiKhoanKhachHang()
        {
            TaiKhoanKhachHang taikhoankhachhang = new TaiKhoanKhachHang();
            return View(taikhoankhachhang);
        }
        [HttpPost]
        public ActionResult TaoTaiKhoanKhachHang(TaiKhoanKhachHang taikhoan,FormCollection form,string _hoten,string email, string _sodienthoai,string _password,string _diachi, string ConfirmPass)
        {
            string tinhthanhpho = form["billing_address_1"].ToString();
            string quanhuyen = form["billing_address_2"].ToString();
            var check = database.TaiKhoanKhachHangs.Where(a => a.emailKH == email).SingleOrDefault();
            
            if (_password == ConfirmPass)
            {
                if (check == null)
                {
                    taikhoan.sodienthoaiKH = _sodienthoai;
                    taikhoan.tenKH = _hoten;
                    taikhoan.emailKH = email;
                    taikhoan.Password = _password;
                    taikhoan.tinhKH = tinhthanhpho;
                    taikhoan.huyenKH = quanhuyen;
                    taikhoan.maTT = 1;
                    taikhoan.diachiKH = _diachi;



                    string content = System.IO.File.ReadAllText(Server.MapPath("~/Assets/email/newoder.html"));
                    content = content.Replace("{{CustomerName}}", taikhoan.tenKH);
                    content = content.Replace("{{Phone}}", taikhoan.sodienthoaiKH);
                    content = content.Replace("{{Email}}", taikhoan.emailKH);
                    content = content.Replace("{{Address}}", taikhoan.diachiKH);
                    /* var toEmail = ConfigurationManager.AppSettings["ToEmailAddress"].ToString();*/
                    var toEmail = email;
                    new MailHelper().SendMail(toEmail, "Kích hoạt tài khoản thành công", content);

                    database.TaiKhoanKhachHangs.Add(taikhoan);
                    database.SaveChanges();

                    // Áp dụng Proxy
                   /* ProxyTaiKhoan proxytaikhoan = new ProxyTaiKhoan(taikhoan);
                    proxytaikhoan.addTaiKhoanDB(database);*/
                    return RedirectToAction("Index", new { @onclick = "return Submit();" });
                }
                else
                {
                    ViewBag.Error = "Đã tồn tại Email này!";
                    return View("TaoTaiKhoanKhachHang");
                }
            }
            else
            {
                ViewBag.Error = "Mật khẩu không trùng khớp";
                return View("TaoTaiKhoanKhachHang");
            }
        }
        /*Login*/
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(string em, string pass)
        {

            // kiểm tra tài khoản có tồn tại và có bị block hay không ?
            var check = database.TaiKhoanKhachHangs.Where(a => a.emailKH == em && a.Password == pass && a.maTT == 1 || a.emailKH == em && a.Password == pass && a.maTT == 3).FirstOrDefault();
            //Kiểm tra tài khoản có bị block hay không
            var checkBlock = database.TaiKhoanKhachHangs.Where(a => a.emailKH == em && a.Password == pass && a.maTT == 2).FirstOrDefault();
            if (check != null)
            {
                Session["User"] = check.tenKH;
                Session["Email"] = check.emailKH;
                return RedirectToAction("Index", "User");
            }
            else if (checkBlock != null)
            {
                ViewBag.ErrorLogin = "Tài khoản của bạn đã bị Block!";
                return View("Login", "User", ViewBag);
            }
            else
            {
                ViewBag.ErrorLogin = "Sai tài khoản hoặc mật khẩu!";
                return View("Login", "User");
            }
        }

        // Design pattern Template Methol
        //Check Session
        public bool CheckTaiKhoan()
        {
            if (Session["User"] != null)
                return true;
            return false;
        }
        //ID User
        public TaiKhoanKhachHang IdentityTaiKhoan()
        {
            string email = Session["Email"].ToString();
            TaiKhoanKhachHang tk = database.TaiKhoanKhachHangs.Where(a => a.emailKH == email).SingleOrDefault();
            return tk;
        }
        //Get Info Tài khoản
        public void GetInfoTaiKhoan(TaiKhoanKhachHang tk)
        {
       
            ViewBag.email = tk.emailKH;
            ViewBag.hotenKH = tk.tenKH;
            ViewBag.ctTinhTrang = tk.TinhTrangTaiKhoan.tenTinhTrang;
            ViewBag.sodienthoai = tk.sodienthoaiKH;
            ViewBag.diachi = tk.diachiKH;
            ViewBag.diachitinh = tk.tinhKH;
            ViewBag.diachihuyen = tk.huyenKH;
        }
        //Get Tài khoản khách hàng - TemplateMethod pattern
        public void GetTaiKhoan()
        {
            if (CheckTaiKhoan() == true)
            {
                GetInfoTaiKhoan(IdentityTaiKhoan());
            }
        }
   
       
        public ActionResult ChangePass(TaiKhoanKhachHang taikhoan, string pass, string newpass, string nhaplaipass)
        {
            string email = Session["Email"].ToString();
            taikhoan = database.TaiKhoanKhachHangs.Where(s => s.emailKH == email && s.Password == pass).FirstOrDefault();
            
            if (taikhoan != null)
            {
                if (newpass == nhaplaipass)
                {
                    taikhoan.Password = newpass;
                    database.Entry(taikhoan).State = System.Data.Entity.EntityState.Modified;
                    database.SaveChanges();
                    ViewBag.Error_ChangePass = "Đổi mật khẩu thành công";
                }
                else
                {
                    ViewBag.Error_ChangePass = "Mật khẩu không trùng khớp";
                }
                return View("ChangePass", "User", taikhoan);
            }
            else
            {
                ViewBag.Error_ChangePass = "Mật khẩu cũ không đúng!";
                return View("ChangePass", "User", taikhoan);
            }
        }

        public ActionResult T_Shirl(string searchBy)
        {
            ViewBag.hethang = "sản phẩm đã hết!";
            if (searchBy == "Duoi100")
            {
                var Duoi100 = database.DauSanPhams.Where(a => a.giaSP < 100000).ToList();
                return View(Duoi100);
            }
            if (searchBy == "Tren100")
            {
                var Tren100 = database.DauSanPhams.Where(a => a.giaSP > 100000 && a.giaSP < 250000).ToList();
                return View(Tren100);
            }
            if (searchBy == "Tren250")
            {
                var Tren250 = database.DauSanPhams.Where(a => a.giaSP > 250000 && a.giaSP < 400000).ToList();
                return View(Tren250);
            }
            if (searchBy == "Tren400")
            {
                var Tren400 = database.DauSanPhams.Where(a => a.giaSP > 400000 && a.giaSP < 550000).ToList();
                return View(Tren400);
            }

            else
                return View(database.DauSanPhams.ToList());

        }
        public ActionResult POLO(string searchBy, string sanphamcu, string sanphammoi)
        {
            ViewBag.hethang = "sản phẩm đã hết!";
            if (searchBy == "Duoi100")
            {
                var Duoi100 = database.DauSanPhams.Where(a => a.giaSP < 100000).ToList();
                return View(Duoi100);
            }
            if (searchBy == "Tren100")
            {
                var Tren100 = database.DauSanPhams.Where(a => a.giaSP > 100000 && a.giaSP < 250000).ToList();
                return View(Tren100);
            }
            if (searchBy == "Tren250")
            {
                var Tren250 = database.DauSanPhams.Where(a => a.giaSP > 250000 && a.giaSP < 400000).ToList();
                return View(Tren250);
            }
            if (searchBy == "Tren400")
            {
                var Tren400 = database.DauSanPhams.Where(a => a.giaSP > 400000 && a.giaSP < 550000).ToList();
                return View(Tren400);
            }
            
            else
                return View(database.DauSanPhams.ToList());

        }
        public ActionResult SWEATERS(string searchBy)
        {
            ViewBag.hethang = "sản phẩm đã hết!";
            if (searchBy == "Duoi100")
            {
                var Duoi100 = database.DauSanPhams.Where(a => a.giaSP < 100000).ToList();
                return View(Duoi100);
            }
            if (searchBy == "Tren100")
            {
                var Tren100 = database.DauSanPhams.Where(a => a.giaSP > 100000 && a.giaSP < 250000).ToList();
                return View(Tren100);
            }
            if (searchBy == "Tren250")
            {
                var Tren250 = database.DauSanPhams.Where(a => a.giaSP > 250000 && a.giaSP < 400000).ToList();
                return View(Tren250);
            }
            if (searchBy == "Tren400")
            {
                var Tren400 = database.DauSanPhams.Where(a => a.giaSP > 400000 && a.giaSP < 550000).ToList();
                return View(Tren400);
            }

            else
                return View(database.DauSanPhams.ToList());

        }
        public ActionResult HOODIES(string searchBy)
        {
            ViewBag.hethang = "sản phẩm đã hết!";
            if (searchBy == "Duoi100")
            {
                var Duoi100 = database.DauSanPhams.Where(a => a.giaSP < 100000).ToList();
                return View(Duoi100);
            }
            if (searchBy == "Tren100")
            {
                var Tren100 = database.DauSanPhams.Where(a => a.giaSP > 100000 && a.giaSP < 250000).ToList();
                return View(Tren100);
            }
            if (searchBy == "Tren250")
            {
                var Tren250 = database.DauSanPhams.Where(a => a.giaSP > 250000 && a.giaSP < 400000).ToList();
                return View(Tren250);
            }
            if (searchBy == "Tren400")
            {
                var Tren400 = database.DauSanPhams.Where(a => a.giaSP > 400000 && a.giaSP < 550000).ToList();
                return View(Tren400);
            }

            else
                return View(database.DauSanPhams.ToList());

        }
      

        public Cart GetCart()
        {
            Cart cart = Session["Cart"] as Cart;
            // kiểm tra nếu cart bằng 0 hoặc ses giỏ hàng null thì tạo mới giở hàng và gán vào ses
            if (cart == null || Session["Cart"] == null)
            {
                cart = new Cart();
                Session["Cart"] = cart;
            }
            return cart;
        }
        public ActionResult CartNull()
        {
            return View();
        }

        public ActionResult Cart()
        {
            //if (Session["Cart"] == null)
            //    return RedirectToAction("Cart", "MainUser");

            if (Session["User"] != null)
            {
                Cart _cart = Session["Cart"] as Cart;
                if (_cart == null)
                {
                    return RedirectToAction("CartNull", "User");
                }
                else
                {

                    ViewBag.TenUse = Session["User"];
                    ViewBag.MSSV = Session["MSSV"];
                    return View(_cart);
                }

            }
            else
            {
                return RedirectToAction("Login", "User");
            }
        }
        //Phương thức add item vào giở hàng
       /* [HttpPost]*/
        public ActionResult AddToCart(int id, string _size, FormCollection frm)
        {
         /*   string ganderradio = frm["Gander"].ToString();
            ViewBag.size = ganderradio;*/
            string size = "M";
                if (Session["User"] != null)
                {
                    /*                    var sanpham = database.SanPhams.FirstOrDefault(a => a.maDSP == id && a.size.Contains(size) && a.matinhTrang == 1);*/
                    var sp = database.DauSanPhams.Where(a => a.maDSP == id).ToList();

                    if (sp != null)
                    {
                       /* var sanpham = database.SanPhams.FirstOrDefault(a => a.maDSP == id &&  a.size.Contains(size) && a.matinhTrang == 1);*/
                    var dausanpham = database.DauSanPhams.FirstOrDefault(a => a.maDSP == id && a.soluongSP != 0);

                        GetCart().Add(dausanpham);
                    }
                    return RedirectToAction("ShowToCart", "User");
                }
                else
                {
                    return RedirectToAction("Login", "User");
                }
        }
        //trang giở hàngsss
        public ActionResult ShowToCart(FormCollection frm)
        {
         /*   string ganderradio = frm["Gander"].ToString();
            ViewBag.size = ganderradio;*/
            if (Session["Cart"] == null)
            {
                return RedirectToAction("CartNull", "User");
            }
            Cart cart = Session["Cart"] as Cart;

            return View(cart);

        }
      /*  public ActionResult Choose_size(FormCollection form)
        {
            Cart cart = Session["Cart"] as Cart;
            int id_sp = int.Parse(form["ID_sp"]);
            string _size = form["Gander"];
            cart.Choose_size(id_sp, _size);
            return RedirectToAction("ShowToCart", "User");
        }*/
        public ActionResult update_quatity_(FormCollection form)
        {
            Cart cart = Session["Cart"] as Cart;
            int id_sp = int.Parse(form["ID_sanpham"]);
            int quantity = int.Parse(form["Quatity"]);
            cart.update_quatity_(id_sp, quantity);
            return RedirectToAction("ShowToCart", "User");
        }
      

        public ActionResult Remove_CartItem(int id)
        {
            Cart cart = Session["Cart"] as Cart;
            cart.Remove_CartItem(id);
            return RedirectToAction("ShowToCart", "User");
        }

        public ActionResult DatHang(TaiKhoanKhachHang taikhoan, double TongHoaDon,string ghichuHD, FormCollection frm, double TongofSP, int Quatity)
        {
            Cart cart = Session["Cart"] as Cart;
            /*   Session["ganderradio"] = frm["Gander"].ToString();*/
            string tinh = frm["billing_address_1"].ToString();

            string email = Session["Email"].ToString();
            taikhoan = database.TaiKhoanKhachHangs.Where(a => a.emailKH == email).SingleOrDefault();
            if (Session["User"] != null)
            {
                var im = cart.Items;
              
                int aa = cart.Items.Count();
                HD hoadon = new HD();
                foreach (var item in cart.Items)
                {
                    for (int i = 0; i < item._shopping_quantity; i++)
                    {
                       /* HD hoadon = new HD();*/
                        var sp = database.SanPhams.FirstOrDefault(a => a.maDSP == item._shopping_SanPham.maDSP && a.size.Contains("M") && a.matinhTrang == 1);
                   
                        var dausanpham = database.DauSanPhams.Where(a => a.maDSP == item._shopping_SanPham.maDSP).FirstOrDefault();
                        if (sp != null)
                        {
                            sp.matinhTrang = 2;
                            var chitietHD = new ChiTietHoaDon();
                            dausanpham.soluongSP -= 1;
                            chitietHD.maSP = sp.maSP;
                            chitietHD.Tong = TongofSP;
                            chitietHD.maHD = hoadon.maHD;
                            chitietHD.soluongDatSP = item._shopping_quantity;
                            database.ChiTietHoaDons.Add(chitietHD);
                          

                        }
                        if (aa == 1)
                        {
                            hoadon.soluong = item._shopping_quantity;
                        }
                        else
                            hoadon.soluong = aa;

                   

                    }
                }
                
                hoadon.TongHD = TongHoaDon;
                hoadon.NgayDat = DateTime.Now;
                hoadon.maKH = taikhoan.maKH;
                hoadon.ghichuHD = ghichuHD;
                hoadon.maTT = 1;
                database.HDs.Add(hoadon);
                database.SaveChanges();

                Session["ThanhCong"] = "suss";
                cart.RemoveAllItem();
                return RedirectToAction("ShowToCart", "User");
            
            }
            else
            {
                Session["KhongThamhCong"] = "fail";
                return RedirectToAction("Login", "User");
            }    
        }

        /*Hiển thị thông tin user*/
        // Áp dụng template methol hiển thị Tài khoản khách hàng
        public ActionResult DetailTaiKhoan()
        {
            if (Session["User"] != null)
            {
                /*string email = Session["Email"].ToString();
                var taikhoan = database.TaiKhoanKhachHangs.Where(a => a.emailKH == email).SingleOrDefault();
                ViewBag.email = email;
                ViewBag.hotenKH = taikhoan.tenKH;
                ViewBag.ctTinhTrang = taikhoan.TinhTrangTaiKhoan.tenTinhTrang;
                ViewBag.sodienthoai = taikhoan.sodienthoaiKH;
                ViewBag.diachi = taikhoan.diachiKH;*/
                GetTaiKhoan();
                return View();
            }
            else
            {
                return RedirectToAction("Login", "MainUser");
            }
        }
        public PartialViewResult BagCart()
        {
            int _t_item = 0;
            Cart cart = Session["Cart"] as Cart;
            if (cart != null)
            {
                _t_item = cart.total_Quantity();

            }
            ViewBag.intoCart = _t_item;
            return PartialView("BagCart");
        }

        [HttpGet]
        public ActionResult HoaDon( TaiKhoanKhachHang taikhoan, FormCollection frm, string thanhphoKH)
        {
            Cart ca = Session["Cart"] as Cart;
         /*   _clientId = config["PaypalSettings:ClientId"];
            _secretKey = config["PaypalSettings:SecretKey"];*/
            /*Cart cart = Session["Cart"] as Cart;*/
            string email = Session["Email"].ToString();
        /*    string ganderradio = frm["Gander"].ToString();*/
            taikhoan = database.TaiKhoanKhachHangs.Where(a => a.emailKH == email).SingleOrDefault();
            if (Session["User"] != null)
            {
                /* ViewBag.diachitinh = taikhoan.tinhKH;
                 ViewBag.diachihuyen = taikhoan.huyenKH;
                 ViewBag.tenKH = taikhoan.tenKH;
                 ViewBag.emailKH = taikhoan.emailKH;
                 ViewBag.sdtKH = taikhoan.sodienthoaiKH;
                 ViewBag.diachiKH = taikhoan.diachiKH;*/

                // áp dụng disign pattern tempalte methol vào thông tin khách hàng khi đặt hàng
                GetTaiKhoan();
                string tinhship = thanhphoKH;
                if (taikhoan.tinhKH.Contains("Thành phố Hồ Chí Minh"))
                {
                    ViewBag.phiship = "25000";
                    double tong = 25000 + ca.Total_shopping();
                    ViewBag.tong = tong;
                }
                else
                {
                    ViewBag.phiship = "35000";
                    double tong = 35000 + ca.Total_shopping();
                    ViewBag.tong = tong;
                }
            }
            if (Session["Cart"] == null)
            {
                return RedirectToAction("CartNull", "User");
            }
            return View(ca);
        }

        //work with Paypal payment


        // Create a payment using an APIContext
     /*   private Payment CreatePayment(APIContext apiContext, string redirectUrl)
        {
            Cart cart = Session["Cart"] as Cart;

            var listItems = new ItemList() { items = new List<Item>() };
            List<Cart> listCart = (List<Cart>)Session["Cart"];
            foreach ( var cart in listCart)
            {
                listItems.items.Add(new Item()
                {
                    name = cart.pro
                });
            }
            var payer = new Payer() { payment_method = "paypal" };

            var redirUrls = new RedirectUrls()
            {
                cancel_url = redirectUrl,
                return_url = redirectUrl
            };
            //create deatail  object
            var deatail = new Details()
            {
                tax = "1",
                shipping = "2",
                subtotal = listCart.Sum(x => x.quatiy_Items );
         *//* Convert.ToDouble(Cart._shopping_SanPham.giaSP.Value * item._shopping_quantity);*//*
         }
        }*/
    }

}