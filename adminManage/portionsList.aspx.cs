using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eventsHall.adminManage
{
    public partial class portionsList : System.Web.UI.Page
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
            RPTPortions.DataSource = portions.getAllportions("");
            RPTPortions.DataBind();
        }


        protected void RPTPortions_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                string cats = ((portions)e.Item.DataItem).portionCatId.Replace("@@", "@");
                if (cats.Length >= 1&&cats!=null)
                {
                    string[] catsId = cats.Substring(1, cats.Length - 2).Split('@');
                    if (catsId.Length >= 2)
                    {
                        string st = "";
                    }
                    foreach (string c in catsId)
                    {
                        c.Replace("@", "");
                        portionCategoryes PC = new portionCategoryes()
                        {
                            Cid = int.Parse(c)
                        };
                        List<portionCategoryes> list = ((List<portionCategoryes>)Application["lstPC"]);
                        PC = list.Find(x => x.Cid == int.Parse(c));

                        //string catName = item.getAnyData("T_PortionCategoryes", "catName", "Cid",c+"");
                        if (PC.Cid != null)
                        {
                            ((Literal)e.Item.FindControl("ltlCat")).Text += $"<span class=\"fs-6 badge text-bg-secondary\"style=\"margin: 3px;\">{PC.catName}</span></br><div hidden=\"hidden\">{PC.catName}, </div>";
                        }
                        //portionCategoryes.getCategoryById(int.Parse(c))
                    }

                }

            }
        }
    }
}