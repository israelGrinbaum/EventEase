﻿using DAL;
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
        public DateTime insertDate { get; set; }
        public void register()
        {
            UserDAL.register(this);
        }
        public void updateUser()
        {
            UserDAL.updateUser(this);
        }
        public bool checkLogin()
        {
            return UserDAL.checkLogin(this);
        }
        public bool getUserById()
        {
            return UserDAL.getUserById(this);
        }
        //הפונקציה מקבלת אימייל ומחזירה אמת במידה והוא קיים אחרת תחזיר שקר
        public static bool isExist(string email)
        {
            return UserDAL.isExist(email);
        }
        public static bool isValidToken(string token)
        {
            return UserDAL.isValidToken(token);
        }
        public static List<User> getAllUsers() 
        {
            return UserDAL.getAllUaers();
        }
        public static bool SetResetToken(string email, string token)
        {
            return UserDAL.SetResetToken(email,token);
        }
        public static bool updatePass(string pass, string token)
        {
            return UserDAL.updatePass(pass,token);
        }

    }
}