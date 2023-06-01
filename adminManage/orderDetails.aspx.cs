using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eventsHall.adminManage
{
    public partial class orderDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string Oid = Request.Params["Oid"] + "";
            if(Oid=="")
            {
                Response.Redirect("messages.aspx?Mid=2303");
            }
            else
            {
                ltlOid.Text = Oid;
            }
            if(!IsPostBack)
            {
                fillData();
            }
        }
        public void fillData()
        {
            int Oid = int.Parse(ltlOid.Text);
            var order=orders.getOrderById(Oid);
            if(order!=null)
            {
                addOD.HRef = "addUpdateOrderDetail.aspx?Oid=" + Oid;
                ltlUname.Text = item.getAnyData("T_Users", "Uname", "Uid", order.Uid + "");
                ltlEventDate.Text = order.eventDate + "";
                ltlSomePeople.Text = order.somepeople + "";
                ltlEventType.Text = item.getAnyData("T_EventType", "ETname", "ETid", order.eventTypeId + "");
                ltlHall.Text = item.getAnyData("T_Halls", "Hname", "Hid", order.Hid + "");
                ltlNotes.Text = order.notes;
                RPTOrderDetails.DataSource = BLL.orderDetails.getOrderDetailsByOid(Oid);
                RPTOrderDetails.DataBind();
            }
            else
            {
                Response.Redirect("messages.aspx?Mid=2303");
            }
        }

        protected void RPTOrderDetails_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                int Pid = ((BLL.orderDetails)e.Item.DataItem).Pid;
                ((Literal)e.Item.FindControl("ltlPid")).Text = item.getAnyData("T_Portions", "Pname", "Pid", "" + Pid);
                int ODCatId = ((BLL.orderDetails)e.Item.DataItem).ODCatId;
                ((Literal)e.Item.FindControl("ltlPortionCatId")).Text = item.getAnyData("T_OrderDetailCategoryes", "catName", "Cid", "" + ODCatId);
            }

        }
    }
}