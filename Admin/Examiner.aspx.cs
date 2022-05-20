using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin
{
    public partial class Examiner : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void update_E_Click(object sender, EventArgs e)
        {
            Response.Redirect("Examiner Update Information.aspx");
        }

        protected void list_T_Click(object sender, EventArgs e)
        {
            Response.Redirect("Examiner List Theses.aspx");
        }

        protected void comments_E_Click(object sender, EventArgs e)
        {
            Response.Redirect("Examiner Add Comment.aspx");
        }

        protected void grade_E_Click(object sender, EventArgs e)
        {
            Response.Redirect("Examiner Add Grade.aspx");
        }

        protected void search_E_Click(object sender, EventArgs e)
        {
            Response.Redirect("Examiner Search Thesis.aspx");
        }
    }
}