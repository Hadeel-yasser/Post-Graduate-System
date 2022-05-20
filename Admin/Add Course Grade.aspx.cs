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
    public partial class Add_Course_Grade : System.Web.UI.Page
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
                int courseID = Convert.ToInt32(Course.Text);
                int studentID = Convert.ToInt32(student.Text);
                decimal grade1 = Convert.ToDecimal(grade.Text);

                SqlCommand addStudentCourseGrade = new SqlCommand("addStudentCourseGrade", conn);
                addStudentCourseGrade.CommandType = CommandType.StoredProcedure;


                addStudentCourseGrade.Parameters.Add(new SqlParameter("@courseID", SqlDbType.Int)).Value = courseID;
                addStudentCourseGrade.Parameters.Add(new SqlParameter("@studentID", SqlDbType.Int)).Value = studentID;
                addStudentCourseGrade.Parameters.Add(new SqlParameter("@grade", SqlDbType.Decimal)).Value = grade1;


                conn.Open();
                addStudentCourseGrade.ExecuteNonQuery();
                Response.Write("Grade Added Successfully");
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write("<script type=\"text/javascript\">alert('Incorrect inputs. Please try again!');</script>");

            }
        }
    }
}