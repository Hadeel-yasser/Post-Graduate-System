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
    public partial class Link_Course_Student : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            try
            {
                int courseID = Convert.ToInt32(TextBox2.Text);
                int studentID = Convert.ToInt32(TextBox1.Text);

                SqlCommand linkCourseStudent = new SqlCommand("linkCourseStudent", conn);
                linkCourseStudent.CommandType = CommandType.StoredProcedure;


                linkCourseStudent.Parameters.Add(new SqlParameter("@courseID", SqlDbType.Int)).Value = courseID;
                linkCourseStudent.Parameters.Add(new SqlParameter("@studentID", SqlDbType.Int)).Value = studentID;


                conn.Open();
                linkCourseStudent.ExecuteNonQuery();
                Response.Write("Linked Successfully");
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script type=\"text/javascript\">alert('Incorrect inputs. Please try again!');</script>");

            }
        }
    }
}