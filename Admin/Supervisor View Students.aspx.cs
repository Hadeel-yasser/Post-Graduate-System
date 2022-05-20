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
    public partial class Supervisor_View_Students : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            String ID = Session["user"].ToString();


            SqlCommand ViewSupStudentsYears = new SqlCommand("ViewSupStudentsYears", conn);
            ViewSupStudentsYears.CommandType = CommandType.StoredProcedure;

            ViewSupStudentsYears.Parameters.Add(new SqlParameter("@supervisorID", SqlDbType.BigInt)).Value = Int16.Parse(ID);

            conn.Open();
            ViewSupStudentsYears.ExecuteNonQuery();
            SqlDataReader rdr = ViewSupStudentsYears.ExecuteReader(CommandBehavior.CloseConnection);

            while (rdr.Read())
            {
                
                TableRow t = new TableRow();
                Table1.Rows.Add(t);

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

                int years = rdr.GetInt32(rdr.GetOrdinal("years"));
                Label detail3 = new Label();
                detail3.Text = years.ToString();
                TableCell c3 = new TableCell();
                c3.Controls.Add(detail3);
                t.Cells.Add(c3);

            }
            conn.Close();
        }
    }
}