using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BLL
{
    public class portions
    {
        public int Pid { get; set; }
        public string Pname { get; set; }
        public string Pdesc { get; set; }
        public double price { get; set; }
        public string picName { get; set; }
        public string portionCatId { get; set; }
        public static List<portions> getAllportions(string query)
        {
            return portionsDAL.getAllportions(query);
        }
        public static portions getportionById(int id)
        {
            return portionsDAL.getportionById(id);
        }
        public void addUpdateportion()
        {
            portionsDAL.addUpdateportion(this);
        }
        public static void removeportionById(int id)
        {
            portionsDAL.removeportionById(id);
        }

    }
}