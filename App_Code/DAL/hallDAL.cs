using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace DAL
{
    public class hallDAL
    {
        public static List<hall> getAllHalls(string query)
        {
            string sql = "select * from T_Halls";
            if (query != "")
            {
                sql += $" where catName like '%{query}%'";
            }
            dbContext db = new dbContext();
            List<hall> listHalls = new List<hall>();
            DataTable dt = db.execute(sql);
            db.close();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                listHalls.Add(new hall()
                {
                    Hid = (int)dt.Rows[i]["Hid"],
                    Hname = dt.Rows[i]["Hname"] + "",
                    containing = (int)dt.Rows[i]["containing"],
                    pics = dt.Rows[i]["pics"] + "",
                    location = dt.Rows[i]["location"] + "",
                    price = double.Parse(dt.Rows[i]["price"]+"")
                });
            }
            return listHalls;
        }
        public static hall getHallById(int id)
        {
            string sql = $"select * from T_Halls where Hid={id}";
            dbContext db = new dbContext();
            DataTable dt = db.execute(sql);
            db.close();
            if (dt.Rows.Count > 0)
            {
                hall Hall = new hall()
                {
                    Hid = (int)dt.Rows[0]["Hid"],
                    Hname = dt.Rows[0]["Hname"] + "",
                    containing = (int)dt.Rows[0]["containing"],
                    pics = dt.Rows[0]["pics"]+"",
                    location = dt.Rows[0]["location"] + "",
                    price = double.Parse(dt.Rows[0]["price"] + ""),
                };
                return Hall;
            }
            else
            {
                return null;
            }
        }
        public static void addUpdateHall(hall hall)
        {
            string sql = "";
            if (hall.Hid == -1)
            {
                sql = $"insert into T_Halls (Hname,containing,pics,location,price) values (N'{hall.Hname}',{hall.containing}, N'{hall.pics}',N'{hall.location}',{hall.price});";
            }
            else
            {
                sql = $"update T_Halls set Hname=N'{hall.Hname}', containing={hall.containing},pics=N'{hall.pics}', location=N'{hall.location}',price={hall.price} where Hid={hall.Hid};";
            }
            dbContext db = new dbContext();
            int ret = db.executeNonQuery(sql);
            if (hall.Hid == -1)
            {
                sql = "select top 1 Hid from T_Halls order by Hid desc";
                hall.Hid = (int)db.executeScalar(sql);
            }
            db.close();

        }
        public static void removeHallById(int id)
        {
            string sql = $"delete from T_Halls where Hid={id}";
            dbContext db = new dbContext();
            db.executeNonQuery(sql);
            db.close();
        }
        public static void updatePicById(int id,string newPic)
        {
            string sql = $"update T_Halls set pics=N'{newPic}' where Hid={id};";
            dbContext db = new dbContext();
            db.executeNonQuery(sql);
            db.close();
        }

    }
}