using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eventsHall.templates
{
    public partial class forgotPassTemplate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                string token = Request["token"]+"";
                HplForgetPass.NavigateUrl = $"http://localhost:46327/ResetPass.aspx?token={token}";
            }
        }
    }
}