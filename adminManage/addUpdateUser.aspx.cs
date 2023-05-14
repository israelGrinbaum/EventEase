using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eventsHall.adminManage
{
    public partial class addUpdateUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string Uid = Request["Uid"] + "";
            string op = Request["op"] + "";
            if (op == "del")
            {

            }
            if (Uid == "")
            {
                HiddenUid.Value = "-1";
            }
            else
            {
                HiddenUid.Value = Uid;
            }
            if (!IsPostBack)
            {
                FillData();
            }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

        }
        public void FillData()
        {

            //DDLparentCat.DataSource = portionCategoryes.getAllCategoryes("");
            //DDLparentCat.DataTextField = "catName";
            //DDLparentCat.DataValueField = "Cid";
            //DDLparentCat.DataBind();
            //DDLparentCat.Items.Insert(0, new ListItem("קטגוריה ראשית", "0"));
            DDLpermmision.DataSource = item.getAll("T_Permmisions", "PerId", "Permmision");
            DDLpermmision.DataTextField = "value";
            DDLpermmision.DataValueField = "key";
            DDLpermmision.DataBind();
            DDLpermmision.SelectedValue = "300";
            if (HiddenUid.Value != "-1")
            {
                User tmpUser = new User()
                {
                    Uid = int.Parse(HiddenUid.Value)
                };
                tmpUser.checkLogin();
                if (tmpUser == null)
                {
                    Response.Redirect("messages.aspx?Mid=300");
                }
                txtName.Text = tmpUser.Uname;
                txtemail.Text = tmpUser.email;
                txtphone.Text = tmpUser.phone;
                DDLpermmision.SelectedValue = tmpUser.permissions;
            }
        }

    }
}