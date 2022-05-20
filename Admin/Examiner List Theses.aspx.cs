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
    public partial class Examiner_List_Theses : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            String examinerID = Session["user"].ToString();

            SqlCommand ExamSupDefense = new SqlCommand("ExamSupDefense", conn);
            ExamSupDefense.CommandType = CommandType.StoredProcedure;

            ExamSupDefense.Parameters.Add(new SqlParameter("@examinerID", SqlDbType.BigInt)).Value = Int16.Parse(examinerID);

            conn.Open();
            ExamSupDefense.ExecuteNonQuery();
            SqlDataReader rdr = ExamSupDefense.ExecuteReader(CommandBehavior.CloseConnection);



            while (rdr.Read())
            {
                TableRow t = new TableRow();
                Table1.Rows.Add(t);


                String thesisTitle = rdr.GetString(rdr.GetOrdinal("title"));
                Label detail0 = new Label();
                detail0.Text = thesisTitle;
                TableCell c0 = new TableCell();
                c0.Controls.Add(detail0);
                t.Cells.Add(c0);

                String firstName = rdr.GetString(rdr.GetOrdinal("firstName"));
                Label detail1 = new Label();
                detail1.Text = firstName;
                TableCell c1 = new TableCell();
                c1.Controls.Add(detail1);
                t.Cells.Add(c1);

                String lastName = rdr.GetString(rdr.GetOrdinal("lastName"));
                Label detail2 = new Label();
                detail2.Text = lastName;
                TableCell c2 = new TableCell();
                c2.Controls.Add(detail2);
                t.Cells.Add(c2);

                String supName = rdr.GetString(rdr.GetOrdinal("name"));
                Label detail3 = new Label();
                detail3.Text = supName;
                TableCell c3 = new TableCell();
                c3.Controls.Add(detail3);
                t.Cells.Add(c3);
            }
        }
    }
}