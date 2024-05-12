using BLL;
using eventsHall.App_Code;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace eventsHall.adminManage
{
    public partial class addUpdatePortion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string pid = Request["Pid"] + "";
            string op = Request["op"] + "";
            if (op == "del")
            {
                portions.removeportionById(int.Parse(pid));
                Response.Redirect("messages.aspx?Mid=1301");
            }
            if (pid == "")
            {
                HiddenPid.Value = "-1";
            }
            else
            {
                HiddenPid.Value = pid;
            }
            if (!IsPostBack)
            {
                FillData();
            }
        }
        public void FillData()
        {
            DDLCats.DataSource = portionCategoryes.getAllCategoryes("");
            DDLCats.DataTextField = "catName";
            DDLCats.DataValueField = "Cid";
            DDLCats.DataBind();
            DDLCats.Items.Insert(0, new ListItem() { Text= "קטגוריה ראשית" ,Value="0",Selected=true});

            if (HiddenPid.Value != "-1")
            {
                portions portion = new portions();
                portion = portions.getportionById(int.Parse(HiddenPid.Value));
                if (portion == null)
                {
                    Response.Redirect("messages.aspx?Mid=300");
                }
                txtPName.Text = portion.Pname;
                txtPdesc.Text = portion.Pdesc;
                txtPrice.Text = portion.price+"";
                pic.ImageUrl = "/uploads/pics/portions/" + portion.picName;
                string cats = portion.portionCatId.Replace("@@", "@");
                if (cats.Length > 3)
                {
                    string[] catsId = cats.Substring(1, cats.Length - 2).Split('@');
                    foreach (string catId in catsId)
                    {
                        if (portionCategoryes.getCategoryById(int.Parse(catId)) != null)
                        {
                            DDLCats.Items.FindByValue(catId).Selected = true;
                        }
                    }
                }
            }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string[] arr = pic.ImageUrl.Split('/');
            string NewFileName = arr[arr.Length-1];
            if (NewFileName == "")
            {
                NewFileName = "noPic.jpg";
            }
            if (picUpload.HasFile)
            {
                NewFileName = assets.GetRandStr(10) + Path.GetExtension(picUpload.FileName);
                picUpload.SaveAs(Server.MapPath("/uploads/pics/portions/") + NewFileName);
            }
            StringBuilder sb = new StringBuilder();
            int[] arrSelectedValues = DDLCats.GetSelectedIndices();
            foreach (int i in arrSelectedValues)
            {
                sb.Append("@"+ DDLCats.Items[i].Value + "@");
            }
            string price = txtPrice.Text!=""? txtPrice.Text:"0";
            portions portion = new portions()
            {
                Pid = int.Parse(HiddenPid.Value),
                Pname = txtPName.Text,
                Pdesc = txtPdesc.Text,
                price = double.Parse(price),
                picName = NewFileName,
                portionCatId = sb.ToString()
            };
            portion.addUpdateportion();
            if (portion.Pid != -1)
            {
                Response.Redirect("portionsList.aspx");
            }
        }

    }
}