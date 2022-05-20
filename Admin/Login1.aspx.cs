using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace Admin
{
    public partial class test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Login_Click(object sender, EventArgs e)
        {
            
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            String email = email_L.Text;
            String pass = password_L.Text;


            SqlCommand loginProc = new SqlCommand("userLogin", conn);
            loginProc.CommandType = CommandType.StoredProcedure;

            loginProc.Parameters.Add(new SqlParameter("@email", SqlDbType.VarChar)).Value = email;
            loginProc.Parameters.Add(new SqlParameter("@password", SqlDbType.VarChar)).Value = pass;


            SqlParameter success = loginProc.Parameters.Add("@success", SqlDbType.Bit);
            success.Direction = System.Data.ParameterDirection.Output;

            SqlParameter ID = loginProc.Parameters.Add("@id", SqlDbType.Int);
            ID.Direction = System.Data.ParameterDirection.Output;

            SqlParameter type = loginProc.Parameters.Add("@type", SqlDbType.Int);
            type.Direction = System.Data.ParameterDirection.Output;

            SqlParameter gucian = loginProc.Parameters.Add("@Gucian", SqlDbType.Int);
            gucian.Direction = System.Data.ParameterDirection.Output;

            conn.Open();
            loginProc.ExecuteNonQuery();
            conn.Close();

            if (success.Value.ToString() == "True")
            {
               if(type.Value.ToString()=="0")
                {
                    Session["user"] = ID.Value.ToString();
                    Session["gucian"] = gucian.Value.ToString();
                    Response.Write("Mabrook el website ya student");
                    Response.Redirect("Student.aspx");
                }
               else if(type.Value.ToString() == "1")
                {
                    Session["user"] = ID.Value.ToString();
                    Response.Write("Mabrook el website ya admin");
                    Response.Redirect("Admin1.aspx");
                }
               else if (type.Value.ToString() == "2")
                {
                    Session["user"] = ID.Value.ToString();
                    Response.Write("Mabrook el website ya supervisor");
                    Response.Redirect("Supervisor.aspx");
                }
               else
                {
                    Session["user"] = ID.Value.ToString();
                    Response.Write("Mabrook el website ya examiner");
                    Response.Redirect("Examiner.aspx");

                }

            }
            else
            {
                Response.Write("<script type=\"text/javascript\">alert('Email or Password Entered Is Incorrect. Try again please');</script>");

            }

        }

        protected void btn_cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login1.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}