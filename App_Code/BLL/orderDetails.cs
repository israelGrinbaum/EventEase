using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BLL
{
    public class orderDetails
    {
        public int ODid { get; set; }
        public int Oid { get; set; }
        public int Pid { get; set; }
        public int amount { get; set; }
        public double price { get; set; }
        public int portionCatId { get; set; }

    }
}