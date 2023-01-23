using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BLL
{
    public class User
    {
        public int Uid { get; set; }
        public string Uname { get; set; }
        public string email { get; set; }
        public string phone { get; set; }
        public string pass { get; set; }
        public string permissions { get; set; }
        public void register()
        {
            UserDAL.register(this);
        }
        public bool checkLogin()
        {
            return UserDAL.checkLogin(this);
        }
        //הפונקציה מקבלת אימייל ומחזירה אמת במידה והוא קיים אחרת תחזיר שקר
        public static bool isExist(string email)
        {
            return UserDAL.isExist(email);
        }
    }
}