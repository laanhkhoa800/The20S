using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Code_CH.Models;

namespace Code_CH.Controllers
{
    public interface IIteratorTaiKhoan
    {
        // Hóa đơn
        TaiKhoanKhachHang First();
        TaiKhoanKhachHang Next();
        bool IsDone { get; }
        TaiKhoanKhachHang CurrentItem { get; }
    }
    public class TaiKhoansIIterator : IIteratorTaiKhoan
    {

        public List<TaiKhoanKhachHang> _listTaiKhoan { get; } = new List<TaiKhoanKhachHang>();
        int current = 0;
        int step = 1;
        public TaiKhoansIIterator(List<TaiKhoanKhachHang> listTaiKhoan)
        {
            _listTaiKhoan = listTaiKhoan;
        }

        public bool IsDone
        {
            get { return current >= _listTaiKhoan.Count; }
        }

        public TaiKhoanKhachHang CurrentItem => _listTaiKhoan[current];



        TaiKhoanKhachHang IIteratorTaiKhoan.CurrentItem => throw new NotImplementedException();

        public TaiKhoanKhachHang First()
        {
            current = 0;
            return _listTaiKhoan[current];
        }

        public TaiKhoanKhachHang Next()
        {
            current += step;
            if (!IsDone)
                return _listTaiKhoan[current];
            else
                return null;
        }

        TaiKhoanKhachHang IIteratorTaiKhoan.First()
        {
            current = 0;
            return _listTaiKhoan[current];
        }

        TaiKhoanKhachHang IIteratorTaiKhoan.Next()
        {
            current += step;
            if (!IsDone)
                return _listTaiKhoan[current];
            else
                return null;
        }
    }
}