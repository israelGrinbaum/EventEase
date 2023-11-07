using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace eventsHall.templates
{
    public partial class printOrderTemplet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string oid = Request.Params["Oid"]+"";
            if (oid == "")
            {
                Response.Redirect("messages.aspx?Mid=2303");
            }
            else
            {
                hiddenOid.Value = oid;
            }
            if (!IsPostBack)
            {
                fillData();
            }
        }
        public void fillData()
        {
            orders order = orders.getOrderById(int.Parse(hiddenOid.Value));
            User user = new User()
            {
                Uid=order.Uid,
            };
            user.getUserById();
            ltlUname.Text = user.Uname;
            ltlPhone.Text = user.phone;
            ltlEventDate.Text = order.eventDate + "";
            ltlEventAddres.Text = item.getAnyData("T_Halls", "location", "Hid", order.Hid + "");
            ltlEventType.Text = item.getAnyData("T_EventType", "ETname", "ETid", order.eventTypeId + "");
            eventType et = BLL.eventType.getEventTypeById(order.eventTypeId);
            List<orderDetailPermitted> ODPlst = new List<orderDetailPermitted>();
            ODPlst = orderDetailPermitted.GetOrderDetailPermittedsByEventTypeId(order.eventTypeId);

            List<portionCategoryes> PClist = portionCategoryes.getAllCategoryes("");
            PClist = PClist.Where(x => (ODPlst.Find(y => y.orderDetailId == x.Cid)) != null).ToList<portionCategoryes>();
            PClist = PClist.OrderBy(x => ODPlst.FindIndex(o => o.orderDetailId == x.Cid)).ToList<portionCategoryes>();
            RPTPortionCatID.DataSource = PClist;
            RPTPortionCatID.DataBind();
        }

        protected void RPTPortionCatID_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Repeater RPTOrderDetails = (Repeater)e.Item.FindControl("RPTOrderDetails");
            portionCategoryes PC = (portionCategoryes)e.Item.DataItem;
            List<BLL.orderDetails> OrderDetails = BLL.orderDetails.getOrderDetailsByOid(int.Parse(hiddenOid.Value));
            List<BLL.orderDetails> OrderDetailsToRPT = new List<BLL.orderDetails>();
            foreach (var OD in OrderDetails)
            {
                if (OD.ODCatId == PC.Cid)
                {
                    OrderDetailsToRPT.Add(OD);
                }
            }
            RPTOrderDetails.DataSource = OrderDetailsToRPT;
            RPTOrderDetails.DataBind();

        }

        protected void RPTOrderDetails_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                int Pid = ((BLL.orderDetails)e.Item.DataItem).Pid;
                ((Literal)e.Item.FindControl("ltlPid")).Text = item.getAnyData("T_Portions", "Pname", "Pid", "" + Pid);
            }

        }
    }
}