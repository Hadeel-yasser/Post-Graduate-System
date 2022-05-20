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
    public partial class Supervisor_View_Publications : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            if(string.IsNullOrEmpty(studentID.Text))
            {
                Response.Write("<script type=\"text/javascript\">alert('Please fill all fields.');</script>");

            }
            else
            {
                try
                {
                    int ID = Convert.ToInt32(studentID.Text);


                    SqlCommand ViewAStudentPublications = new SqlCommand("ViewAStudentPublications", conn);
                    ViewAStudentPublications.CommandType = CommandType.StoredProcedure;

                    ViewAStudentPublications.Parameters.Add(new SqlParameter("@StudentID", SqlDbType.BigInt)).Value = ID;

                    conn.Open();
                    ViewAStudentPublications.ExecuteNonQuery();
                    SqlDataReader rdr = ViewAStudentPublications.ExecuteReader(CommandBehavior.CloseConnection);

                    while (rdr.Read())
                    {

                        TableRow t = new TableRow();
                        Table1.Rows.Add(t);

                        int id = rdr.GetInt32(rdr.GetOrdinal("id"));
                        Label detail1 = new Label();
                        detail1.Text = id.ToString();
                        TableCell c1 = new TableCell();
                        c1.Controls.Add(detail1);
                        t.Cells.Add(c1);

                        String title = rdr.GetString(rdr.GetOrdinal("title"));
                        Label detail2 = new Label();
                        detail2.Text = title;
                        TableCell c2 = new TableCell();
                        c2.Controls.Add(detail2);
                        t.Cells.Add(c2);

                        DateTime dateOfPublication = rdr.GetDateTime(rdr.GetOrdinal("dateOfPublication"));
                        Label detail3 = new Label();
                        detail3.Text = dateOfPublication.ToString();
                        TableCell c3 = new TableCell();
                        c3.Controls.Add(detail3);
                        t.Cells.Add(c3);

                        String place = rdr.GetString(rdr.GetOrdinal("place"));
                        Label detail4 = new Label();
                        detail4.Text = place;
                        TableCell c4 = new TableCell();
                        c4.Controls.Add(detail4);
                        t.Cells.Add(c4);

                        bool accepted = rdr.GetBoolean(rdr.GetOrdinal("accepted"));
                        Label detail5 = new Label();
                        detail5.Text = accepted.ToString();
                        TableCell c5 = new TableCell();
                        c5.Controls.Add(detail5);
                        t.Cells.Add(c5);

                        String Host = rdr.GetString(rdr.GetOrdinal("host"));
                        Label detail6 = new Label();
                        detail6.Text = Host;
                        TableCell c6 = new TableCell();
                        c6.Controls.Add(detail6);
                        t.Cells.Add(c6);

                    }
                    conn.Close();
                }
                catch(Exception ex)
                {
                    Response.Write("<script type=\"text/javascript\">alert('Invalid Input. Please try again!');</script>");
                }
            }
            
        }
    }
}