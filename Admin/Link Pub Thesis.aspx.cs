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
    public partial class Link_Pub_Thesis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //@PubID int, @thesisSerialNo int

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();

            SqlConnection conn = new SqlConnection(connStr);


            if ((string.IsNullOrEmpty(pubID.Text)) || (string.IsNullOrEmpty(thesisSerialNo.Text)))

            {
                Response.Write("<script type=\"text/javascript\">alert('Please fill all fields.');</script>");


            }
            else
            {

                try
                {


                    int PublicationID = Convert.ToInt32(pubID.Text);
                    int ThesisSerialNo = Convert.ToInt32(thesisSerialNo.Text);


                    SqlCommand linkPubThesis = new SqlCommand("linkPubThesis", conn);
                    linkPubThesis.CommandType = CommandType.StoredProcedure;


                    linkPubThesis.Parameters.Add(new SqlParameter("@PubID", SqlDbType.Int)).Value = PublicationID;
                    linkPubThesis.Parameters.Add(new SqlParameter("@ThesisSerialNo", SqlDbType.Int)).Value = ThesisSerialNo;

                    conn.Open();
                    linkPubThesis.ExecuteNonQuery();
                    Response.Write("<script type=\"text/javascript\">alert('Thesis linked successfulyy');</script>");
                    conn.Close();
                }
                catch(SqlException sq)
                {
                    Response.Write("<script type=\"text/javascript\">alert('Thesis is already linked.');</script>");

                }
                catch(Exception ex)
                {
                    Response.Write("<script type=\"text/javascript\">alert('One of the entered inputs was in incorrect format. Please Try again!');</script>");

                }
            }
        }

    }
}