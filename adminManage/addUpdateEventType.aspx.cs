using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
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
                Response.Redirect("eventTypesList.aspx");
            }
            if (!IsPostBack)
            {
                fillData();
            }

        }
        public void fillData()
        {
            //DDLOrderDetailsPermitted.DataSource=portionCategoryes.getAllCategoryes("");
            //DDLOrderDetailsPermitted.DataTextField = "catName";
            //DDLOrderDetailsPermitted.DataValueField = "Cid";
            //DDLOrderDetailsPermitted.DataBind();
            ODPListBox1.DataSource=portionCategoryes.getAllCategoryes("");
            ODPListBox1.DataTextField = "catName";
            ODPListBox1.DataValueField = "Cid";
            ODPListBox1.DataBind();
            if(HiddenETid.Value != "-1")
            {
                var thisEventType = eventType.getEventTypeById(int.Parse(HiddenETid.Value));
                txtETname.Text = thisEventType.ETname;
                txtPricePerPortion.Text = thisEventType.PricePerPortion+"";
                HiddenODPs.Value = Newtonsoft.Json.JsonConvert.SerializeObject(thisEventType.orderDetailPermitteds);
                //string stODCPermitted = thisEventType.OrderDetailsPermitted.Replace("@@", "@");
                //string[] ODCPermitted = stODCPermitted.Substring(1, stODCPermitted.Length - 2).Split('@');
                //foreach(string oDCPermitted in ODCPermitted)
                //{
                //    DDLOrderDetailsPermitted.Items.FindByValue(oDCPermitted).Selected = true;
                //}
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //StringBuilder sb = new StringBuilder();
            //int[] arrSelectedValues = DDLOrderDetailsPermitted.GetSelectedIndices();
            //foreach (int i in arrSelectedValues)
            //{
            //    sb.Append("@" + DDLOrderDetailsPermitted.Items[i].Value + "@");
            //}
            eventType eventType = new eventType()
            {
                ETid = int.Parse(HiddenETid.Value),
                ETname = txtETname.Text,
                PricePerPortion = float.Parse(txtPricePerPortion.Text),
                //OrderDetailsPermitted=sb.ToString(),
            };
            eventType.addUpdateEventType();
            if (eventType.ETid != -1)
            {
                Response.Redirect("eventTypesList.aspx");
            }
        }
        [WebMethod]
        public static string saveEventType(object eventType)
        {
            BLL.eventType EventType = new JavaScriptSerializer().ConvertToType<BLL.eventType>(eventType);
            EventType.addUpdateEventType();
            foreach(var ODP in EventType.orderDetailPermitteds)
            {
                ODP.eventTypeId=EventType.ETid;
                ODP.addUpsateOrderDetailPermitteds();
            }
            return null;
        }
        [WebMethod]
        public static string deleteODP(object ODPid)
        {
            orderDetailPermitted.removeOrderDetailPermittedsById(int.Parse(ODPid+""));
            return null;
        }

        //protected void btnAddODP_Click(object sender, EventArgs e)
        //{

        //}
    }
}