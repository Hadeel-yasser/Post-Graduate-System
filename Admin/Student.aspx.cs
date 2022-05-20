using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Admin
{
    public partial class Student : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["gucian"].ToString()=="1")
            {
                Button3.Visible = false;
            }
            else
            {
                Button3.Visible = true;
            }
        }
        protected void Button8_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();

            SqlConnection conn = new SqlConnection(connStr);


            String id = Session["user"].ToString();
            String phone = Phone.Text;
            string space = " ";


            SqlCommand addMobile = new SqlCommand("addMobile", conn);
            addMobile.CommandType = CommandType.StoredProcedure;


            addMobile.Parameters.Add(new SqlParameter("@id", SqlDbType.VarChar)).Value = Int16.Parse(id);
            addMobile.Parameters.Add(new SqlParameter("@mobile_number", SqlDbType.VarChar)).Value = phone;

            conn.Open();
            addMobile.ExecuteNonQuery();
            //Response.Redirect("Student.aspx");
            Response.Write("<script type=\"text/javascript\">alert('If you want to add another number, add it in the textbox');</script>");
            Phone.Text=String.Empty;
            conn.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //view my profile
            Response.Redirect("View Student Profile.aspx");

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //list all my thesis
            Response.Redirect("Student View Thesis.aspx");

        }
        
        protected void Button3_Click(object sender, EventArgs e)
        {
            //list all my courses and grades
            Response.Redirect("CoursesAndGrades.aspx"); 
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            //add progress report
            Response.Redirect("AddProgressReport.aspx"); 
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            //fill progress report
            Response.Redirect("FillProgressReport.aspx"); 
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            //Add publication
            Response.Redirect("Add Publication.aspx"); 
        }
        protected void Button7_Click(object sender, EventArgs e)
        {
            //register new thesis button
            Response.Redirect("Student Register Thesis.aspx");
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            //Link publication to my thesis
            Response.Redirect("Link Pub Thesis.aspx"); 
        }
    }
}