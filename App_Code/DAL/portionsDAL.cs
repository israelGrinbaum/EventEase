using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace DAL
{
    public class portionsDAL
    {
        public static List<portions> getAllportions(string query)
        {
            string sql = "select * from T_Portions";
            if (query != "")
            {
                sql += $" where catName like '%{query}%'";
            }
            dbContext db = new dbContext();
            List<portions> listPortions = new List<portions>();
            DataTable dt = db.execute(sql);
            db.close();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                listPortions.Add(new portions()
                {
                    Pid = (int)dt.Rows[i]["Pid"],
                    Pname = dt.Rows[i]["Pname"] + "",
                    Pdesc = dt.Rows[i]["Pdesc"] + "",
                    price = double.Parse(dt.Rows[i]["price"]+""),
                    picName = dt.Rows[i]["picName"] + "",
                    portionCatId = dt.Rows[i]["portionCatId"] + ""
                });
            }
            return listPortions;
        }
        public static portions getportionById(int id)
        {
            return portionsDAL.getportionById(id);
        }
        public static void addUpdateportion(portions portion)
        {
            string sql = "";
            if (portion.Pid == -1)
            {
                sql = $"insert into T_Portions (Pname,Pdesc,price,picName,portionCatId) values (N'{portion.Pname}',N'{portion.Pdesc}',{portion.price},N'{portion.picName}',N'{portion.portionCatId}');";
            }
            else
            {
                sql = $"update T_Portions set Pname=N'{portion.Pname}',Pdesc=N'{portion.Pdesc}',price={portion.price},picName=N'{portion.picName}',portionCatId=N'{portion.portionCatId}' where Pid={portion.Pid}";
            }
            dbContext db = new dbContext();
            int ret = db.executeNonQuery(sql);
            if (portion.Pid == -1)
            {
                sql = "select top 1 Pid from T_Portions order by Pid desc";
                portion.Pid = (int)db.executeScalar(sql);
            }
            db.close();

        }
        public static void removeportionById(int id)
        {
            portionsDAL.removeportionById(id);
        }

    }
}