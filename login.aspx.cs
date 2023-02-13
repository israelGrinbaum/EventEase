using BLL;
using eventsHall.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eventsHall
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                ltlIsNotExist.Text = "";
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            User userTmp = new User()
            {
                email = txtEmail.Text,
                pass = assets.ComputeSha256Hash(txtPass.Text)
            };
            if (userTmp.checkLogin())
            {
                ltlIsNotExist.Text = msg.getMsgById("307");
                Session["User"]=userTmp;
                Response.Redirect("adminManage/portionCatList.aspx");
            }
            else
            {
                ltlIsNotExist.Text = msg.getMsgById("306");
            }
            
        }
    }
}