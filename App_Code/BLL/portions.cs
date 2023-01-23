using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BLL
{
    public class portions
    {
        public int Pid { get; set; }
        public string Pname { get; set; }
        public string Pdesc { get; set; }
        public double price { get; set; }
        public string picName { get; set; }
        public int portionCatId { get; set; }
    }
}