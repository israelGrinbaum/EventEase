using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace eventsHall.adminManage
{
    public partial class usersList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                fillData();
            }

        }
        public void fillData()
        {
            RPTUsers.DataSource = BLL.User.getAllUsers();
            RPTUsers.DataBind();
        }

    }


}