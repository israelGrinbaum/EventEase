using BLL;
using Syncfusion.XlsIO;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace DAL
{
    public class ordersDAL
    {
        public static List<orders> getAllOrders(string query)
        {
            string sql = "select * from T_Orders";
            if (query != "")
            {
                sql += $" where catName like '%{query}%'";
            }
            dbContext db = new dbContext();
            List<orders> listOrders = new List<orders>();
            DataTable dt = db.execute(sql);
            db.close();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                listOrders.Add(new orders()
                {
                    Oid = (int)dt.Rows[i]["Oid"],
                    Uid = (int)dt.Rows[i]["Uid"],
                    eventDate = (DateTime)dt.Rows[i]["eventDate"],
                    somepeople = (int)dt.Rows[i]["somePeople"],
                    eventTypeId = (int)dt.Rows[i]["eventTypeId"],
                    createDate = (DateTime)dt.Rows[i]["createDate"],
                    Hid = (int)dt.Rows[i]["Hid"],
                    notes = dt.Rows[i]["notes"] + "",
                });
            }
            return listOrders;
        }
        public static orders getOrderById(int id)
        {
            string sql = $"select * from T_Orders where Oid={id}";
            dbContext db = new dbContext();
            DataTable dt = db.execute(sql);
            db.close();
            if (dt.Rows.Count > 0)
            {
                orders order = new orders()
                {
                    Oid = (int)dt.Rows[0]["Oid"],
                    Uid = (int)dt.Rows[0]["Uid"],
                    eventDate = (DateTime)dt.Rows[0]["eventDate"],
                    somepeople = (int)dt.Rows[0]["somepeople"],
                    eventTypeId = (int)dt.Rows[0]["eventTypeId"],
                    createDate = (DateTime)dt.Rows[0]["createDate"],
                    Hid = (int)dt.Rows[0]["Hid"],
                    notes = dt.Rows[0]["notes"]+"",

                };
                return order;
            }
            else
            {
                return null;
            }
        }
        public static void addUpdateOrder(orders order)
        {
            string sql = "";
            string eventDate = order.eventDate.Year.ToString() + order.eventDate.Month.ToString().PadLeft(2,'0') + order.eventDate.Day.ToString().PadLeft(2, '0') +" " + order.eventDate.Hour.ToString().PadLeft(2, '0') + ":" + order.eventDate.Minute.ToString().PadLeft(2, '0');
            if (order.Oid == -1)
            {
                sql = $"insert into T_Orders (Uid,eventDate,somePeople,eventTypeId,Hid,notes) values ({order.Uid},'{eventDate}',{order.somepeople},{order.eventTypeId},{order.Hid},N'{order.notes}');";
            }
            else
            {
                sql = $"update T_Orders set Uid={order.Uid},eventDate=N'{eventDate}',somePeople={order.somepeople},eventTypeId={order.eventTypeId},Hid={order.Hid},notes=N'{order.notes}' where Oid={order.Oid}";
            }
            dbContext db = new dbContext();
            int ret = db.executeNonQuery(sql);
            if (order.Oid == -1)
            {
                sql = "select top 1 Oid from T_Orders order by Oid desc";
                order.Oid = (int)db.executeScalar(sql);
            }
            db.close();
        }
        public static void removeOrderById(int id)
        {
            string sql = $"delete from T_Orders where Oid={id}";
            dbContext db = new dbContext();
            db.executeNonQuery(sql);
            db.close();
        }

    }
}