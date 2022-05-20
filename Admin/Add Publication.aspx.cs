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
    public partial class Add_Publication : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();

            SqlConnection conn = new SqlConnection(connStr);


            if ((string.IsNullOrEmpty(title.Text)) || (string.IsNullOrEmpty(pub_date.Text)) || (string.IsNullOrEmpty(host.Text)) || (string.IsNullOrEmpty(place.Text)) || ((Yes.Checked == false) && (No.Checked == false)))

            {
                Response.Write("<script type=\"text/javascript\">alert('Please fill all fields');</script>");
                Yes.Checked = false;
                No.Checked = false;

            }
            else
            {
                try
                {
                    String Title = title.Text;
                    DateTime PublicationDate = Convert.ToDateTime(pub_date.Text);
                    String Host = host.Text;
                    String Place = place.Text;


                    bool value = false;
                    bool isChecked = Yes.Checked;
                    if (isChecked)
                        value = true;
                    else
                        value = false;


                    SqlCommand addPublication = new SqlCommand("addPublication", conn);
                    addPublication.CommandType = CommandType.StoredProcedure;


                    addPublication.Parameters.Add(new SqlParameter("@title", SqlDbType.VarChar)).Value = Title;
                    addPublication.Parameters.Add(new SqlParameter("@pubDate", SqlDbType.DateTime)).Value = PublicationDate;
                    addPublication.Parameters.Add(new SqlParameter("@host", SqlDbType.VarChar)).Value = Host;
                    addPublication.Parameters.Add(new SqlParameter("@place", SqlDbType.VarChar)).Value = Place;
                    addPublication.Parameters.Add(new SqlParameter("@Accepted", SqlDbType.Bit)).Value = value;



                    conn.Open();
                    addPublication.ExecuteNonQuery();
                    Response.Write("Added succesfully");
                    conn.Close();
                }
                catch(Exception ex)
                {
                    Response.Write("<script type=\"text/javascript\">alert('Incorrect data format.');</script>");
                }
            }
            
        }
    }
}