using BLL;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace DAL
{
    public class orderDetailsDAL
    {
        public static List<orderDetails> getOrderDetailsByOid(int Oid)
        {
            string sql = $"select * from T_OrderDetails where Oid={Oid}";
            dbContext db = new dbContext();
            List<orderDetails> listOrderDetails = new List<orderDetails>();
            DataTable dt = db.execute(sql);
            db.close();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                listOrderDetails.Add(new orderDetails()
                {
                    ODid = (int)dt.Rows[i]["ODid"],
                    Oid = (int)dt.Rows[i]["Oid"],
                    Pid = (int)dt.Rows[i]["Pid"],
                    amount = (int)dt.Rows[i]["amount"],
                    price = double.Parse(dt.Rows[i]["price"]+""),
                    ODCatId = (int)dt.Rows[i]["ODCatId"],
                });
            }
            return listOrderDetails;
        }
        public static orderDetails getOrderDetailsByODid(int ODid)
        {
            string sql = $"select * from T_OrderDetails where ODid={ODid}";
            dbContext db = new dbContext();
            DataTable dt = db.execute(sql);
            db.close();
            if (dt.Rows.Count > 0)
            {
                BLL.orderDetails OD = new orderDetails()
                {
                    Pid = (int)dt.Rows[0]["Pid"],
                    Oid = (int)dt.Rows[0]["Oid"],
                    amount = (int)dt.Rows[0]["amount"],
                    price = double.Parse(dt.Rows[0]["price"] + ""),
                    ODCatId = (int)dt.Rows[0]["ODCatId"],
                };
                return OD;
            }
            else
            {
                return null;
            }
        }
        public static void addUpdateOrderDetail(orderDetails OD)
        {
            string sql = "";
            if (OD.ODid == -1)
            {
                sql = $"insert into T_OrderDetails (Oid,Pid,amount,price,ODCatId) values ({OD.Oid},{OD.Pid},{OD.amount},{OD.price},{OD.ODCatId});";
            }
            else
            {
                sql = $"update T_OrderDetails set Oid={OD.Oid}, Pid={OD.Pid}, amount={OD.amount}, price={OD.price}, ODCatId={OD.ODCatId} where ODid={OD.ODid};";
            }
            dbContext db = new dbContext();
            int ret = db.executeNonQuery(sql);
            if (OD.ODid == -1)
            {
                sql = "select top 1 ODid from T_OrderDetails order by ODid desc";
                OD.ODid = (int)db.executeScalar(sql);
            }
            db.close();

        }
        public static void removeOrderDetailById(int ODid)
        {

        }

    }
}