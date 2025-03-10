using BLL;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eventsHall.adminManage
{
    public partial class CalendarOfEvents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillData();
            }

        }
        public void fillData()
        {

            //title: 'שרוליק גרינבוים - חתונה',
            //    start: new Date('2024', '04', '22', '20', '00'), //'21/05/2024 20:00:00'
            //    end: new Date('2024', '04', '22', '22', '00'),
            //    url: 'http://localhost:46327/adminManage/orderDetails.aspx?Oid=1186',


            List<dynamic> events = new List<dynamic>();
            List<orders> Orders = orders.getAllOrders("");
            
            foreach (orders order  in Orders)
            {
                dynamic Event = new ExpandoObject();
                string userNmae = item.getAnyData("T_Users", "Uname", "Uid", order.Uid + "");
                string eventTypeName = item.getAnyData("T_EventType", "ETname", "ETid", order.eventTypeId + "");
                Event.title = userNmae +" - " + eventTypeName;
                var stert = order.eventDate.ToString("yyyy/MM/dd HH:mm");//DateTime.ParseExact("21/05/2024 15:30", "y/M/d H:m", CultureInfo.InvariantCulture);
                Event.start = $"new Date('{stert}')";
                DateTime eventDateEnd = order.eventDate.AddHours(2);
                var end = eventDateEnd.ToString("yyyy/MM/dd HH:mm");//DateTime.ParseExact(eventDateEnd.ToString(), "G", CultureInfo.InvariantCulture);
                Event.end = $"new Date('{end}')";
                Event.url = "http://localhost:46327/adminManage/orderDetails.aspx?Oid=" + order.Oid;
                Event.overlap = "true";
                events.Add(Event);
            }
            ltlEvents.Text = "<script>var events = ";
            ltlEvents.Text += JsonConvert.SerializeObject(events);
            ltlEvents.Text += "</script>";
            ltlEvents.Text = ltlEvents.Text.Replace("\"title\"", "title");
            ltlEvents.Text = ltlEvents.Text.Replace("\"start\"", "start");
            ltlEvents.Text = ltlEvents.Text.Replace("\"end\"", "end");
            ltlEvents.Text = ltlEvents.Text.Replace("\"url\"", "url");
            ltlEvents.Text = ltlEvents.Text.Replace("\"overlap\"", "overlap");
            ltlEvents.Text = ltlEvents.Text.Replace("\"true\"", "true");
            ltlEvents.Text = ltlEvents.Text.Replace("\"new Date(", "new Date(");
            ltlEvents.Text = ltlEvents.Text.Replace("')\"", "')");

        }
    }
}