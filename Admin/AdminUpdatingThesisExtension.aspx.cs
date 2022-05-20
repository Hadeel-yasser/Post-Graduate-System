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
    public partial class AdminUpdatingThesisExtension : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


            protected void Button1_Click(object sender, EventArgs e)

            {
            {
                String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();

                SqlConnection conn = new SqlConnection(connStr);

                String thesisSerialNo = ThesisSerialNumber.Text;

                SqlCommand AdminUpdateExtension = new SqlCommand("AdminUpdateExtension", conn);
                AdminUpdateExtension.CommandType = CommandType.StoredProcedure;

                AdminUpdateExtension.Parameters.Add(new SqlParameter("@ThesisSerialNo", SqlDbType.Int)).Value = thesisSerialNo;
                conn.Open();
                AdminUpdateExtension.ExecuteNonQuery();
                Response.Write("<script type=\"text/javascript\">alert('Thesis extension has been updated');</script>");

                conn.Close();
            }

        }

        }
}