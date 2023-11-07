using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eventsHall.userWebsite
{
    public partial class addUpdateOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string oid = Request["Oid"] + "";
            string op = Request["op"] + "";
            if (op == "del")
            {
                orders.removeOrderById(int.Parse(oid));
                Response.Redirect("messages.aspx?Mid=1302");
            }
            if (oid == "")
            {
                HiddenOid.Value = "-1";
            }
            else
            {
                HiddenOid.Value = oid;
            }
            if (!IsPostBack)
            {
                fillData();
            }
        }
        public void fillData()
        {
            if ((User)Session["User"] != null)
            {
                var user = (User)Session["User"];
                txtUid.Text = user.Uname;
            }
            else
            {
                Response.Redirect("../login.aspx");
            }
            var eventType = item.getAll("T_EventType", "ETid", "ETname");
            DDLEventType.DataSource = eventType;
            DDLEventType.DataTextField = "value";
            DDLEventType.DataValueField = "key";
            DDLEventType.DataBind();
            var halls = item.getAll("T_Halls", "Hid", "Hname");
            DDLHid.DataSource = halls;
            DDLHid.DataTextField = "value";
            DDLHid.DataValueField = "key";
            DDLHid.DataBind();
            if (HiddenOid.Value != "-1")
            {
                var order = orders.getOrderById(int.Parse(HiddenOid.Value));
                if (order == null)
                {
                    Response.Redirect("messages.aspx?Mid=300");
                }
                txtEventDate.Text = order.eventDate + "";
                txtSomePeople.Text = order.somepeople + "";
                if (DDLHid.Items.FindByValue(order.Hid + "") != null)
                {
                    DDLHid.Items.FindByValue(order.Hid + "").Selected = true;
                }
                if (DDLEventType.Items.FindByValue(order.eventTypeId + "") != null)
                {
                    DDLEventType.Items.FindByValue(order.eventTypeId + "").Selected = true;
                }

                txtNotes.Text = order.notes;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            User user=null;
            if ((User)Session["User"] != null)
            {
                user = (User)Session["User"];
            }
            else
            {
                Response.Redirect("../login.aspx");
            }
            int Oid = int.Parse(HiddenOid.Value);
            int Uid = user.Uid;
            DateTime eventDate = DateTime.Parse(txtEventDate.Text);
            int somepeople = int.Parse(txtSomePeople.Text);
            int eventTypeId = int.Parse(DDLEventType.SelectedItem.Value);
            int Hid = int.Parse(DDLHid.SelectedItem.Value);
            string notes = txtNotes.Text;

            orders order = new orders()
            {
                Oid = int.Parse(HiddenOid.Value),
                Uid = user.Uid,
                eventDate = DateTime.Parse(txtEventDate.Text),
                somepeople = int.Parse(txtSomePeople.Text),
                eventTypeId = int.Parse(DDLEventType.SelectedItem.Value),
                Hid = int.Parse(DDLHid.SelectedItem.Value),
                notes = txtNotes.Text,
            };
            order.addUpdateOrder();
            if (order.Oid != -1)
            {
                Response.Redirect("addUpdateOrderDetail.aspx");
            }

        }
    }
}