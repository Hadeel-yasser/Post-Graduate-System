using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin
{
    public partial class Supervisor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            Response.Redirect("Supervisor View Students.aspx");
        
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Supervisor View Publications.aspx"); 
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            //add defense for gucian
            Response.Redirect("Add Defense.aspx");
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            //add defense for nongucian
            Response.Redirect("Add Defense NonGucian.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Add Examiner for Defense.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("Evaluate Progress Report.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("Cancel Thesis.aspx");
        }


    }
}