using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BLL
{
    public class message
    {
        public int Mid { get; set; }
        public string subgect { get; set; }
        public string body { get; set; }
        public DateTime sendDate { get; set; }
        public int UidSender { get; set; }
        public int UidRecipient { get; set; }
    }
}