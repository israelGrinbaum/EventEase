using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BLL
{
    public class msg
    {
        public static string getMsgById(string Mid)
        {
            return msgDAL.getMsgById(Mid);
        }
    }
}