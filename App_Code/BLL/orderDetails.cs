using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BLL
{
    public class orderDetails
    {
        public int ODid { get; set; }
        public int Oid { get; set; }
        public int Pid { get; set; }
        public int amount { get; set; }
        public double price { get; set; }
        public int ODCatId { get; set; }
        public static List<orderDetails> getOrderDetailsByOid(int Oid)
        {
            return orderDetailsDAL.getOrderDetailsByOid(Oid);
        }
        public static orderDetails getOrderDetailsByODid(int ODid)
        {
            return orderDetailsDAL.getOrderDetailsByODid(ODid);
        }
        public void addUpdateOrderDetail()
        {
            orderDetailsDAL.addUpdateOrderDetail(this);
        }
        public static void removeOrderDetailById(int ODid)
        {
            orderDetailsDAL.removeOrderDetailById(ODid);
        }


    }
}