using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BLL
{
    public class hall
    {
        public int Hid { get; set; }
        public string Hname { get; set; }
        public int containing { get; set; }
        public string pics { get; set; }
        public string location { get; set; }
        public double price { get; set; }
    }
}