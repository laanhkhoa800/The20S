using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Code_CH.Models
{

        public class CartItem
        {
            public DauSanPham _shopping_SanPham { get; set; }
            public int _shopping_quantity { get; set; }
            public string _sanpham_size { get; set; }
   
        }
        //Giỏ Hàng
        public class Cart
        {
            List<CartItem> items = new List<CartItem>();
            public IEnumerable<CartItem> Items
            {
                get { return items; }
            }

            public void Add(DauSanPham _sp, int _quantity = 1)
            {
                var item = items.FirstOrDefault(a => a._shopping_SanPham.maDSP == _sp.maDSP );
             
                if (item == null)
                    {
                    items.Add(new CartItem
                    {
                     /*   _Shopping_san = san,*/
                        _shopping_SanPham = _sp,
                        _shopping_quantity = _quantity,
                        /*_shopping_size = ,*/
                    });
                }
                else
                {
                    item._shopping_quantity += _quantity;
                }
            }
        public void Choose_size (int id,string _size)
        {
            var item = items.Find(a => a._shopping_SanPham.maDSP == id);
            if (item != null)
            {
               item._sanpham_size = _size;
            }

        }
        public void update_quatity_(int id, int _quatity)
        {
            var item = items.Find(a => a._shopping_SanPham.maDSP == id);
            if(item != null)
            {
                item._shopping_quantity = _quatity;
            }    
        }
        public double Total_shopping ()
        {
            var total = items.Sum(a => a._shopping_SanPham.giaSP * a._shopping_quantity  );
            return (double)total;
        }
        public int quatiy_Items()
        {
            var qa = items.Sum(a=> a._shopping_quantity);
            return (int)qa;
        }

        public void Remove_CartItem(int id)
        {
            items.RemoveAll(a => a._shopping_SanPham.maDSP == id);
        }
        public void RemoveAllItem()
        {
            items.Clear();
        }
        public int total_Quantity()
        {
            // lấy số lượng trên các dòng và công dồn vào 
            return items.Sum(a => a._shopping_quantity);
        }


    }
  
}