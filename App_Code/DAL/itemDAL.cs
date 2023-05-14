using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace DAL
{
    public class itemDAL
    {
        public static List<item> getAll(string tablaNmae, string keyName, string valueName)
        {
            string sql = $"select {keyName},{valueName} from {tablaNmae};";
            dbContext db = new dbContext();
            List<item> lstItem = new List<item>();
            DataTable dt = db.execute(sql);
            db.close();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                lstItem.Add(new item()
                {
                    key = (int)dt.Rows[i][keyName],
                    value = dt.Rows[i][valueName] + "",
                });
            }
            return lstItem;
        }
        public static string getAnyData(string tablaNmae, string select, string where, string whereValue)
        {
            string sql = $"select top 1 {select} from {tablaNmae} where {where}={whereValue};";
            dbContext db = new dbContext();
            string ret = (string)db.executeScalar(sql);
            db.close();
            return ret;

        }

    }
}