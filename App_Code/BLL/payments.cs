using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BLL
{
    public class payments
    {
        public int payId { get; set; }
        public DateTime date { get; set; }
        public double total { get; set; }
        public string aprovalNum { get; set; }
        public int Oid { get; set; }
    }
}