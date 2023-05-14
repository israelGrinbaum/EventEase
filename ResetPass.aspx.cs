using eventsHall.App_Code;
using System;

namespace eventsHall
{
    public partial class ResetPass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string token = Request["token"] + "";
                if (!BLL.User.isValidToken(token))
                {
                    Response.Redirect("login.aspx");
                }
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            if (txtPass.Text != txtPass2.Text)
            {
                msgError.Visible = true;
                return;
            }
            string token = Request["token"] + "";
            string pass = assets.ComputeSha256Hash(txtPass.Text);
            BLL.User.updatePass(pass, token);
            Response.Redirect("login.aspx");
        }
    }
}