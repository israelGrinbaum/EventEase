using BLL;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace DAL
{
    public class orderDetailPermittedDAL
    {
        public static List<orderDetailPermitted> GetOrderDetailPermittedsByEventTypeId(int ETid)
        {
            string sql = "select * from T_OrderDetailsPermitted where eventTypeId="+ETid;
            //if (query != "")
            //{
            //    sql += $" where catName like '%{query}%'";
            //}
            dbContext db = new dbContext();
            List<orderDetailPermitted> listODP = new List<orderDetailPermitted>();
            DataTable dt = db.execute(sql);
            db.close();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                listODP.Add(new orderDetailPermitted()
                {
                    ODPid = (int)dt.Rows[i]["ODPid"],
                    eventTypeId = (int)dt.Rows[i]["eventTypeId"],
                    orderDetailId = (int)dt.Rows[i]["orderDetailId"],
                    optional = (bool)dt.Rows[i]["optional"],
                    choiceQuantity = (int)dt.Rows[i]["choiceQuantity"],
                });
            }
            return listODP;
        }
        public static void addUpsateOrderDetailPermitteds(orderDetailPermitted orderDetailPermitted)
        {
            string sql = "";
            if (orderDetailPermitted.ODPid == -1)
            {
                sql = $"insert into T_OrderDetailsPermitted (eventTypeId,orderDetailId,optional,choiceQuantity) values ({orderDetailPermitted.eventTypeId},{orderDetailPermitted.orderDetailId},'{orderDetailPermitted.optional}',{orderDetailPermitted.choiceQuantity});";
            }
            else
            {
                sql = $"update T_OrderDetailsPermitted set eventTypeId={orderDetailPermitted.eventTypeId},orderDetailId={orderDetailPermitted.orderDetailId},optional='{orderDetailPermitted.optional}',choiceQuantity={orderDetailPermitted.choiceQuantity} where ODPid={orderDetailPermitted.ODPid};";
            }
            dbContext db = new dbContext();
            int ret = db.executeNonQuery(sql);
            if (orderDetailPermitted.ODPid == -1)
            {
                sql = "select top 1 ODPid from T_OrderDetailsPermitted order by ODPid desc";
                orderDetailPermitted.ODPid = (int)db.executeScalar(sql);
            }
            db.close();
        }
        public static void removeOrderDetailPermittedsById(int id)
        {
            string sql = $"delete from T_OrderDetailsPermitted where ODPid={id}";
            dbContext db = new dbContext();
            db.executeNonQuery(sql);
            db.close();

        }

    }
}