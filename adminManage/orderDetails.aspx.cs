using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
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
                var uid = item.getAll("T_Users", "Uid", "Uname");
                DDLUid.DataSource = uid;
                DDLUid.DataTextField = "value";
                DDLUid.DataValueField = "key";
                DDLUid.DataBind();
                var eventType = item.getAll("T_EventType", "ETid", "ETname");
                DDLEventType.DataSource = eventType;
                DDLEventType.DataTextField = "value";
                DDLEventType.DataValueField = "key";
                DDLEventType.DataBind();
                var halls = item.getAll("T_Halls", "Hid", "Hname");
                DDLHid.DataSource = halls;
                DDLHid.DataTextField = "value";
                DDLHid.DataValueField = "key";
                DDLHid.DataBind();

                if (DDLUid.Items.FindByValue(order.Uid + "") != null)
                {
                    DDLUid.Items.FindByValue(order.Uid + "").Selected = true;
                }
                txtEventDate.Text = order.eventDate + "";
                txtSomePeople.Text = order.somepeople + "";
                if (DDLHid.Items.FindByValue(order.Hid + "") != null)
                {
                    DDLHid.Items.FindByValue(order.Hid + "").Selected = true;
                }
                if (DDLEventType.Items.FindByValue(order.eventTypeId + "") != null)
                {
                    DDLEventType.Items.FindByValue(order.eventTypeId + "").Selected = true;
                }

                txtNotes.Text = order.notes;
                eventType et = BLL.eventType.getEventTypeById(order.eventTypeId);
                List<orderDetailPermitted> ODPlst = new List<orderDetailPermitted>();
                ODPlst = orderDetailPermitted.GetOrderDetailPermittedsByEventTypeId(order.eventTypeId);

                List<portionCategoryes> PClist = portionCategoryes.getAllCategoryes("");
                PClist = PClist.Where(x => (ODPlst.Find(y => y.orderDetailId == x.Cid))!=null).ToList<portionCategoryes>();
                //if (et.OrderDetailsPermitted.Length >= 1 && et.OrderDetailsPermitted != null)
                //{
                //    et.OrderDetailsPermitted=et.OrderDetailsPermitted.Replace("@@", "@");
                //    string[] PCatPermitted = et.OrderDetailsPermitted.Substring(1, et.OrderDetailsPermitted.Length - 2).Split('@');
                //    foreach(var PCP in PCatPermitted)
                //    {
                //        PCP.Replace("@", "");
                //        portionCategoryes PC = portionCategoryes.getCategoryById(int.Parse(PCP));
                //        PClist.Add(PC);
                //    }
                //}
                RPTPortionCatID.DataSource = PClist; 
                RPTPortionCatID.DataBind();
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
                ((Literal)e.Item.FindControl("ltlPortionCatId")).Text = item.getAnyData("T_PortionCategoryes", "catName", "Cid", "" + ODCatId);
            }

        }

        protected void RPTPortionCatID_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            Repeater RPTOrderDetails = (Repeater)e.Item.FindControl("RPTOrderDetails");
            portionCategoryes PC = (portionCategoryes)e.Item.DataItem;
            List<BLL.orderDetails> OrderDetails = BLL.orderDetails.getOrderDetailsByOid(int.Parse(ltlOid.Text));
            List<BLL.orderDetails> OrderDetailsToRPT = new List<BLL.orderDetails>();
            foreach(var OD in OrderDetails)
            {
                if (OD.ODCatId == PC.Cid)
                {
                    OrderDetailsToRPT.Add(OD);
                }
            }
            RPTOrderDetails.DataSource = OrderDetailsToRPT;
            if(OrderDetailsToRPT.Count == 0)
            {
                var catTd=(HtmlTableCell)e.Item.FindControl("CatTd");
                catTd.InnerHtml += $"<div style=\"font-weight:normal;\">לא נמצאו פריטים מתאימים, אנא הוסף <div style=\"font-weight:bold;display:inline-block;\">{PC.catName}</div> להזמנה</div>";
            }
            RPTOrderDetails.DataBind();
        }
    }
}