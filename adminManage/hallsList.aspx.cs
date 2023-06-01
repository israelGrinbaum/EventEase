using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eventsHall.adminManage
{
    public partial class hallsList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                fillData();
            }
        }
        public void fillData()
        {
            RPTHalls.DataSource = hall.getAllHalls("");
            RPTHalls.DataBind();
            RPTpics.DataSource = hall.getAllHalls("");
            RPTpics.DataBind();
        }

        protected void RPTHalls_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }

        protected void RPTpics_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                string pics=((hall)e.Item.DataItem).pics;
                if (pics.Length > 2)
                {
                    string[] imgArr = pics.Substring(1, pics.Length - 2).Replace("@@", "@").Split('@');
                    if (pics == "noPic.jpg")
                    {
                        imgArr[0] = "noPic.jpg";
                    }
                    ((Literal)e.Item.FindControl("ltlPics")).Text += $"<div id=\"{((hall)e.Item.DataItem).Hid}\" style=\"display:none;\"><div class=\"container\"><div class=\"row\">";
                    string str = ((Literal)e.Item.FindControl("ltlPics")).Text;
                    foreach (string img in imgArr)
                    {
                        ((Literal)e.Item.FindControl("ltlPics")).Text += $"<img class=\"col-md-6 ms-auto\" src=\"/uploads/pics/halls/{img}\"/>";
                        str = ((Literal)e.Item.FindControl("ltlPics")).Text;
                    }
                    ((Literal)e.Item.FindControl("ltlPics")).Text += "</div></div></div>";
                    str = ((Literal)e.Item.FindControl("ltlPics")).Text;

                }

            }

        }
    }
}