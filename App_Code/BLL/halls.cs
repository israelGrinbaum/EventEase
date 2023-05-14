using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BLL
{
    public class hall
    {
        public int Hid { get; set; }
        public string Hname { get; set; }
        public int containing { get; set; }
        public string pics { get; set; }
        public string location { get; set; }
        public double price { get; set; }
        public static List<hall> getAllHalls(string query)
        {
            return hallDAL.getAllHalls(query);
        }
        public static hall getHallById(int id)
        {
            return hallDAL.getHallById(id);
        }
        public void addUpdateHall()
        {
            hallDAL.addUpdateHall(this);
        }
        public static void removeHallById(int id)
        {
            hallDAL.removeHallById(id);
        }
        public static void updatePicById(int id, string newPic)
        {
            hallDAL.updatePicById(id, newPic);
        }
    }
}