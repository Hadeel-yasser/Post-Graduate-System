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
    public partial class Examiner_Update_Information : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void update_Name_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Name_E.Text))
            {
                Response.Write("<script type=\"text/javascript\">alert('Please make sure you have entered the correct data');</script>");

            }
            else
            {
                try
                {
                    String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
                    SqlConnection conn = new SqlConnection(connStr);

                    String examiner_ID = Session["user"].ToString();
                    String examName = Name_E.Text;



                    SqlCommand UpdateExaminerName = new SqlCommand("UpdateExaminerName", conn);
                    UpdateExaminerName.CommandType = CommandType.StoredProcedure;


                    UpdateExaminerName.Parameters.Add(new SqlParameter("@name", SqlDbType.VarChar)).Value = examName;
                    UpdateExaminerName.Parameters.Add(new SqlParameter("@ExaminerID", SqlDbType.Int)).Value = Int16.Parse(examiner_ID);

                    conn.Open();
                    UpdateExaminerName.ExecuteNonQuery();


                    Response.Write("<script type=\"text/javascript\">alert('Your data has been updated');</script>");


                    conn.Close();
                }
                catch (Exception ex)
                {
                    Response.Write("<script type=\"text/javascript\">alert('Entered data was in incorrect format. Please try again');</script>");
                }
            }
        }


        protected void updateWork_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(F_work.Text))
            {
                Response.Write("<script type=\"text/javascript\">alert('Please make sure you have entered the correct data');</script>");
            }
            else
            {
                try
                {
                    String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
                    SqlConnection conn = new SqlConnection(connStr);

                    String examiner_ID = Session["user"].ToString();
                    String fieldWork = F_work.Text;


                    SqlCommand UpdateExaminerField = new SqlCommand("UpdateExaminerField", conn);
                    UpdateExaminerField.CommandType = CommandType.StoredProcedure;


                    UpdateExaminerField.Parameters.Add(new SqlParameter("@fieldOfWork ", SqlDbType.VarChar)).Value = fieldWork;
                    UpdateExaminerField.Parameters.Add(new SqlParameter("@ExaminerID", SqlDbType.Int)).Value = Int16.Parse(examiner_ID);

                    conn.Open();
                    UpdateExaminerField.ExecuteNonQuery();


                    Response.Write("<script type=\"text/javascript\">alert('Your data has been updated');</script>");


                    conn.Close();


                }
                catch (Exception ex)
                {
                    Response.Write("<script type=\"text/javascript\">alert('Entered data was in incorrect format. Please try again');</script>");

                }
            }
        }
    }
}