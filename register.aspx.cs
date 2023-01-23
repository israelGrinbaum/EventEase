using BLL;
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

        }

        protected void BtnReg_Click(object sender, EventArgs e)
        {
            if (TxtName.Text=="")
            {
                nameMsg.Text = "שדה זה הינו שדה חובה";
                nameMsg.CssClass = "text-warning";
            }
            if (TxtEmail.Text=="")
            {
                emailMsg.Text = "שדה זה הינו שדה חובה";
                emailMsg.CssClass = "text-warning";
            }
            if (TxtPhone.Text=="")
            {
                phoneMsg.Text = "שדה זה הינו שדה חובה";
                phoneMsg.CssClass = "text-warning";
            }
            if (TxtPass.Text=="")
            {
                passMsg.Text = "שדה זה הינו שדה חובה";
                nameMsg.CssClass = "text-warning";
            }
            if (TxtPass2.Text=="")
            {
                pass2Msg.Text = "שדה זה הינו שדה חובה";
                pass2Msg.CssClass = "text-warning";
            }

            if (TxtPass.Text != TxtPass2.Text)
            {
                passMsg.Text = "הסיסמאות צריכות להיות זהות";
                passMsg.CssClass = "text-warning";
            }
            User tmp = new User()
            {
                Uname=TxtName.Text,
                email=TxtEmail.Text,
                phone=TxtPhone.Text,
                pass=TxtPass.Text,
            };
            if (tmp.checkLogin())
            {
                Response.Redirect("login.aspx"); 
            }
            else
            {
                tmp.register();
                Response.Write("register succefule");
            }
        }
    }
}