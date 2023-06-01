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
    public partial class addUpdateHall : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string Hid = Request.Params["Hid"]+"";
            string op = Request.Params["op"]+"";
            if (Hid == "")
            {
                HiddenHid.Value = "-1";
            }
            else
            {
                HiddenHid.Value = Hid;
            }
            if (op == "del")
            {
                hall.removeHallById(int.Parse(Hid));
                Response.Redirect("messages.aspx?Mid=1303");
            }
            if (op == "delPic")
            {
                string picName = Request.Params["picName"] + "";
                var Hall = hall.getHallById(int.Parse(HiddenHid.Value));
                string newPics = Hall.pics.Replace("@" + picName + "@", "");
                if (newPics == "")
                {
                    newPics = "noPic.jpg";
                }
                hall.updatePicById(int.Parse(Hid), newPics);
            }
            if (!IsPostBack)
            {
                fillData(op);
            }

        }
        public void fillData(string op)
        {
            if (HiddenHid.Value != "-1")
            {
                var Hall=hall.getHallById(int.Parse(HiddenHid.Value));
                txtName.Text = Hall.Hname;
                txtContaining.Text = Hall.containing + "";
                HiddenPics.Value = Hall.pics;
                if (HiddenPics.Value.Length > 2)
                {
                    string[] imgArr = HiddenPics.Value.Substring(1, HiddenPics.Value.Length - 2).Replace("@@", "@").Split('@');
                    if (HiddenPics.Value == "noPic.jpg")
                    {
                        imgArr[0] = "noPic.jpg";
                    }
                    RPTimg.DataSource = imgArr;
                    RPTimg.DataBind();
                }
                txtLocation.Text = Hall.location;
                txtPrice.Text = Hall.price + "";
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string Pics = "";
            if (HiddenPics.Value != "noPic.jpg")
            {
                Pics = HiddenPics.Value;
            }
            if (picUpload.HasFiles)
            {
                foreach (var file in picUpload.PostedFiles)
                {
                    string NewFileName = assets.GetRandStr(10) + Path.GetExtension(file.FileName);
                    file.SaveAs(Server.MapPath("/uploads/pics/halls/") + NewFileName);
                    Pics += "@" + NewFileName + "@";
                }
            }
            if (!picUpload.HasFile && HiddenPics.Value == "" || HiddenPics.Value =="noPic.jpg")
            {
                Pics = "noPic.jpg";
            }
            hall hall = new hall();
            {
                hall.Hid=int.Parse(HiddenHid.Value);
                hall.Hname =txtName.Text;
                hall.containing =int.Parse(txtContaining.Text);
                hall.pics =Pics;
                hall.location =txtLocation.Text;
                hall.price =double.Parse(txtPrice.Text);
            };
            hall.addUpdateHall();
            if (hall.Hid != -1)
            {
                Response.Redirect("HallsList.aspx");
            }
        }
    }
}