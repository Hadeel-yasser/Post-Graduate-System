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
    public partial class Cancel_Thesis : System.Web.UI.Page
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


                int serialNo = Convert.ToInt32(serialNumber.Text);


                SqlCommand CancelThesis = new SqlCommand("CancelThesis", conn);
                CancelThesis.CommandType = CommandType.StoredProcedure;


                CancelThesis.Parameters.Add(new SqlParameter("@ThesisSerialNo", SqlDbType.Int)).Value = serialNo;


                SqlParameter success = CancelThesis.Parameters.Add("@success", SqlDbType.Bit);
                success.Direction = ParameterDirection.Output;

                conn.Open();
                CancelThesis.ExecuteNonQuery();

                //Response.Write(success.Value.ToString());

                if(success.Value.ToString()=="False")
                {
                    Response.Write("Thesis isn't cancelled");
                    Response.Write("<script type=\"text/javascript\">alert('Thesis isn't cancelled');</script>");

                }

                else
                {
                    Response.Write("Thesis is cancelled");

                    Response.Write("<script type=\"text/javascript\">alert('Thesis is cancelled');</script>");

                }


                conn.Close();
            }
            catch(Exception ex)
            {
                Response.Write("<script type=\"text/javascript\">alert('Incorrect data format.');</script>");
            }
        }
    }
}