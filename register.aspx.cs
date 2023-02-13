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
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                ltlNoEmailExist.Text = "";
                ltlPassNoMatch.Text = "";
                ltlSuccessReg.Text = "";
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (BLL.User.isExist(txtEmail.Text))
            {
                ltlNoEmailExist.Text = msg.getMsgById("302");
                return;
            }
            if (txtPass.Text!=txtPass2.Text)
            {
                ltlPassNoMatch.Text = msg.getMsgById("303");
                return;
            }
            if (txtPass.Text.Length<5)
            {
                ltlPassNoMatch.Text = msg.getMsgById("304");
                return;
            }
            User userTmp = new User() {
                Uname=txtUname.Text,
                email=txtEmail.Text,
                phone=txtPhone.Text,
                pass=assets.ComputeSha256Hash(txtPass.Text),
            };
            userTmp.register();
            ltlSuccessReg.Text= msg.getMsgById("305");
        }
    }
}