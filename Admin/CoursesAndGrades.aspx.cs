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
    public partial class CoursesAndGrades : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            String ID = Session["user"].ToString();

            SqlCommand ViewCoursesGrades = new SqlCommand("ViewCoursesGrades", conn);
            ViewCoursesGrades.CommandType = CommandType.StoredProcedure;

            ViewCoursesGrades.Parameters.Add(new SqlParameter("@studentID", SqlDbType.BigInt)).Value = Int16.Parse(ID);

            conn.Open();
            ViewCoursesGrades.ExecuteNonQuery();
            SqlDataReader rdr = ViewCoursesGrades.ExecuteReader(CommandBehavior.CloseConnection);

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

                int fees = rdr.GetInt32(rdr.GetOrdinal("fees"));
                Label detail2 = new Label();
                detail2.Text = fees.ToString();
                TableCell c2 = new TableCell();
                c2.Controls.Add(detail2);
                t.Cells.Add(c2);

                int creditHours = rdr.GetInt32(rdr.GetOrdinal("creditHours"));
                Label detail3 = new Label();
                detail3.Text = creditHours.ToString();
                TableCell c3 = new TableCell();
                c3.Controls.Add(detail3);
                t.Cells.Add(c3);

                String code = rdr.GetString(rdr.GetOrdinal("code"));
                Label detail4 = new Label();
                detail4.Text = code.ToString();
                TableCell c4 = new TableCell();
                c4.Controls.Add(detail4);
                t.Cells.Add(c4);


                int colIndex0 = rdr.GetOrdinal("grade");
                if (!rdr.IsDBNull(colIndex0))
                {

                    decimal grade1 = rdr.GetDecimal(rdr.GetOrdinal("grade"));
                    Label detail5 = new Label();
                    detail5.Text = grade1.ToString();
                    TableCell c5 = new TableCell();
                    c5.Controls.Add(detail5);
                    t.Cells.Add(c5);
                }
                else
                {
                    TableCell emp = new TableCell();
                    t.Cells.Add(emp);
                }
            }
            conn.Close();
        
        }

        
    }
}