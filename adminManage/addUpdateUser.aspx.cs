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
            BLL.User user =new User()
            {
                Uid=int.Parse(HiddenUid.Value),
                Uname=txtName.Text,
                email=txtemail.Text,
                phone=txtphone.Text,
            };
            if (user.Uid == -1)
            {
                user.register();
                if(user.Uid != -1)
                {
                    Response.Redirect("usersList.aspx");
                }
            }
            else
            {
                user.updateUser();
                Response.Redirect("usersList.aspx");
            }
        }
        public void FillData()
        {
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
                
                if (!tmpUser.getUserById())
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