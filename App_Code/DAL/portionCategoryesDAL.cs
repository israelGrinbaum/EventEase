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
        public static List<portionCategoryes> getAllCategoryes()
        {
            string sql = "select * from T_PortionCategoryes";
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
                    parentCatId = (int)dt.Rows[i]["parentCatId"]
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
            portionCategoryes PC = new portionCategoryes()
            {
                Cid = (int)dt.Rows[0]["Cid"],
                catName = "" + dt.Rows[0]["catName"],
                parentCatId = (int)dt.Rows[0]["parentCatId"]
            };
            return PC;
        }
        public static void addUpdateCategory(portionCategoryes PC)
        {
            string sql = "";
            if (PC.Cid == -1)
            {
                sql = $"insert into T_PortionCategoryes (catName,parentCatId) values ('N{PC.catName}',{PC.parentCatId});";
            }
            else
            {
                sql = $"update T_PortionCategoryes set catName='N{PC.catName}',parentCatId={PC.parentCatId} where cid={PC.Cid}";
            }
            dbContext db=new dbContext();
            db.executeNonQuery(sql);
            if(PC.Cid == -1)
            {
                sql = "select top 1 Cid from T_PortionCategoryes order by Cid desc";
                PC.Cid = (int)db.executeScalar(sql);
            }
            db.close();
        }
        public static void removeCategoryById(int id)
        {

        }

    }
}