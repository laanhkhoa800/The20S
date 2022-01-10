using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Code_CH.Models;
using System.Data;

namespace Code_CH.Models
{
    public sealed class  SanPhamSingleton
    {
        // Tạo một đối tượng cho singleton
        public static SanPhamSingleton Instance { get; } = new SanPhamSingleton();
        // tạo list danh sách
        public List<DauSanPham> listDauSanPham { get; } = new List<DauSanPham>();

        // Xét phương thức khởi tạo ở chế độ riêng tư
        // Khơi tạo 
        private SanPhamSingleton() { }
        public void Init(CuaHangEntities database)
        {
            if (listDauSanPham.Count == 0)
            {
                var DauSanPham = (from s in database.DauSanPhams select s).ToList();
                foreach (var item in DauSanPham)
                {
                    listDauSanPham.Add(item);
                }
            }
        }
    }
}