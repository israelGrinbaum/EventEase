using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace DAL
{
    public class UserDAL
    {
        public static void register(User user)
        {
            string sql = $"insert into T_Users (Uname,email,pass,phone) values(N'{user.Uname}','{user.email}','{user.pass}','{user.phone}');";
            dbContext db = new dbContext();
            DataTable dt = new DataTable();
            db.executeNonQuery(sql);
            sql = $"select Uid from T_Users where email='{user.email}'";
            user.Uid = (int)db.executeScalar(sql);
            db.close();

        }
        public static bool checkLogin(User user)
        {
            string sql = $"select * from T_Users where email='{user.email}' and pass='{user.pass}'";
            dbContext db = new dbContext();
            DataTable dt=db.execute(sql);
            db.close();
            if (dt.Rows.Count == 1)
            {
                user.Uid = (int)dt.Rows[0]["Uid"];
                user.Uname = dt.Rows[0]["Uname"] + "";
                user.phone = dt.Rows[0]["phone"] + "";
                user.permissions = dt.Rows[0]["permissions"] + "";
                return true;
            }
            else
            {
                return false;
            }
        }

        public static bool isExist(string email)
        {
            string sql = $"select * from T_Users where email='{email}'";
            dbContext db = new dbContext();
            DataTable dt = db.execute(sql);
            db.close();
            if (dt.Rows.Count == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public static bool updatePass(string pass, string token)
        {
            string sql = $"update T_Users set pass='{pass}', resetToken='' where resetToken='{token}';";
            dbContext db = new dbContext();
            db.executeNonQuery(sql);
            db.close();
            return true;
        }


    }
}