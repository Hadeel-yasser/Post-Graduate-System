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
    public partial class Student_Register_Thesis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            String student_ID = Session["user"].ToString();



            try
            {
                int supervisor_ID = Convert.ToInt32(superVisorID.Text);
                String Field = field.Text;
                String Type = type.Text;
                String Title = title.Text;

                DateTime StartDate = Convert.ToDateTime(startDate.Text);
                DateTime EndDate = Convert.ToDateTime(endDate.Text);
                int extensions = Convert.ToInt32(noOfExtensions.Text);


                SqlCommand StudentRegisterThesis = new SqlCommand("StudentRegisterThesis", conn);
                StudentRegisterThesis.CommandType = CommandType.StoredProcedure;


                StudentRegisterThesis.Parameters.Add(new SqlParameter("@studentID", SqlDbType.Int)).Value = Int16.Parse(student_ID); ;
                StudentRegisterThesis.Parameters.Add(new SqlParameter("@superID", SqlDbType.Int)).Value = supervisor_ID;
                StudentRegisterThesis.Parameters.Add(new SqlParameter("@field", SqlDbType.VarChar)).Value = Field;
                StudentRegisterThesis.Parameters.Add(new SqlParameter("@type", SqlDbType.VarChar)).Value = Type;
                StudentRegisterThesis.Parameters.Add(new SqlParameter("@title", SqlDbType.VarChar)).Value = Title;
                StudentRegisterThesis.Parameters.Add(new SqlParameter("@startDate", SqlDbType.DateTime)).Value = StartDate;
                StudentRegisterThesis.Parameters.Add(new SqlParameter("@endDate", SqlDbType.DateTime)).Value = EndDate;
                StudentRegisterThesis.Parameters.Add(new SqlParameter("@noOfExtensions", SqlDbType.Int)).Value = extensions;


                conn.Open();
                StudentRegisterThesis.ExecuteNonQuery();
                Response.Write("bl tawfiq fl thesis");
                conn.Close();
            }
            catch (Exception w)
            {
                Response.Write("<script type=\"text/javascript\">alert('Data entered is incorrect. Try again please');</script>");

            }

        }
    }
}