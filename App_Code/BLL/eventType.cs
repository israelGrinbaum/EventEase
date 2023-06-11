using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BLL
{
    public class eventType
    {
        public int ETid { get; set; }
        public string ETname { get; set; }
        public string OrderDetailsPermitted { get; set; }
        public static List<eventType> getAllEventTypes(string query)
        {
            return eventTypeDAL.getAllEventTypes(query);
        }
        public static eventType getEventTypeById(int id)
        {
            return eventTypeDAL.getEventTypeById(id);
        }
        public void addUpdateEventType()
        {
            eventTypeDAL.addUpdateEventType(this);
        }
        public static void removeEventTypeById(int id)
        {
            eventTypeDAL.removeEventTypeById(id);
        }

    }
}