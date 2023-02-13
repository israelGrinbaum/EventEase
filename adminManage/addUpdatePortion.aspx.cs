using BLL;
using eventsHall.App_Code;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
                Response.Redirect("messages.aspx?Mid=301");
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
            DDLCats.Items.Insert(0, new ListItem("קטגוריה ראשית", "0"));
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
                DDLCats.SelectedValue = portion.portionCatId + "";
            }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string[] arr = pic.ImageUrl.Split('/');
            string NewFileName = arr[arr.Length-1];
            if (picUpload.HasFile)
            {
                NewFileName = assets.GetRandStr(10) + Path.GetExtension(picUpload.FileName);
                picUpload.SaveAs(Server.MapPath("/uploads/pics/portions/") + NewFileName);
            }
            portions portion = new portions()
            {
                Pid=int.Parse(HiddenPid.Value),
                Pname = txtPName.Text,
                Pdesc = txtPdesc.Text,
                price = double.Parse(txtPrice.Text),
                picName = NewFileName,
                portionCatId = DDLCats.SelectedValue
            };
            portion.addUpdateportion();
            if (portion.Pid != -1)
            {
                Response.Redirect("portionsList.aspx");
            }
        }
    }
}