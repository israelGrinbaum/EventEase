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
                int Oid = ((orders)e.Item.DataItem).Oid;
                int Uid = ((orders)e.Item.DataItem).Uid;
                ((Literal)e.Item.FindControl("Uid")).Text = item.getAnyData("T_Users", "Uname", "Uid", "" + Uid);
                int eventTypeId = ((orders)e.Item.DataItem).eventTypeId;
                if (eventTypeId == 0)
                {

                }
                ((Literal)e.Item.FindControl("eventTypeId")).Text = item.getAnyData("T_EventType", "ETname", "ETid", "" + eventTypeId);
                float pricePerPortion = float.Parse(item.getAnyData("T_EventType", "pricePerPortion", "ETid", "" + eventTypeId));
                int somePeople= ((orders)e.Item.DataItem).somepeople;
                List<BLL.orderDetails> OrderDetails = BLL.orderDetails.getOrderDetailsByOid(Oid);
                List<portions> Portions = (List<portions>)Application["lstPortions"];
                double sumPrice = pricePerPortion * somePeople;
                foreach(var OrderDetail in OrderDetails)
                {
                    var portion = Portions.Find(x => x.Pid == OrderDetail.Pid);
                    if(portion != null)
                    {
                        sumPrice += (portion.price) * somePeople;
                    }
                }
                ((Literal)e.Item.FindControl("ltlCalculatedPrice")).Text = ""+(sumPrice);
                int Hid = ((orders)e.Item.DataItem).Hid;
                ((Literal)e.Item.FindControl("Hid")).Text = item.getAnyData("T_Halls", "Hname", "Hid", "" + Hid);
            }

        }
    }
}