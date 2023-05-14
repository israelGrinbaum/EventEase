using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DAL;

namespace BLL
{
    public class item
    {
        public int key { get; set; }
        public string value { get; set; }
        public static List<item> getAll(string tablaNmae, string keyName, string valueName)
        {
            return itemDAL.getAll(tablaNmae, keyName, valueName);
        }
        public static string getAnyData(string tablaNmae, string select, string where, string whereValue)
        {
            return itemDAL.getAnyData(tablaNmae, select, where, whereValue);
        }
    }
}