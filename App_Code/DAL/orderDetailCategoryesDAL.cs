using BLL;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace DAL
{
    public class orderDetailCategoryesDAL
    {
        public static List<orderDetailCategoryes> getAllCategoryes()
        {
            string sql = "select * from T_OrderDetailCategoryes";
            dbContext db = new dbContext();
            List<orderDetailCategoryes> listODC = new List<orderDetailCategoryes>();
            DataTable dt = db.execute(sql);
            db.close();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                listODC.Add(new orderDetailCategoryes()
                {
                    Cid = (int)dt.Rows[i]["Cid"],
                    catName = "" + dt.Rows[i]["catName"],
                    parentCatId = (int)dt.Rows[i]["parentCat"],
                });
            }
            return listODC;

        }
        public static orderDetailCategoryes getCategoryById(int id)
        {
            string sql = $"select * from T_OrderDetailCategoryes where Cid={id}";
            dbContext db = new dbContext();
            DataTable dt = db.execute(sql);
            db.close();
            if (dt.Rows.Count > 0)
            {
                orderDetailCategoryes ODC = new orderDetailCategoryes()
                {
                    Cid = (int)dt.Rows[0]["Cid"],
                    catName = "" + dt.Rows[0]["catName"],
                    parentCatId = (int)dt.Rows[0]["parentCat"]
                };
                return ODC;
            }
            else
            {
                return null;
            }

        }
        public static void addUpdateCategory(orderDetailCategoryes ODC)
        {
            string sql = "";
            if (ODC.Cid == -1)
            {
                sql = $"insert into T_OrderDetailCategoryes (catName,parentCat) values (N'{ODC.catName}',{ODC.parentCatId});";
            }
            else
            {
                sql = $"update T_OrderDetailCategoryes set catName=N'{ODC.catName}',parentCat={ODC.parentCatId} where cid={ODC.Cid}";
            }
            dbContext db = new dbContext();
            int ret = db.executeNonQuery(sql);
            if (ODC.Cid == -1)
            {
                sql = "select top 1 Cid from T_OrderDetailCategoryes order by Cid desc";
                ODC.Cid = (int)db.executeScalar(sql);
            }
            db.close();

        }
        public static void removeCategoryById(int id)
        {
            string sql = $"delete from T_OrderDetailCategoryes where Cid={id}";
            dbContext db = new dbContext();
            db.executeNonQuery(sql);
            db.close();

        }

    }
}