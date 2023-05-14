using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eventsHall.adminManage
{
    public partial class addUpdateEventType : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string ETid= Request.Params["ETid"]+"";
            string op= Request.Params["op"]+"";
            if (ETid == "")
            {
                HiddenETid.Value = "-1";
            }
            else
            {
                HiddenETid.Value = ETid;
            }
            if (op == "del")
            {
                eventType.removeEventTypeById(int.Parse(ETid));
                Response.Redirect("eventTypesList.apsx");
            }
            if (!IsPostBack)
            {
                fillData();
            }

        }
        public void fillData()
        {
            if(HiddenETid.Value != "-1")
            {

                var thisEventType = eventType.getEventTypeById(int.Parse(HiddenETid.Value));
                txtETname.Text = thisEventType.ETname;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            eventType eventType=new eventType()
            {
                ETid = int.Parse(HiddenETid.Value),
                ETname=txtETname.Text,
            };
            eventType.addUpdateEventType();
            if (eventType.ETid != -1)
            {
                Response.Redirect("eventTypesList.aspx");
            }
        }
    }
}