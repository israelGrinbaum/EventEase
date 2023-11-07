using BLL;
using Newtonsoft.Json;
using Syncfusion.XlsIO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace eventsHall.userWebsite
{
    public partial class orderDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string Oid = Request.Params["Oid"] + "";
            if (Oid == "")
            {
                Response.Redirect("messages.aspx?Mid=2303");
            }
            else
            {
                HiddenOid.Value = Oid;
            }
            if (!IsPostBack)
            {
                fillData();
            }

        }
        public void fillData()
        {
            string ETid = item.getAnyData("T_Orders", "eventTypeId", "Oid", HiddenOid.Value + "");
            List<orderDetailPermitted> orderDetailPermitteds = orderDetailPermitted.GetOrderDetailPermittedsByEventTypeId(int.Parse(ETid));
            List<portionCategoryes> listODP = new List<portionCategoryes>();
            List<portionCategoryes> listODC = ((List<portionCategoryes>)Application["lstPC"]);
            foreach (var ODP in orderDetailPermitteds)
            {
                portionCategoryes ODC = new portionCategoryes();
                ODC = listODC.Find(x => x.Cid == ODP.orderDetailId);
                listODP.Add(ODC);
            }

            rptPortions.DataSource = listODP;
            rptPortions.DataBind();

        }

        protected void RPTproducts_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                HtmlAnchor updateOrderDetail = (HtmlAnchor)e.Item.FindControl("updateOrder");
                updateOrderDetail.HRef += "?Oid=" + HiddenOid.Value + "&&Cid=" + ((portionCategoryes)e.Item.DataItem).Cid;
                string PCName = ((portionCategoryes)e.Item.DataItem).catName;
                var orderDetsils = orderDetails.getOrderDetailsByOid(int.Parse(HiddenOid.Value));
                var Portions = portions.getAllportions("");
                List<portions> data = new List<portions>();
                foreach (var orderDetail in orderDetsils)
                {
                    var portion = Portions.Find(x => x.Pid == orderDetail.Pid);
                    if (portion.portionCatId.Contains("@" + ((portionCategoryes)e.Item.DataItem).Cid + "@"))
                    {
                        data.Add(portion);
                    }
                }
                ((Repeater)e.Item.FindControl("RPTproducts")).DataSource = data;
                ((Repeater)e.Item.FindControl("RPTproducts")).DataBind();
                if (data.Count == 0)
                {
                    ((Literal)e.Item.FindControl("noPortions")).Text = $"<div style=\"font-weight:normal;\">לא נמצאו פריטים מתאימים, אנא הוסף <div style=\"font-weight:bold;display:inline-block;\">{((portionCategoryes)e.Item.DataItem).catName}</div> להזמנה</div>";
                }
            }

        }
    }
}