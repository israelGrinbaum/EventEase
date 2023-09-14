using BLL;
using Newtonsoft.Json;
using Syncfusion.CompoundFile.XlsIO.Native;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Security.Cryptography;
using System.Text.Json.Nodes;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eventsHall.adminManage
{
    public partial class addUpdateOrderDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string ODid = Request.Params["ODid"] + "";
            string Oid = Request.Params["Oid"] + "";
            string op = Request.Params["op"]+ "";
            if (op == "del")
            {
                BLL.orderDetails.removeOrderDetailById(int.Parse(ODid));
                Response.Redirect($"messages.aspx?Mid=2304&param=Oid={Oid}");
            }
            if(Oid == "")
            {
                Response.Redirect("messages.aspx?Mid=2303");
            }
            else
            {
                HiddenOid.Value = Oid;
            }
            if (ODid == "")
            {
                HiddenODid.Value = "-1";
            }
            else
            {
                HiddenODid.Value = ODid;
            }
            if (!IsPostBack)
            {
                fillData();
            }
        }
        public void fillData()
        {
            txtOid.Text = HiddenOid.Value;
            //RPTproducts.DataSource = portions.getAllportions("");
            //RPTproducts.DataBind();
            string ETid = item.getAnyData("T_Orders", "eventTypeId", "Oid", HiddenOid.Value + "");
            List<orderDetailPermitted> orderDetailPermitteds = orderDetailPermitted.GetOrderDetailPermittedsByEventTypeId(int.Parse(ETid));
            List<portionCategoryes> listODP = new List<portionCategoryes>();
            List<portionCategoryes> listODC = ((List<portionCategoryes>)Application["lstPC"]);
            foreach (var ODP in orderDetailPermitteds)
            {
                portionCategoryes ODC = new portionCategoryes()
                {
                    Cid = ODP.orderDetailId
                };
                ODC = listODC.Find(x => x.Cid == ODP.orderDetailId);
                listODP.Add(ODC);
            }

            //string OrederDetailPermittedId = item.getAnyData("T_EventType", "OrderDetailsPermitted", "ETid", ETid).Replace("@@", "@");
            //if (OrederDetailPermittedId.Length >= 1 && OrederDetailPermittedId != null)
            //{
            //    string[] OrederDetailsPermittedId = OrederDetailPermittedId.Substring(1, OrederDetailPermittedId.Length - 2).Split('@');
            //    foreach (var ODPid in OrederDetailsPermittedId)
            //    {
            //        ODPid.Replace("@", "");
            //        portionCategoryes ODC = new portionCategoryes()
            //        {
            //            Cid = int.Parse(ODPid)
            //        };
            //        ODC = listODC.Find(x => x.Cid == int.Parse(ODPid));
            //        listODP.Add(ODC);
            //    }
            //}
            DDLODCatId.DataSource = listODP;
            DDLODCatId.DataTextField = "catName";
            DDLODCatId.DataValueField = "Cid";
            DDLODCatId.DataBind();
            DDLODCatId.Items.Insert(0, new ListItem("בחר קטגוריה", "null"));
            if (HiddenODid.Value != "-1")
            {
                BLL.orderDetails OD=BLL.orderDetails.getOrderDetailsByODid(int.Parse(HiddenODid.Value));
                btnProd.InnerText = item.getAnyData("T_Portions", "Pname", "Pid", OD.Pid + "");
                inputPid.Value = OD.Pid + "";
                txtAmount.Text = OD.amount + "";
                inputPrice.Value = OD.price + "";
                DDLODCatId.SelectedValue = OD.ODCatId + "";
                orderLink.HRef= "orderDetails.aspx?Oid=" + OD.Oid;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int ODid = int.Parse(HiddenODid.Value);
            int Oid = int.Parse(HiddenOid.Value);
            int Pid = int.Parse(inputPid.Value);
            int amount = int.Parse("0"+txtAmount.Text);
            double price = double.Parse(inputPrice.Value + "");
            int ODCatId = int.Parse(DDLODCatId.SelectedItem.Value);

            BLL.orderDetails OD = new BLL.orderDetails()
            {
                ODid=int.Parse(HiddenODid.Value),
                Oid=int.Parse(HiddenOid.Value),
                Pid = int.Parse(inputPid.Value),
                amount =int.Parse("0" + txtAmount.Text),
                price = double.Parse("0" + inputPrice.Value),
                ODCatId =int.Parse(DDLODCatId.SelectedItem.Value),
            };
            OD.addUpdateOrderDetail();
            if (OD.ODid != -1)
            {
                Response.Redirect("orderDetails.aspx?Oid=" + OD.Oid);
            }
        }
        [WebMethod]
        public static string selectCatChange(object Cid)
        {
            var Portions = portions.getAllportions("");
            List<portions> data = new List<portions>();
            foreach(var portion in Portions)
            {
                if (portion.portionCatId.Contains("@" + Cid + "@"))
                {
                    data.Add(portion);
                }
            }
            return JsonConvert.SerializeObject(data);
        }

    }
}