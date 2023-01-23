using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BLL
{
    public class orders
    {
        public int Oid { get; set; }
        public int Uid { get; set; }
        public DateTime eventDate { get; set; }
        public int somepeople { get; set; }
        public int eventTypeId { get; set; }
        public DateTime createDate { get; set; }
        public int Hid { get; set; }
        public string notes { get; set; }
    }
}