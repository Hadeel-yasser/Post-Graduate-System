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
    public partial class Supervisor_Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            if ((string.IsNullOrEmpty(First_Name_S.Text)) || (string.IsNullOrEmpty(Last_Name_S.Text)) || (string.IsNullOrEmpty(Password_S.Text)) || (string.IsNullOrEmpty(Faculty_S.Text)) || (string.IsNullOrEmpty(Email_S.Text)))

            {
                Response.Write("<script type=\"text/javascript\">alert('Please fill all fields');</script>");

            }
            else
            {
                try
                {

                    String firstName = First_Name_S.Text;
                    String LastName = Last_Name_S.Text;
                    String Pass = Password_S.Text;
                    String faculty = Faculty_S.Text;
                    String email = Email_S.Text;


                    SqlCommand supervisorRegister = new SqlCommand("supervisorRegister", conn);
                    supervisorRegister.CommandType = CommandType.StoredProcedure;


                    supervisorRegister.Parameters.Add(new SqlParameter("@first_name", SqlDbType.VarChar)).Value = firstName;
                    supervisorRegister.Parameters.Add(new SqlParameter("@last_name", SqlDbType.VarChar)).Value = LastName;
                    supervisorRegister.Parameters.Add(new SqlParameter("@password", SqlDbType.VarChar)).Value = Pass;
                    supervisorRegister.Parameters.Add(new SqlParameter("@faculty", SqlDbType.VarChar)).Value = faculty;
                    supervisorRegister.Parameters.Add(new SqlParameter("@email", SqlDbType.VarChar)).Value = email;


                    SqlParameter ID = supervisorRegister.Parameters.Add("@id", SqlDbType.Int);
                    ID.Direction = System.Data.ParameterDirection.Output;


                    conn.Open();
                    supervisorRegister.ExecuteNonQuery();

                    Session["user"] = ID.Value.ToString();
                    Response.Redirect("Login1.aspx");
                    conn.Close();
                }
                catch (Exception ex)
                {
                    Response.Write("<script type=\"text/javascript\">alert('Invalid input. Please try again');</script>");
                }
            }

        }
    }
}