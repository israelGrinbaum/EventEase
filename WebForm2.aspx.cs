using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using RestSharp;
using Newtonsoft.Json;
using BLL;

namespace eventsHall
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var client = new RestClient();
            var req=new RestRequest("https://fakestoreapi.com/products");
            var res=client.Get(req);
            var lst = JsonConvert.DeserializeObject<List<fakeProd>>(res.Content);
            rptFakeProds.DataSource = lst;
            rptFakeProds.DataBind();
            //foreach (var item in lst)
            //{
            //    Response.Write(item.title);
            //}
            //Response.Write(res.Content);
            
        }
    }
}