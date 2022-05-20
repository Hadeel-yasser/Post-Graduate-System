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
    public partial class Examiner_Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //Response.Redirect("Student Register.aspx");
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();

            SqlConnection conn = new SqlConnection(connStr);


            if ((string.IsNullOrEmpty(Full_Name.Text)) || (string.IsNullOrEmpty(F_work.Text)) || (string.IsNullOrEmpty(Password_E.Text)) || (string.IsNullOrEmpty(Email_E.Text)) || ((national.Checked == false) && (international.Checked == false)))

            {
                Response.Write("<script type=\"text/javascript\">alert('Please fill all fields');</script>");
                national.Checked = false;
                international.Checked = false;

            }
            else
            {


                try
                {
                    String fullName = Full_Name.Text;
                    String Pass = Password_E.Text;
                    String fieldWork = F_work.Text;
                    String email = Email_E.Text;


                    bool value = false;
                    bool isChecked = national.Checked;
                    if (isChecked)
                        value = true;
                    else
                        value = false;


                    SqlCommand RegisterExaminer = new SqlCommand("RegisterExaminer", conn);
                    RegisterExaminer.CommandType = CommandType.StoredProcedure;


                    RegisterExaminer.Parameters.Add(new SqlParameter("@ExaminerName", SqlDbType.VarChar)).Value = fullName;
                    RegisterExaminer.Parameters.Add(new SqlParameter("@fieldOfWork", SqlDbType.VarChar)).Value = fieldWork;
                    RegisterExaminer.Parameters.Add(new SqlParameter("@National", SqlDbType.Bit)).Value = value;
                    RegisterExaminer.Parameters.Add(new SqlParameter("@password", SqlDbType.VarChar)).Value = Pass;
                    RegisterExaminer.Parameters.Add(new SqlParameter("@email", SqlDbType.VarChar)).Value = email;


                    SqlParameter ID = RegisterExaminer.Parameters.Add("@examID", SqlDbType.Int);
                    ID.Direction = System.Data.ParameterDirection.Output;


                    conn.Open();
                    RegisterExaminer.ExecuteNonQuery();
                    Session["user"] = ID.Value.ToString();
                    Response.Redirect("Login1.aspx");
                    conn.Close();
                }
                catch (Exception ex1)
                {
                    Response.Write("<script type=\"text/javascript\">alert('Invalid Input. Please Try again!');</script>");

                }
            }
            
            
           

           

        }
    }
}