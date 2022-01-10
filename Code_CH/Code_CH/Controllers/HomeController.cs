using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;
using Code_CH.Models;


namespace Code_CH.Controllers
{
    public class HomeController : Controller
    {
        CuaHangEntities database = new CuaHangEntities();
        public ActionResult Index(string search)
        {
            return View();
            /*  var soluongsanpham = database.SanPhams.Where(a => a.matinhTrang != 2 &&a.matinhTrang != 3).ToList();
              ViewBag.soluong = soluongsanpham.Count();
              var soluonglendon = database.SanPhams.Where(a => a.matinhTrang == 2).ToList();
              ViewBag.dalendon = soluonglendon.Count();
              var soluongdanggiao = database.SanPhams.Where(a => a.matinhTrang == 3).ToList();
              ViewBag.danggiao = soluongdanggiao.Count();

              if(search != null)
              {
                  return View(database.DauSanPhams.Where(a => a.tenSP.StartsWith(search) || a.loaiSP.StartsWith(search)).ToList());
              }
              else
              {
                  return View(database.DauSanPhams);
              }*/
        }
        [HttpPost]
        public ActionResult Index(Accout_Admin ad)
        {
            var check = database.Accout_Admin.Where(s => s.User.Equals(ad.User) && s.Password.Equals(ad.Password)).FirstOrDefault();
            if (check == null)
            {
                ViewBag.Error = "Sai tên đăng nhập hoặc mật khẩu!";
                return View("", ad);
            }
            else
            {
                Session["Admin"] = ad.User;
                return RedirectToAction("DauSanPham", "Home");
            }
        }
        public ActionResult DauSanPham(string search)
        {
            var soluongsanpham = database.SanPhams.Where(a => a.matinhTrang != 2 && a.matinhTrang != 3).ToList();
            ViewBag.soluong = soluongsanpham.Count();
            var soluonglendon = database.SanPhams.Where(a => a.matinhTrang == 2).ToList();
            ViewBag.dalendon = soluonglendon.Count();
            var soluongdanggiao = database.SanPhams.Where(a => a.matinhTrang == 3).ToList();
            ViewBag.danggiao = soluongdanggiao.Count();

            if (search != null)
            {
                return View(database.DauSanPhams.Where(a => a.tenSP.StartsWith(search) || a.loaiSP.StartsWith(search)).ToList());
            }
            else
            {
                //áp dụng singleton
                SanPhamSingleton.Instance.Init(database);
                var listDauSanPham = SanPhamSingleton.Instance.listDauSanPham;
                return View(listDauSanPham);
            }
        }
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(Accout_Admin ad)
        {
            var check = database.Accout_Admin.Where(s => s.User.Equals(ad.User) && s.Password.Equals(ad.Password)).FirstOrDefault();
            if (check == null)
            {
                ViewBag.Error = "Sai tên đăng nhập hoặc mật khẩu!";
                return View("", ad);
            }
            else
            {
                Session["Admin"] = ad.User;
                return RedirectToAction("Index", "Home");
            }
        }
       
        /*----- Đăng xuất -----*/

        public ActionResult Logout(Accout_Admin ad)
        {
            Session["Admin"] = null;
            return RedirectToAction("", "");

        }

        /*---- Đổi mật khẩu ----*/
        public ActionResult ChangePass()
        {
            return View();
        }
        [HttpPost]
        public ActionResult ChangePass(Accout_Admin ad, string _name, string _newPass, string _nhapLaiPass)
        {
            ad = database.Accout_Admin.Where(s => s.maAdmin == 1 && s.Password == _name).FirstOrDefault();
            if (ad != null)
            {
                if (_newPass == _nhapLaiPass)
                {
                    ad.Password = _newPass;
                    database.Entry(ad).State = System.Data.Entity.EntityState.Modified;
                    database.SaveChanges();
                    ViewBag.Error_ChangePass = "Đổi mật khẩu thành công";
                }
                else
                {
                    ViewBag.Error_ChangePass = "Mật khẩu không trùng khớp";
                }
                return View("ChangePass", ad);
            }
            else
            {
                ViewBag.Error_ChangePass = "Mật khẩu cũ không đúng!";
                return View("ChangePass", ad);

            }
        }

        /*Quản lí đầu sản phẩm*/
        public ActionResult ThemDauSanPham()
        {
            DauSanPham dsp = new DauSanPham();
            return View(dsp);
        }

        [HttpPost]
        public object ThemDauSanPham(DauSanPham sanpham, string imageUploader, string loaiSP, string imageUploader2, string imageUploader3, string imageUploader4, string imageUploader5, string imageUploader6)
        {
            if (sanpham.imageUploader != null)
            {
                string fileName = Path.GetFileNameWithoutExtension(sanpham.imageUploader.FileName);
                string extension = Path.GetExtension(sanpham.imageUploader.FileName);
                fileName = fileName + extension;
                string fileName2 = Path.GetFileNameWithoutExtension(sanpham.imageUploader2.FileName);
                string extension2 = Path.GetExtension(sanpham.imageUploader2.FileName);
                fileName2 = fileName2 + extension2;
                string fileName3 = Path.GetFileNameWithoutExtension(sanpham.imageUploader3.FileName);
                string extension3 = Path.GetExtension(sanpham.imageUploader3.FileName);
                fileName3 = fileName3 + extension3;
                string fileName4 = Path.GetFileNameWithoutExtension(sanpham.imageUploader4.FileName);
                string extension4 = Path.GetExtension(sanpham.imageUploader4.FileName);
                fileName4 = fileName4 + extension4;
                string fileName5 = Path.GetFileNameWithoutExtension(sanpham.imageUploader5.FileName);
                string extension5 = Path.GetExtension(sanpham.imageUploader5.FileName);
                fileName5 = fileName5 + extension5;
                string fileName6 = Path.GetFileNameWithoutExtension(sanpham.imageUploader6.FileName);
                string extension6 = Path.GetExtension(sanpham.imageUploader6.FileName);
                fileName6 = fileName6 + extension6;
                sanpham.loaiSP = loaiSP;
                sanpham.hinhanhSP = "~/Content/Image_SanPham/" + fileName;
                sanpham.hinhanhphu1 = "~/Content/Image_SanPham/" + fileName2;
                sanpham.hinhanhphu2 = "~/Content/Image_SanPham/" + fileName3;
                sanpham.hinhanhphu3 = "~/Content/Image_SanPham/" + fileName4;
                sanpham.hinhanhphu4 = "~/Content/Image_SanPham/" + fileName5;
                sanpham.hinhanhphu5 = "~/Content/Image_SanPham/" + fileName6;
                sanpham.imageUploader.SaveAs(Path.Combine(Server.MapPath("~/Content/Image_SanPham/"), fileName));

                sanpham.imageUploader2.SaveAs(Path.Combine(Server.MapPath("~/Content/Image_SanPham/"), fileName2));
                sanpham.imageUploader3.SaveAs(Path.Combine(Server.MapPath("~/Content/Image_SanPham/"), fileName3));
                sanpham.imageUploader4.SaveAs(Path.Combine(Server.MapPath("~/Content/Image_SanPham/"), fileName4));
                sanpham.imageUploader5.SaveAs(Path.Combine(Server.MapPath("~/Content/Image_SanPham/"), fileName5));
                sanpham.imageUploader6.SaveAs(Path.Combine(Server.MapPath("~/Content/Image_SanPham/"), fileName6));
                sanpham.soluongSP = 0;

                //áp dụng Design pattern Prototype 
                /*  var cloneDSP = sanpham.Clone();
                  database.DauSanPhams.Add((DauSanPham)cloneDSP);*/
                database.DauSanPhams.Add(sanpham);
                database.SaveChanges();
              

            }
            return RedirectToAction("DauSanPham", "Home", sanpham);


        }
        [HttpGet]
        [validateAntiForgrytoken]
        public ActionResult DPrototype(int id)
        {
            DauSanPham dausanpham = database.DauSanPhams.Find(id);
            var cloneDauSanPham = dausanpham.Clone();
            database.DauSanPhams.Add((DauSanPham)cloneDauSanPham);
            database.SaveChanges();
            return RedirectToAction("DauSanPham", "Home");
        }
        /*   [HttpPost]
       public object ThemDauSanPham( DauSanPham dausanpham, string imageUploader, string tenSanPham, string theLoai, float gia)
         {
             try
             {
                 if (dausanpham.imageUploader != null)
                 {
                     string fileName = Path.GetFileNameWithoutExtension(dausanpham.imageUploader.FileName);
                     string extension = Path.GetExtension(dausanpham.imageUploader.FileName);
                     fileName = fileName + extension;
                     dausanpham.hinhanhSP = "~/Content/Image_SanPham/" + fileName;
                     dausanpham.imageUploader.SaveAs(Path.Combine(Server.MapPath("~/Content/imgsach/"), fileName));
                 }

                 var check = database.DauSanPhams.Where(a => a.maDSP == maDauSanPham).SingleOrDefault();
                 if (check == null)
                 {
                     *//* sanpham.maDSP = maDauSanPham;*//*
                     dausanpham.tenSP = tenSanPham;
                     dausanpham.loaiSP = theLoai;
                     dausanpham.soluongSP = 0;
                     dausanpham.giaSP = gia;

                     database.DauSanPhams.Add(dausanpham);
                     *//* database.SubmitChanges();*//*
                     database.SaveChanges();
                     return RedirectToAction("Index", "Home", dausanpham);

                 }
                 else
                 {
                     ViewBag.ThemDauSanPham = "Trùng mã sản phẩm!";
                     return View(dausanpham);
                 }
             }
             catch
             {
                 return View(Content("Dữ Liệu đã tồn tại!!"));
             }
         }*/
        public ActionResult SuaDauSanPham(int id)
        {
            return View(database.DauSanPhams.Where(a => a.maDSP == id).FirstOrDefault());
        }
        [HttpPost]
        public ActionResult SuaDauSanPham(int id, DauSanPham DauSanPham, string imageUploader, string imageUploader2, string imageUploader3, string imageUploader4, string imageUploader5, string imageUploader6)
        {
            DauSanPham = database.DauSanPhams.Where(item => item.maDSP == id).SingleOrDefault();
            DauSanPham.hinhanhSP = "~/Content/Image_SanPham/" + imageUploader;
            DauSanPham.hinhanhphu1 = "~/Content/Image_SanPham/" + imageUploader2;
            DauSanPham.hinhanhphu2 = "~/Content/Image_SanPham/" + imageUploader3;
            DauSanPham.hinhanhphu3 = "~/Content/Image_SanPham/" + imageUploader4;
            DauSanPham.hinhanhphu4 = "~/Content/Image_SanPham/" + imageUploader5;
            DauSanPham.hinhanhphu5 = "~/Content/Image_SanPham/" + imageUploader6;
            database.Entry(DauSanPham).State = System.Data.Entity.EntityState.Modified;
            database.SaveChanges();
            /*ViewBag.SuaDauSach_suss = "Sửa thành công !!!";*/
            return RedirectToAction("DauSanPham", "Home", DauSanPham);
        }
        public ActionResult EditUploadImage(int id)
        {
            return View(database.DauSanPhams.Where(a => a.maDSP == id).FirstOrDefault());
        }
        [HttpPost]
        public ActionResult EditUploadImage(int id, DauSanPham DauSanPham, string imageUploader, string imageUploader2, string imageUploader3, string imageUploader4, string imageUploader5, string imageUploader6)
        {
            DauSanPham = database.DauSanPhams.Where(item => item.maDSP == id).SingleOrDefault();
            DauSanPham.hinhanhSP = "~/Content/Image_SanPham/" + imageUploader;
            DauSanPham.hinhanhphu1 = "~/Content/Image_SanPham/" + imageUploader2;
            DauSanPham.hinhanhphu2 = "~/Content/Image_SanPham/" + imageUploader3;
            DauSanPham.hinhanhphu3 = "~/Content/Image_SanPham/" + imageUploader4;
            DauSanPham.hinhanhphu4 = "~/Content/Image_SanPham/" + imageUploader5;
            DauSanPham.hinhanhphu5 = "~/Content/Image_SanPham/" + imageUploader6;
            database.Entry(DauSanPham).State = System.Data.Entity.EntityState.Modified;
            database.SaveChanges();
            /*ViewBag.SuaDauSach_suss = "Sửa thành công !!!";*/
            return RedirectToAction("EditUploadImage", "Home", DauSanPham);
        }
        [HttpGet]
        public ActionResult XoaDauSanPham(int id)
        {
            ViewBag.Message = string.Format("Hello {0}.\\nCurrent Date and Time: {1}", id, DateTime.Now.ToString());
            var DauSanPham = database.DauSanPhams.Where(a => a.maDSP == id).SingleOrDefault();
            database.DauSanPhams.Remove(DauSanPham);
            database.SaveChanges();
            return RedirectToAction("SuaDauSanPham", "Home");
        }
        /*Chi tiết sản phẩm*/
        public ActionResult ChiTietSanPham(string search)
        {
            var soluongsanpham = database.SanPhams.Where(a => a.matinhTrang != 2 && a.matinhTrang != 3).ToList();
           ViewBag.soluong= soluongsanpham.Count();
            if(search != null)
            {
                var soluongsearch = database.SanPhams.Where(a => a.DauSanPham.tenSP.StartsWith(search) || a.size.StartsWith(search)).ToList();
                ViewBag.soluongsearch = soluongsearch.Count();
                return View(database.SanPhams.Where(a => a.DauSanPham.tenSP.StartsWith(search) || a.size.StartsWith(search)).ToList());
            }
            else
            {
                return View(database.SanPhams);
            }
        }
        [HttpGet]
        public ActionResult XoaSanPham(int id)
        {
            ViewBag.Message = string.Format("Hello {0}.\\nCurrent Date and Time: {1}", id, DateTime.Now.ToString());
            var sanPham = database.SanPhams.Where(a => a.maSP == id).SingleOrDefault();
            database.SanPhams.Remove(sanPham);
            database.SaveChanges();
            return RedirectToAction("ChiTietSanPham", "Home");

        }

        //Thêm Chi tiết sản phẩm
        public ActionResult ThemChiTietSanPham(int id)
        {
            var flag = database.DauSanPhams.Where(a => a.maDSP == id).SingleOrDefault();
            SanPham dsp = new SanPham();
            return View(dsp);
        }
        [HttpPost]
        public ActionResult ThemChiTietSanPham(SanPham sanpham, int id, int sks, string siz)
        {

            var DauSanPham = database.DauSanPhams.Where(a => a.maDSP == id).SingleOrDefault();
            var checkSoLuong = database.SanPhams.Where(a => a.maDSP == id).Count();
            int soluongSP = sks;


            if (checkSoLuong == 0)
            {
                for (int i = 1; i <= soluongSP; i++)
                {
                    var a = new SanPham();
                    a.maSP = id;
                    a.maDSP = DauSanPham.maDSP;
                    a.sokiemsoat = i;
                    a.size = siz;
                    a.matinhTrang = 1;
                    /*   database.SanPhams.Add(a);*/

                    // design pattern Proxy
                    Proxy proxy = new Proxy(a);
                    proxy.addSanPhamDB(database);
                }
                /*----- Cap nhat so luong -----*/

                DauSanPham.soluongSP += soluongSP;

             /*   database.SaveChanges();*/
                ViewBag.ThemSach_message_suss = "Thêm thành công!";
                return RedirectToAction("DauSanPham", "Home");
            }
            else
            {
                for (int i = checkSoLuong + 1; i <= checkSoLuong + soluongSP; i++)
                {
                    var a = new SanPham();
                    a.maDSP = id;
                    a.sokiemsoat = i;
                    a.size = siz;
                    a.matinhTrang = 1;
                    /* database.SanPhams.Add(a);*/
                    Proxy proxy = new Proxy(a);
                    proxy.addSanPhamDB(database);
                }
                /*----- Cap nhat so luong -----*/
                DauSanPham.soluongSP += soluongSP;

                database.SaveChanges();
                ViewBag.ThemSach_message_suss = "Thêm thành công!";
                return RedirectToAction("DauSanPham", "Home");
            }
        }
        // quản lí taikhoankhachhang
        public ActionResult DS_TaiKhoan(string search)
        {
            var tkkh = database.TaiKhoanKhachHangs.Where(a => a.maKH != 0).ToList();
            ViewBag.soluongtaikhoan = tkkh.Count();

            if(search != null)
            {
                return View(database.TaiKhoanKhachHangs.Where(a => a.tenKH.StartsWith(search) || a.emailKH.StartsWith(search) || a.sodienthoaiKH.StartsWith(search)).ToList());
            }
            else
            {
                IIteratorTaiKhoan iterator = new TaiKhoansIIterator(tkkh);
                var taikhoan = iterator.First();
                while (!iterator.IsDone)
                {
                    if (taikhoan.maTT != 2)
                    {
                        taikhoan.TinhTrangTaiKhoan.tenTinhTrang = "block";
                        database.SaveChanges();
                    }
                    taikhoan = iterator.Next();
                }
                return View(tkkh);
             /*   return View(database.TaiKhoanKhachHangs);*/
            }
        }
        //Danh sách tài khoản active
        public ActionResult DS_TaiKhoanActive()
        {
            var active = database.TaiKhoanKhachHangs.Where(a => a.maKH != 3 && a.maTT == 1).ToList();
            ViewBag.soluongtaikhoan = active.Count();
            return View(active);
        }
        public ActionResult DS_TaiKhoanBlock()
        {
            var block = database.TaiKhoanKhachHangs.Where(a => a.maKH != 3 && a.maTT == 2).ToList();
            ViewBag.soluongtaikhoan = block.Count();
            return View(block);
        }
        //Block thẻ thư viện
        [HttpGet]
        public ActionResult BlockTaiKhoanKhachHang(int id)
        {
            var taikhoan = database.TaiKhoanKhachHangs.Where(a => a.maKH == id).SingleOrDefault();
            /*  var donhang = database.HDs.Where(a => a.maKH == taikhoan.maKH && a.maTT != 4).SingleOrDefault();*/
            if (taikhoan.maTT != 1)
            {
                taikhoan.maTT = 2;
                database.Entry(taikhoan).State = System.Data.Entity.EntityState.Modified;
                ViewBag.Mess_BlockTaiKhoan = "Block tài khoản thành công";
                database.SaveChanges();
                return RedirectToAction("DS_TaiKhoanBlock");
            }
            else if (taikhoan.maTT == 2)
            {
                taikhoan.maTT = 1;
                database.Entry(taikhoan).State = System.Data.Entity.EntityState.Modified;
                ViewBag.Mess_BlockTaiKhoan = "Mở tài khoản thành công";
                database.SaveChanges();
                return RedirectToAction("DS_TaiKhoanActive");
            }
            /* else if(donhang != null)
             {
                 taikhoan.maTT = 3;
                 database.Entry(taikhoan).State = System.Data.Entity.EntityState.Modified;
                 ViewBag.Mess_BlockTaiKhoan = "";
                 database.SaveChanges();
             }    */
            return View();
        }
        [HttpGet]
        public ActionResult XoaTaiKhoan(int id)
        {
            var xoataikhoan = database.TaiKhoanKhachHangs.Where(a => a.maKH == id).SingleOrDefault();
            // kiểm tra chỉ được xoá khi tài khoản k mượn sách
            if (xoataikhoan.maTT != 3)
            {
                database.TaiKhoanKhachHangs.Remove(xoataikhoan);
                database.SaveChanges();
                return RedirectToAction("DS_TaiKhoan", "Home");
            }
            else
            {
                Session["XoaTaiKhoan"] = "true";
                return RedirectToAction("DS_TaiKhoan", "Home");
            }


        }
        // danh sách đơn đặt hàng
        public ActionResult DS_DonDatHang()
        {
            var Hd = database.HDs.Where(a => a.maTT == 1).ToList();
            /*ViewBag.countDonHang = Hd.Count();
            return View(Hd);*/
            IIterator iterator = new DauSanPhamIIterator(Hd);
            var sanPham = iterator.First();
            while (!iterator.IsDone)
            {
                if (sanPham.soluong ==  0 & sanPham.maTT != 1)
                {
                    sanPham.maTT = 2;
                    database.SaveChanges();
                }
                sanPham = iterator.Next();
            }
            return View(Hd);
        }

        [HttpGet]
        public ActionResult lendonhang(int id)
        {
            var HD = database.HDs.Where(a => a.maHD == id).SingleOrDefault();
            HD.maTT = 2;
            database.SaveChanges();
            return RedirectToAction("DS_DonDatHang", "Home");
        }
        public ActionResult DS_DonDaLen()
        {
            var Hd = database.HDs.Where(a => a.maTT == 2).ToList();
            ViewBag.CountDaLen = Hd.Count();
            return View(Hd);
        }
        [HttpGet]
        public ActionResult giaohang(int id)
        {
            var HD = database.HDs.Where(a => a.maHD == id).SingleOrDefault();
            HD.maTT = 3;
            var ct = database.ChiTietHoaDons.Where(a => a.maHD == HD.maHD).FirstOrDefault();
            var sp = database.SanPhams.Where(a => a.maSP == ct.maSP).SingleOrDefault();
            sp.matinhTrang = 3;
            database.SaveChanges();
            return RedirectToAction("DS_DonDaLen", "Home");
        }
        public ActionResult DS_DangGiao()
        {
            var Hd = database.HDs.Where(a => a.maTT == 3).ToList();
            ViewBag.CountDangGiao = Hd.Count();
            return View(Hd);
        }

        [HttpGet]
        public ActionResult GiaoThanhCong(int id)
        {
            var Hd = database.HDs.SingleOrDefault(a => a.maHD == id);


            var ch = database.ChiTietHoaDons.FirstOrDefault(a => a.maHD == Hd.maHD);

            var sp = database.SanPhams.FirstOrDefault(a => a.maSP == ch.maSP);
            Hd.maTT = 4;
            database.SanPhams.Remove(sp);


            BaoCaoDatHang baocao = new BaoCaoDatHang();
            baocao.maDH = Hd.maHD;
            baocao.maKH = Hd.maKH;
            baocao.soluongSP = Hd.soluong;
            baocao.ngayDat = Hd.NgayDat;
            baocao.giaTien = Hd.TongHD;

            database.BaoCaoDatHangs.Add(baocao);
            database.HDs.Remove(Hd);
            database.SaveChanges();

            return RedirectToAction("DS_DangGiao", "Home");
        }
        [HttpGet]
        public ActionResult GiaoThatBai(int id)
        {
            var Hd = database.HDs.Where(a => a.maHD == id).SingleOrDefault();
            var ch = database.ChiTietHoaDons.Where(a => a.maHD == Hd.maHD).SingleOrDefault();

            var sp = database.SanPhams.Where(a => a.maSP == ch.maSP).SingleOrDefault();
            var dau = database.DauSanPhams.Where(a => a.maDSP == sp.maDSP).FirstOrDefault();

            dau.soluongSP += 1;
            sp.matinhTrang = 1;

            database.HDs.Remove(Hd);
            database.ChiTietHoaDons.Remove(ch);

            database.SaveChanges();
            return RedirectToAction("DS_DangGiao", "Home");
        }
        // Báo cáo đơn hàng đã bán
        public ActionResult BaoCaoDonHangDaBan()
        {
            var BaoCao = database.BaoCaoDatHangs.Where(a => a.maDH != null).ToList();
            ViewBag.CountBaoCao = BaoCao.Count();
            return View(database.BaoCaoDatHangs);
        }

        //Báo cáo danh thu của cửa hàng
        [HttpPost]
        public ActionResult BaoCaoDanhThuCuaHang()
        {
            BaoCaoDoanhThu baocaodoanhthu = new BaoCaoDoanhThu();
            var hangton = database.DauSanPhams.Sum(a => a.soluongSP);
            var hangban = database.BaoCaoDatHangs.Sum(a => a.soluongSP);
            var tong = database.BaoCaoDatHangs.Sum(a => a.giaTien);
            //tính toán tình hình kinh doanh

            baocaodoanhthu.soluongTon = (int)hangton;
            baocaodoanhthu.soluongXuat = (int)hangban;
            baocaodoanhthu.ngayTK = DateTime.Now;
            baocaodoanhthu.doanhThu = (float)tong;
            database.BaoCaoDoanhThus.Add(baocaodoanhthu);
            database.SaveChanges();
            return RedirectToAction("DoanhThuThang", "Home");

        }
        [HttpPost]
        public ActionResult ShowDoanhThu()
        {
            //hiển thị số liệu mới nhất
            var newa = database.BaoCaoDoanhThus.Where(a => a.maTK != 0).AsEnumerable();

            /*var lastbaocao =database.BaoCaoDoanhThus.Where(a => a.maTK == newbaocao.maTK).FirstOrDefault();*/

            if (newa.Count() > 0)
            {
                var newbc = newa.Last();
                ViewBag.ngaybaocao = newbc.ngayTK;
                ViewBag.soluongton = newbc.soluongTon;
                ViewBag.soluongxuat = newbc.soluongXuat;
                ViewBag.tong = newbc.doanhThu;

                var soluongtang = newbc.soluongXuat - newbc.soluongXuat;
                var doanhthutang = newbc.doanhThu - newbc.doanhThu;
                ViewBag.saokesoluong = (int)soluongtang;
                ViewBag.saokedoanhthu = (int)doanhthutang;
            }

            return RedirectToAction("DoanhThuThang", "Home");
        }
        //Hiển Thị Báo Cáo Danh Thu Tháng
        public ActionResult DoanhThuThang()
        {
            return View(database.BaoCaoDoanhThus);
        }

        // hiển thị image trang chủ webside


        public ActionResult Animation()
        {
            return View(database.Animations);
        }

        //thêm hình ảnh animation
        public ActionResult Add_Animation(int id)
        {
            return View(database.Animations.Where(a => a.idAnimation == id).FirstOrDefault());
        }
        [HttpPost]
        public ActionResult Add_Animation(int id,Animation ani, string imageUploader, string imageUploader2, string imageUploader3, string imageUploader4)
        {
            ani = database.Animations.Where(item => item.idAnimation == id).SingleOrDefault();
            ani.Img_animation_1 = "~/Content/Image/" + imageUploader;
            ani.Img_animation_2 = "~/Content/Image/" + imageUploader2;
            ani.Img_animation_3 = "~/Content/Image/" + imageUploader3;
            ani.Img_animation_4 = "~/Content/Image/" + imageUploader4;

            database.Entry(ani).State = System.Data.Entity.EntityState.Modified;
            database.SaveChanges();
            return RedirectToAction("Animation", "Home");
        }
    }
}