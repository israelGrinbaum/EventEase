using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eventsHall.adminManage
{
    public partial class addUpdatePortionCat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string cid = Request["Cid"] + "";
            string op = Request["op"] + "";
            if (op == "del")
            {
                portionCategoryes.removeCategoryById(int.Parse(cid));
                Response.Redirect("messages.aspx?Mid=301");
            }
            if (cid == "")
            {
                HiddenCid.Value = "-1";
            }
            else
            {
                HiddenCid.Value = cid;
            }
            if (!IsPostBack)
            {
                FillData();
            }
        }
        public void FillData()
        {
            DDLparentCat.DataSource = portionCategoryes.getAllCategoryes("");
            DDLparentCat.DataTextField = "catName";
            DDLparentCat.DataValueField = "Cid";
            DDLparentCat.DataBind();
            DDLparentCat.Items.Insert(0, new ListItem("קטגוריה ראשית", "0"));
            if(HiddenCid.Value != "-1")
            {
                portionCategoryes portionCategoryes = new portionCategoryes()
                {
                    Cid = int.Parse(HiddenCid.Value)
                };
                portionCategoryes = portionCategoryes.getCategoryById(portionCategoryes.Cid);
                if (portionCategoryes == null)
                {
                    Response.Redirect("messages.aspx?Mid=300");
                }
                txtCatName.Text = portionCategoryes.catName;
                DDLparentCat.SelectedValue = portionCategoryes.parentCatId + "";
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            portionCategoryes portionCategoryes = new portionCategoryes()
            {
                Cid = int.Parse(HiddenCid.Value),
                catName = txtCatName.Text,
                parentCatId = int.Parse(DDLparentCat.SelectedValue)
            };
            portionCategoryes.addUpdateCategory();
            if (portionCategoryes.Cid != - 1)
            {
                Response.Redirect("portionCatList.aspx");
            }
        }
    }
}