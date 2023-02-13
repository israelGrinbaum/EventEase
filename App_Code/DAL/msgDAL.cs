using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DAL
{
    public class msgDAL
    {
        public static string getMsgById(string Mid)
        {
            string sql = $"select top 1 MsgText from T_SysMessages where Mid={Mid}";
            dbContext db = new dbContext();
            string msg = (string)db.executeScalar(sql);
            db.close();

            return msg;
        }

    }
}