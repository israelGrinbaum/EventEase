using eventsHall.App_Code;
using System;

namespace eventsHall
{
    public partial class forgetPass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnForgot_Click(object sender, EventArgs e)
        {
            //if (BLL.User.isExist(txtEmail.Text))
            //{
            //    string token = assets.GetRandStr(40);
            //    BLL.User.SetResetToken(txtEmail.Text, token);
            //    assets.SendEmail(txtEmail.Text, "איפוס סיסמא", assets.getHtmlFromUrl($"http://localhost:46327/resetPass.aspx?token={token}"));
            //}
        }
    }
}