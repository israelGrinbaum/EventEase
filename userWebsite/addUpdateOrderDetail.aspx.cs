using BLL;
using Newtonsoft.Json;
using Syncfusion.CompoundFile.XlsIO.Native;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.EnterpriseServices.CompensatingResourceManager;
using System.Linq;
using System.Security.Cryptography;
using System.Text.Json.Nodes;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace eventsHall.userWebsite
{
    public partial class addUpdateOrderDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string Oid = Request.Params["Oid"] + "";
            if (Oid == "")
            {
                Response.Redirect("messages.aspx?Mid=2303");
            }
            else
            {
                HiddenOid.Value = Oid;
            }
            if (!IsPostBack)
            {
                fillData();
            }

        }
        public void fillData()
        {
            string ETid = item.getAnyData("T_Orders", "eventTypeId", "Oid", HiddenOid.Value + "");
            List<orderDetailPermitted> orderDetailPermitteds = orderDetailPermitted.GetOrderDetailPermittedsByEventTypeId(int.Parse(ETid));
            List<portionCategoryes> listODP = new List<portionCategoryes>();
            List<portionCategoryes> listODC = ((List<portionCategoryes>)Application["lstPC"]);
            foreach (var ODP in orderDetailPermitteds)
            {
                portionCategoryes ODC = new portionCategoryes();
                ODC = listODC.Find(x => x.Cid == ODP.orderDetailId);
                listODP.Add(ODC);
            }

            rptPortions.DataSource = listODP;
            rptPortions.DataBind();
            RptCats.DataSource = listODP;
            RptCats.DataBind();

            List<object> ODPdata = new List<object>();
            foreach (var ODP in orderDetailPermitteds)
            {
                ODPdata.Add(Tuple.Create(ODP.orderDetailId, ODP.choiceQuantity));
            }
            ltlODPermitted.Text = "<script>var ODpermitted = ";
            ltlODPermitted.Text += JsonConvert.SerializeObject(ODPdata);
            ltlODPermitted.Text += "</script>";
            ltlODPermitted.Text = ltlODPermitted.Text.Replace("Item1", "orderDetailId");
            ltlODPermitted.Text = ltlODPermitted.Text.Replace("Item2", "choiceQuantity");

            List<orderDetails> OrderDetails = orderDetails.getOrderDetailsByOid(int.Parse(HiddenOid.Value));
            Session["OrderDateils"] = OrderDetails;
        }


        protected void btnSave_Click(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string SavePortion(orderDetails[] OrderDetails)
        {
            if(OrderDetails==null || OrderDetails.Length == 0)
            {
                return "{\"not objects send\":\"\"}";
            }
            int Oid = int.Parse(HttpUtility.ParseQueryString(HttpContext.Current.Request.UrlReferrer.Query)["Oid"]);
            string ret = "{\"statuses\":[";
            List<int> catsRemoved= new List<int>();
            for (int i = 0; i < OrderDetails.Length; i++)
            {
                if (!catsRemoved.Contains(OrderDetails[i].ODCatId))
                {
                    List<orderDetails> ODsameCats = (List<orderDetails>)HttpContext.Current.Session["OrderDateils"];
                    ODsameCats = ODsameCats.Where(x => x.ODCatId == OrderDetails[i].ODCatId).ToList();
                    foreach (orderDetails ODSameCat in ODsameCats)
                    {
                        orderDetails.removeOrderDetailById(ODSameCat.ODid);
                    }
                    catsRemoved.Add(OrderDetails[i].ODCatId);
                }
            }
            List<orderDetails> sessionOrderDetails = orderDetails.getOrderDetailsByOid(Oid);
            HttpContext.Current.Session["OrderDateils"] = sessionOrderDetails;
            for (int i = 0; i < OrderDetails.Length; i++)
            {
                orderDetails OD = new orderDetails()
                {
                    ODid = -1,
                    Oid = Oid,
                    Pid = OrderDetails[i].Pid,
                    amount = int.Parse("0"),
                    price = double.Parse("0"),
                    ODCatId = OrderDetails[i].ODCatId,
                };
                OD.addUpdateOrderDetail();
                if (OD.ODid == -1)
                {
                    ret += "{\"pid\":" + OD.Pid + ",\"status\":\"failed\"},";
                }
                else
                {
                    ret += "{\"pid\":" + OD.Pid + ",\"status\":\"succses\"},";
                }
            }
            //if (OD.ODid != -1)
            //{
            //    Response.Redirect("orderDetails.aspx?Oid=" + OD.Oid);
            //}
            ret= ret.Substring(0,ret.Length - 1) + "]}";
            return ret;
        }

        protected void rptPortions_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                var a = e.Item.DataItem;
                string PCName = ((portionCategoryes)e.Item.DataItem).catName;
                //((Literal)e.Item.FindControl("ltlPortionCatName")).Text = PCName;
                var Portions = portions.getAllportions("");
                List<portions> data = new List<portions>();
                foreach (var portion in Portions)
                {
                    if (portion.portionCatId.Contains("@" + ((portionCategoryes)e.Item.DataItem).Cid + "@"))
                    {
                        data.Add(portion);
                    }
                }
                ((Repeater)e.Item.FindControl("RPTproducts")).DataSource = data;
                ((Repeater)e.Item.FindControl("RPTproducts")).DataBind();
            }
        }

        protected void RPTproducts_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                portions portion = (portions)e.Item.DataItem;
                string isPidExist = "";
                string CBName = portion.portionCatId;
                string CBValue = portion.Pid + "";
                List<orderDetails> OrderDetails = (List<orderDetails>)Session["OrderDateils"];
                if(OrderDetails != null)
                {
                    orderDetails OrderDetail = OrderDetails.Find(x=>x.Pid == portion.Pid);
                    if(OrderDetail != null)
                    {
                        isPidExist = "checked=\"checked\"";
                    }
                }
                ((Literal)e.Item.FindControl("ltlSelectPortionCB")).Text = $"<input name=\"{CBName}\" value=\"{CBValue}\" type=\"checkbox\" class=\"btn-check\" id=\"btn-check-outlined-{portion.Pid}\" autocomplete=\"off\" {isPidExist}>";
            }

        }
    }
}