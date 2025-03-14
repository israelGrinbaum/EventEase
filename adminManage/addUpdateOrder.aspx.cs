﻿using BLL;
using Newtonsoft.Json;
using Syncfusion.XlsIO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eventsHall.adminManage
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
            var uid = item.getAll("T_Users", "Uid", "Uname");
            DDLUid.DataSource = uid;
            DDLUid.DataTextField = "value";
            DDLUid.DataValueField = "key";
            DDLUid.DataBind();
            DDLUid.Items.Insert(0, new ListItem() { Text = "בחר", Value = "0", Selected = true });
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
            ltlEventTypePrice.Text = "<script> var eventTypePrice=" + JsonConvert.SerializeObject(eventTypePrice) + "</script>";
            if (HiddenOid.Value != "-1")
            {
                var order= orders.getOrderById(int.Parse(HiddenOid.Value));
                if (order == null)
                {
                    Response.Redirect("messages.aspx?Mid=300");
                }
                if (DDLUid.Items.FindByValue(order.Uid + "") != null)
                {
                    DDLUid.Items.FindByValue("0").Selected = false;
                    DDLUid.Items.FindByValue(order.Uid + "").Selected = true;
                }
                txtEventDate.TextMode = TextBoxMode.SingleLine;
                txtEventDate.Text = order.eventDate + "";
                var a = DateTime.Now;
                
                if (a  > order.eventDate)
                {
                    txtEventDate.Enabled = false;
                    txtEventDate.CssClass = "form-control";
                }
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
            orders order = new orders()
            {
                Oid=int.Parse(HiddenOid.Value),
                Uid = int.Parse(DDLUid.SelectedItem.Value),
                eventDate = DateTime.Parse(txtEventDate.Text),
                somepeople = int.Parse(txtSomePeople.Text),
                eventTypeId = int.Parse(DDLEventType.SelectedItem.Value),
                Hid = int.Parse(DDLHid.SelectedItem.Value),
                notes =txtNotes.Text,
            };
            order.addUpdateOrder();
            if (order.Oid != -1)
            {
                Response.Redirect("ordersList.aspx");
            }
        }
    }
}