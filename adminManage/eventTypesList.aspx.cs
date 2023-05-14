using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eventsHall.adminManage
{
    public partial class eventTypesList : System.Web.UI.Page
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
            RPTEventType.DataSource = eventType.getAllEventTypes("");
            RPTEventType.DataBind();
        }
    }
}