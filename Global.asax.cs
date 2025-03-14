﻿using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace eventsHall
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            List<portionCategoryes> lstPC = portionCategoryes.getAllCategoryes("");
            Application["lstPC"] = lstPC;
            List<orderDetailCategoryes> lstODC = orderDetailCategoryes.getAllCategoryes();
            Application["lstODC"] = lstODC;
            List<portions> lstPortions = portions.getAllportions("");
            Application["lstPortions"] = lstPortions;

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}