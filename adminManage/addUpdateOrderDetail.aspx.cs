using BLL;
using Syncfusion.CompoundFile.XlsIO.Native;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
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
            RPTproducts.DataSource = portions.getAllportions("");
            RPTproducts.DataBind();
            DDLODCatId.DataSource = orderDetailCategoryes.getAllCategoryes();
            DDLODCatId.DataTextField = "catName";
            DDLODCatId.DataValueField = "Cid";
            DDLODCatId.DataBind();
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
            int amount = int.Parse(txtAmount.Text);
            double price = double.Parse(inputPrice.Value + "");
            int ODCatId = int.Parse(DDLODCatId.SelectedItem.Value);

            BLL.orderDetails OD = new BLL.orderDetails()
            {
                ODid=int.Parse(HiddenODid.Value),
                Oid=int.Parse(HiddenOid.Value),
                Pid = int.Parse(inputPid.Value),
                amount =int.Parse(txtAmount.Text),
                price = double.Parse(inputPrice.Value +""),
                ODCatId =int.Parse(DDLODCatId.SelectedItem.Value),
            };
            OD.addUpdateOrderDetail();
            if (OD.ODid != -1)
            {
                Response.Redirect("orderDetails.aspx?Oid=" + OD.Oid);
            }
        }

    }
}