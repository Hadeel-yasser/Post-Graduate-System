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
    public partial class Admin_Add_Courses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            if ((string.IsNullOrEmpty(TextBox1.Text)) || (string.IsNullOrEmpty(TextBox2.Text)) || (string.IsNullOrEmpty(TextBox3.Text)))

            {
                Response.Write("<script type=\"text/javascript\">alert('Please fill all fields.');</script>");


            }
            else
            {



                try
                {
                    String courseCode = TextBox1.Text;
                    int creditHours = Convert.ToInt32(TextBox2.Text);
                    decimal fees = Convert.ToDecimal(TextBox3.Text);

                    SqlCommand AddCourse = new SqlCommand("AddCourse", conn);
                    AddCourse.CommandType = CommandType.StoredProcedure;


                    AddCourse.Parameters.Add(new SqlParameter("@courseCode", SqlDbType.VarChar)).Value = courseCode;
                    AddCourse.Parameters.Add(new SqlParameter("@creditHrs", SqlDbType.Int)).Value = creditHours;
                    AddCourse.Parameters.Add(new SqlParameter("@fees", SqlDbType.Decimal)).Value = fees;


                    conn.Open();
                    AddCourse.ExecuteNonQuery();
                    Response.Write("Added Successfully");
                    conn.Close();
                }

                catch (Exception ex)
                {
                    Response.Write("<script type=\"text/javascript\">alert('Incorrect inputs. Please try again!');</script>");

                }
            }



        }
    }
}