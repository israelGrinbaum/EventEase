using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace DAL
{
    public class eventTypeDAL
    {
        public static List<eventType> getAllEventTypes(string query)
        {
            string sql = "select * from T_EventType";
            if (query != "")
            {
                sql += $" where catName like '%{query}%'";
            }
            dbContext db = new dbContext();
            List<eventType> listEventTypes = new List<eventType>();
            DataTable dt = db.execute(sql);
            db.close();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                listEventTypes.Add(new eventType()
                {
                    ETid = (int)dt.Rows[i]["ETid"],
                    ETname = dt.Rows[i]["ETname"]+"",
                    PricePerPortion = float.Parse(dt.Rows[i]["pricePerPortion"] + ""),
                    OrderDetailsPermitted= dt.Rows[i]["OrderDetailsPermitted"] + "",
                    orderDetailPermitteds=orderDetailPermittedDAL.GetOrderDetailPermittedsByEventTypeId((int)dt.Rows[i]["ETid"])
                });
            }
            return listEventTypes;
        }
        public static eventType getEventTypeById(int id)
        {
            string sql = $"select * from T_EventType where ETid={id}";
            dbContext db = new dbContext();
            DataTable dt = db.execute(sql);
            db.close();
            if (dt.Rows.Count > 0)
            {
                eventType eventType = new eventType()
                {
                    ETname = dt.Rows[0]["ETname"]+"",
                    PricePerPortion = float.Parse(dt.Rows[0]["pricePerPortion"]+""),
                    OrderDetailsPermitted = dt.Rows[0]["OrderDetailsPermitted"] + "",
                    orderDetailPermitteds = orderDetailPermittedDAL.GetOrderDetailPermittedsByEventTypeId((int)dt.Rows[0]["ETid"])
                };
                return eventType;
            }
            else
            {
                return null;
            }
        }
        public static void addUpdateEventType(eventType eventType)
        {
            string sql = "";
            if (eventType.ETid == -1)
            {
                sql = $"insert into T_EventType (ETname,OrderDetailsPermitted,pricePerPortion) values (N'{eventType.ETname}',N'{eventType.OrderDetailsPermitted}',{eventType.PricePerPortion});";
            }
            else
            {
                sql = $"update T_EventType set ETname=N'{eventType.ETname}',OrderDetailsPermitted=N'{eventType.OrderDetailsPermitted}',pricePerPortion={eventType.PricePerPortion} where ETid={eventType.ETid};" ;
            }
            dbContext db = new dbContext();
            int ret = db.executeNonQuery(sql);
            if (eventType.ETid == -1)
            {
                sql = "select top 1 ETid from T_EventType order by ETid desc";
                eventType.ETid = (int)db.executeScalar(sql);
            }
            db.close();
        }
        public static void removeEventTypeById(int id)
        {
            string sql = $"delete from T_EventType where ETid={id}";
            dbContext db = new dbContext();
            db.executeNonQuery(sql);
            db.close();
        }

    }
}