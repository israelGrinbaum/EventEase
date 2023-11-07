using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BLL
{
    public class orderDetailPermitted
    {
        public int ODPid{ get; set; }
        public int eventTypeId { get ; set; }
        public int orderDetailId { get; set; }
        public bool optional { get; set; }
        public int choiceQuantity { get; set; }
        public static List<orderDetailPermitted> GetOrderDetailPermittedsByEventTypeId(int ETid)
        {
            return orderDetailPermittedDAL.GetOrderDetailPermittedsByEventTypeId(ETid);
        }
        public void addUpsateOrderDetailPermitteds()
        {
            orderDetailPermittedDAL.addUpsateOrderDetailPermitteds(this);
        }
        public static void removeOrderDetailPermittedsById(int id)
        {
            orderDetailPermittedDAL.removeOrderDetailPermittedsById(id);
        }

    }
}