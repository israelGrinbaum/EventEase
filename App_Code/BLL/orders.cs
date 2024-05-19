using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BLL
{
    public class orders
    {
        public int Oid { get; set; }
        public int Uid { get; set; }
        public DateTime eventDate { get; set; }
        public int somepeople { get; set; }
        public int eventTypeId { get; set; }
        public DateTime createDate { get; set; }
        public int Hid { get; set; }
        public string notes { get; set; }
        public string orderStatus { get; set; }
        public static List<orders> getAllOrders(string query)
        {
            return ordersDAL.getAllOrders(query);
        }
        public static orders getOrderById(int id)
        {
            return ordersDAL.getOrderById(id);
        }
        public static List<orders> getOrdersByUserId(int userId)
        {
            return ordersDAL.getOrdersByUserId(userId);
        }
        public void addUpdateOrder()
        {
            ordersDAL.addUpdateOrder(this);
            this.setOrderStatus();
        }
        public static void removeOrderById(int id)
        {
            ordersDAL.removeOrderById(id);
        }
        public void setOrderStatus()
        {
            if (this.orderStatus == "מאושר")
            {
                return;
            }
            string orderStatus = "";
            List<orderDetailPermitted> OrderDetailsPermitted=orderDetailPermitted.GetOrderDetailPermittedsByEventTypeId(this.eventTypeId);
            List<orderDetails> OrderDetails=orderDetails.getOrderDetailsByOid(this.Oid);
            foreach(var OrderDetailPermitted in OrderDetailsPermitted)
            {
                if (OrderDetailPermitted.optional == true)
                {
                    break;
                }
                List<orderDetails> SelectedOrderDetails = OrderDetails.FindAll(x=> x.ODCatId==OrderDetailPermitted.orderDetailId);
                if (SelectedOrderDetails.Count < OrderDetailPermitted.choiceQuantity)
                {
                    orderStatus = "בתהליך מילוי הזמנה";
                    break;
                }
            }
            if (orderStatus == "")
            {
                orderStatus = "ממתין לאישור";
            }
            this.orderStatus = orderStatus;
            ordersDAL.addUpdateOrder(this);
        }
        public void approveOrderStatus()
        {
            if (this.orderStatus == "מאושר")
            {
                return;
            }
            string orderStatus = "";
            List<orderDetailPermitted> OrderDetailsPermitted=orderDetailPermitted.GetOrderDetailPermittedsByEventTypeId(this.eventTypeId);
            List<orderDetails> OrderDetails=orderDetails.getOrderDetailsByOid(this.Oid);
            foreach(var OrderDetailPermitted in OrderDetailsPermitted)
            {
                if (OrderDetailPermitted.optional == true)
                {
                    break;
                }
                List<orderDetails> SelectedOrderDetails = OrderDetails.FindAll(x=> x.ODCatId==OrderDetailPermitted.orderDetailId);
                if (SelectedOrderDetails.Count < OrderDetailPermitted.choiceQuantity)
                {
                    orderStatus = "בתהליך מילוי הזמנה";
                    break;
                }
            }
            if (orderStatus == "")
            {
                orderStatus = "מאושר";
            }
            this.orderStatus = orderStatus;
            ordersDAL.addUpdateOrder(this);
        }
    }
}