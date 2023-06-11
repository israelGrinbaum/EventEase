using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eventsHall.adminManage
{
    public partial class eventTypesList : System.Web.UI.Page
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
            RPTEventType.DataSource = eventType.getAllEventTypes("");
            RPTEventType.DataBind();
        }

        protected void RPTEventType_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                string OrederDetailsPermitted = ((eventType)e.Item.DataItem).OrderDetailsPermitted.Replace("@@", "@");
                if (OrederDetailsPermitted.Length >= 1 && OrederDetailsPermitted != null)
                {
                    string[] OrederDetailsPermittedId = OrederDetailsPermitted.Substring(1, OrederDetailsPermitted.Length - 2).Split('@');
                    foreach (string OrederDetailPermittedId in OrederDetailsPermittedId)
                    {
                        OrederDetailPermittedId.Replace("@", "");
                        orderDetailCategoryes ODC = new orderDetailCategoryes()
                        {
                            Cid = int.Parse(OrederDetailPermittedId)
                        };
                        List<orderDetailCategoryes> listODC = ((List<orderDetailCategoryes>)Application["lstODC"]);
                        ODC = listODC.Find(x => x.Cid == int.Parse(OrederDetailPermittedId));

                        //string catName = item.getAnyData("T_PortionCategoryes", "catName", "Cid",c+"");
                        if (ODC != null && ODC.Cid != null)
                        {
                            ((Literal)e.Item.FindControl("ltlOrderDetailsPermitted")).Text += $"<span class=\"fs-6 badge text-bg-secondary\"style=\"margin: 3px;\">{ODC.catName}</span></br><div hidden=\"hidden\">{ODC.catName}, </div>";
                        }
                        //portionCategoryes.getCategoryById(int.Parse(c))
                    }

                }

            }

        }
    }
}