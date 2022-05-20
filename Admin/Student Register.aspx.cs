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
    public partial class Student_Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();

            SqlConnection conn = new SqlConnection(connStr);


            if ((string.IsNullOrEmpty(First_Name.Text)) || (string.IsNullOrEmpty(Last_Name.Text)) || (string.IsNullOrEmpty(Password.Text)) || (string.IsNullOrEmpty(Faculty.Text)) ||  (string.IsNullOrEmpty(Email.Text)) || (string.IsNullOrEmpty(Address.Text)) || ((Gucian.Checked == false) && (Non_Gucian.Checked == false)))

            {
                Response.Write("<script type=\"text/javascript\">alert('Please fill all fields');</script>");
                Gucian.Checked = false;
                Non_Gucian.Checked = false;

            }

            else
            {

                try
                {




                    String firstName = First_Name.Text;
                    String LastName = Last_Name.Text;
                    String Pass = Password.Text;
                    String faculty = Faculty.Text;
                    String email = Email.Text;
                    String address = Address.Text;

                    bool value = false;
                    bool isChecked = Gucian.Checked;
                    if (isChecked)
                        value = true;
                    else
                        value = false;


                    SqlCommand studentRegister = new SqlCommand("studentRegister", conn);
                    studentRegister.CommandType = CommandType.StoredProcedure;


                    studentRegister.Parameters.Add(new SqlParameter("@first_name", SqlDbType.VarChar)).Value = firstName;
                    studentRegister.Parameters.Add(new SqlParameter("@last_name", SqlDbType.VarChar)).Value = LastName;
                    studentRegister.Parameters.Add(new SqlParameter("@Gucian", SqlDbType.Bit)).Value = value;
                    studentRegister.Parameters.Add(new SqlParameter("@password", SqlDbType.VarChar)).Value = Pass;
                    studentRegister.Parameters.Add(new SqlParameter("@faculty", SqlDbType.VarChar)).Value = faculty;
                    studentRegister.Parameters.Add(new SqlParameter("@email", SqlDbType.VarChar)).Value = email;
                    studentRegister.Parameters.Add(new SqlParameter("@address", SqlDbType.VarChar)).Value = address;


                    SqlParameter ID = studentRegister.Parameters.Add("@id", SqlDbType.Int);
                    ID.Direction = System.Data.ParameterDirection.Output;




                    conn.Open();
                    studentRegister.ExecuteNonQuery();
                    Session["user"] = ID.Value.ToString();
                    Response.Redirect("Login1.aspx");
                    conn.Close();
                }
                catch(Exception ex)
                {
                    Response.Write("<script type=\"text/javascript\">alert('Invalid input. Please try again');</script>");

                }

            }
        }

    }
}