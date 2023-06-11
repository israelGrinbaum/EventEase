using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace DAL
{
    public class portionCategoryesDAL
    {
        public static List<portionCategoryes> getAllCategoryes(string query)
        {
            string sql = "select * from T_PortionCategoryes";
            if (query != "")
            {
                sql += $" where catName like '%{query}%'";
            }
            dbContext db = new dbContext();
            List<portionCategoryes> listPC = new List<portionCategoryes>();
            DataTable dt = db.execute(sql);
            db.close();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                listPC.Add(new portionCategoryes()
                {
                    Cid = (int)dt.Rows[i]["Cid"],
                    catName = "" + dt.Rows[i]["catName"],
                    parentCatId = (int)dt.Rows[i]["parentCat"],
                });
            }
            return listPC;
        }
        public static portionCategoryes getCategoryById(int id)
        {
            string sql = $"select * from T_PortionCategoryes where Cid={id}";
            dbContext db = new dbContext();
            DataTable dt = db.execute(sql);
            db.close();
            if(dt.Rows.Count > 0)
            {
                portionCategoryes PC = new portionCategoryes()
                {
                    Cid = (int)dt.Rows[0]["Cid"],
                    catName = "" + dt.Rows[0]["catName"],
                    parentCatId = (int)dt.Rows[0]["parentCat"]
                };
                return PC;
            }
            else
            {
                return null;
            }
        }
        public static void addUpdateCategory(portionCategoryes PC)
        {
            string sql = "";
            if (PC.Cid == -1)
            {
                sql = $"insert into T_PortionCategoryes (catName,parentCat) values (N'{PC.catName}',{PC.parentCatId});";
            }
            else
            {
                sql = $"update T_PortionCategoryes set catName=N'{PC.catName}',parentCat={PC.parentCatId} where cid={PC.Cid}";
            }
            dbContext db=new dbContext();
            int ret= db.executeNonQuery(sql);
            if(PC.Cid == -1)
            {
                sql = "select top 1 Cid from T_PortionCategoryes order by Cid desc";
                PC.Cid = (int)db.executeScalar(sql);
            }
            db.close();
        }
        public static void removeCategoryById(int id)
        {
            string sql = $"delete from T_PortionCategoryes where Cid={id}";
            dbContext db=new dbContext();
            db.executeNonQuery(sql);
            db.close();
        }

    }
}