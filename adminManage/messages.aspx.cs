using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eventsHall.adminManage
{
    public partial class messages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string mid = Request.Params["Mid"] + "";
                string param = Request.Params["param"] + "";
                string msgText=msg.getMsgById(mid);
                if (param != "")
                {
                    msgText=msgText.Replace("###", param);
                }
                ltlMsgBody.Text = msgText;
            }
        }
    }
}