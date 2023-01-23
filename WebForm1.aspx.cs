using eventsHall.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eventsHall
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write(assets.SendEmail("yg0527156194@gmail.com", "tsf", "vsdrg"));

        }

        protected void send_Click(object sender, EventArgs e)
        {
            for(int i = 0; i < 100; i++)
            {
                Response.Write(assets.SendEmail(txtTo.Text, txtSubject.Text, txtBody.Text));


            }

        }
    }
}