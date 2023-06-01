using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
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
            fillData();
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
                txtPrice.Text = OD.price + "";
                DDLODCatId.SelectedValue = OD.ODCatId + "";
                orderLink.HRef= "orderDetails.aspx?Oid=" + OD.Oid;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            BLL.orderDetails OD = new BLL.orderDetails()
            {
                ODid=int.Parse(HiddenODid.Value),
                Oid=int.Parse(txtOid.Text),
                Pid = int.Parse(inputPid.Value),
                amount =int.Parse(txtAmount.Text),
                price = double.Parse(txtPrice.Text+""),
                ODCatId =int.Parse(DDLODCatId.SelectedValue+""),
            };
            OD.addUpdateOrderDetail();
            if (OD.ODid != -1)
            {
                Response.Redirect("orderDetails.aspx?Oid=" + OD.Oid);
            }
        }

    }
}