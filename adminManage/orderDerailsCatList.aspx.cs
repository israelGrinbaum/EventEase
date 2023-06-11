using BLL;
using eventsHall.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eventsHall.adminManage
{
    public partial class orderDerailsCatList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string format = Request["format"];
            if (format == "excel")
            {
                toExcel();
                Response.Redirect("portionCatList.aspx");
            }
            if (!IsPostBack)
            {
                fillData();
            }
        }
        public void fillData()
        {
            RPTCats.DataSource = orderDetailCategoryes.getAllCategoryes();
            RPTCats.DataBind();
        }

        protected void toExcel()
        {
            List<orderDetailCategoryes> lstPC = orderDetailCategoryes.getAllCategoryes();
            assets.DisplayInExcel(lstPC);
        }

        protected void RPTCats_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                int parentId = ((orderDetailCategoryes)e.Item.DataItem).parentCatId;
                string parentName = item.getAnyData("T_OrderDetailCategoryes", "catName", "Cid", parentId + "");
                ((Literal)e.Item.FindControl("ltlParentCatName")).Text += parentName;
            }

        }
    }
}