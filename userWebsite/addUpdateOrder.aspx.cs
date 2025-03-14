﻿using BLL;
using Newtonsoft.Json;
using Syncfusion.CompoundFile.XlsIO.Native;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Security.Policy;
using System.Text.Json.Serialization;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
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
            DDLEventType.Items.Insert(0, new ListItem() { Text = "בחר", Value = "0", Selected = true });
            var halls = item.getAll("T_Halls", "Hid", "Hname");
            DDLHid.DataSource = halls;
            DDLHid.DataTextField = "value";
            DDLHid.DataValueField = "key";
            DDLHid.DataBind();
            DDLHid.Items.Insert(0, new ListItem() { Text = "בחר", Value = "0", Selected = true });
            var eventTypePrice = item.getAll("T_EventType", "ETid", "pricePerPortion");
            ltlEventTypePrice.Text = "<script> var eventTypePrice=" + JsonConvert.SerializeObject(eventTypePrice)+ "</script>";
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
                    DDLHid.Items.FindByValue("0").Selected = false;
                    DDLHid.Items.FindByValue(order.Hid + "").Selected = true;
                }
                if (DDLEventType.Items.FindByValue(order.eventTypeId + "") != null)
                {
                    DDLEventType.Items.FindByValue("0").Selected = false;
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
            //int Oid = int.Parse(HiddenOid.Value);
            //int Uid = user.Uid;
            //DateTime eventDate = DateTime.Parse(txtEventDate.Text);
            //int somepeople = int.Parse(txtSomePeople.Text);
            //int eventTypeId = int.Parse(DDLEventType.SelectedItem.Value);
            //int Hid = int.Parse(DDLHid.SelectedItem.Value);
            //string notes = txtNotes.Text;
            if (int.Parse(DDLEventType.SelectedItem.Value) == 0)
            {
                Literal ltlMsg = Master.FindControl("ltlMsg") as Literal;
                HtmlControl toats = Master.FindControl("liveToast") as HtmlControl;
                toats.Attributes["class"] += " show";
                ltlMsg.Text = "לא נבחר סוג אירוע";
                return;
            }
            if (int.Parse(DDLHid.SelectedItem.Value) == 0)
            {
                Literal ltlMsg = Master.FindControl("ltlMsg") as Literal;
                HtmlControl toats = Master.FindControl("liveToast") as HtmlControl;
                toats.Attributes["class"] += " show";
                ltlMsg.Text = "לא נבחר אולם";
                return;

            }

            try
            {
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
                    Response.Redirect("addUpdateOrderDetail.aspx?Oid=" + order.Oid);
                }
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }

        }
    }
}