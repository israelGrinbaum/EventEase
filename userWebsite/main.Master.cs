using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eventsHall.userWebsite
{
    public partial class main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var usertmp = (User)Session["User"];
            if (usertmp != null)
            {
                conect.InnerHtml=conect.InnerHtml.Replace("התחבר", usertmp.Uname);
                conect.Attributes.Add("class", "btn btn-primary py-2 px-4 dropdown-toggle");
                conect.HRef = "#";
                dropdown.Attributes.Add("class", "dropdown");
                if (usertmp.permissions == "admin")
                {
                    dropDownMenu.InnerHtml += "<li><a class=\" btn-primary py-2 px-4 dropdown-item\" href=\"../adminmanage/orderslist.aspx\">לניהול</a></li>";
                }
            }

        }
    }
}