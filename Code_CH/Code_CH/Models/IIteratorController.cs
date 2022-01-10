using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Code_CH.Models;

namespace Code_CH.Controllers
{
    public interface IIterator
    {
        // Hóa đơn
        HD First();
        HD Next();
        bool IsDone { get; }
        HD CurrentItem { get; }
    }
    public class DauSanPhamIIterator : IIterator
    {

        public List<HD> _listDonDatHnag { get; } = new List<HD>();
        int current = 0;
        int step = 1;
        public DauSanPhamIIterator(List<HD> listDonDatHnag)
        {
            _listDonDatHnag = listDonDatHnag;
        }

        public bool IsDone
        {
            get { return current >= _listDonDatHnag.Count; }
        }

        public HD CurrentItem => _listDonDatHnag[current];

        HD IIterator.CurrentItem => throw new NotImplementedException();



        public HD First()
        {
            current = 0;
            return _listDonDatHnag[current];
        }

        public HD Next()
        {
            current += step;
            if (!IsDone)
                return _listDonDatHnag[current];
            else
                return null;
        }

     
    }
}