using BLL;
using eventsHall.App_Code;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eventsHall.adminManage
{
    public partial class portionCatList : System.Web.UI.Page
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
            RPTCats.DataSource=portionCategoryes.getAllCategoryes("");
            RPTCats.DataBind();
        }

        protected void toExcel()
        {
            List<portionCategoryes> lstPC = portionCategoryes.getAllCategoryes("");
            assets.DisplayInExcel(lstPC);
        }
    }
}