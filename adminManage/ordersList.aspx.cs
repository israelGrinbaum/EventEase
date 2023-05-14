using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eventsHall.adminManage
{
    public partial class ordersList : System.Web.UI.Page
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
            RPTOrders.DataSource = orders.getAllOrders("");
            RPTOrders.DataBind();
        }

        protected void RPTOrders_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                int Uid = ((orders)e.Item.DataItem).Uid;
                ((Literal)e.Item.FindControl("Uid")).Text = item.getAnyData("T_Users", "Uname", "Uid", "" + Uid);
                int eventTypeId = ((orders)e.Item.DataItem).eventTypeId;
                ((Literal)e.Item.FindControl("eventTypeId")).Text = item.getAnyData("T_EventType", "ETname", "ETid", "" + eventTypeId);
                int Hid = ((orders)e.Item.DataItem).Hid;
                ((Literal)e.Item.FindControl("Hid")).Text = item.getAnyData("T_Halls", "Hname", "Hid", "" + Hid);
            }

        }
    }
}