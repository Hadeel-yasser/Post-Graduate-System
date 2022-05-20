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
    public partial class Admin1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand AdminListSup = new SqlCommand("AdminListSup", conn);
            AdminListSup.CommandType = CommandType.StoredProcedure;
            conn.Open();
            AdminListSup.ExecuteNonQuery();
            SqlDataReader rdr = AdminListSup.ExecuteReader(CommandBehavior.CloseConnection);

            Table1.Visible = false;

            while (rdr.Read())
            {
                TableRow t = new TableRow();
                Table2.Visible = true;
                Table2.Rows.Add(t);

                int ID = rdr.GetInt32(rdr.GetOrdinal("id"));
                Label detail0 = new Label();
                detail0.Text = ID.ToString();
                TableCell c1 = new TableCell();
                c1.Controls.Add(detail0);
                t.Cells.Add(c1);

                String name = rdr.GetString(rdr.GetOrdinal("name"));
                Label detail1 = new Label();
                detail1.Text = name;
                TableCell c2 = new TableCell();
                c2.Controls.Add(detail1);
                t.Cells.Add(c2);

                String faculty = rdr.GetString(rdr.GetOrdinal("faculty"));
                Label detail2 = new Label();
                detail2.Text = faculty;
                TableCell c3 = new TableCell();
                c3.Controls.Add(detail2);
                t.Cells.Add(c3);


            }
          

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Table2.Visible = false;
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand AdminViewAllTheses = new SqlCommand("AdminViewAllTheses", conn);
            AdminViewAllTheses.CommandType = CommandType.StoredProcedure;
            conn.Open();
            AdminViewAllTheses.ExecuteNonQuery();
            SqlDataReader rdr = AdminViewAllTheses.ExecuteReader(CommandBehavior.CloseConnection);


            while (rdr.Read())
            {
                TableRow t = new TableRow();
                Table1.Visible = true;
                Table1.Rows.Add(t);

                int SerialNumber = rdr.GetInt32(rdr.GetOrdinal("serialNumber"));
                Label detail0 = new Label();
                detail0.Text = SerialNumber.ToString();
                TableCell c1 = new TableCell();
                c1.Controls.Add(detail0);
                t.Cells.Add(c1);

                String field = rdr.GetString(rdr.GetOrdinal("field"));
                Label detail1 = new Label();
                detail1.Text = field;
                TableCell c2 = new TableCell();
                c2.Controls.Add(detail1);
                t.Cells.Add(c2);

                String type = rdr.GetString(rdr.GetOrdinal("type"));
                Label detail2 = new Label();
                detail2.Text = type;
                TableCell c3 = new TableCell();
                c3.Controls.Add(detail2);
                t.Cells.Add(c3);

                String title = rdr.GetString(rdr.GetOrdinal("title"));
                Label detail3 = new Label();
                detail3.Text = title;
                TableCell c4 = new TableCell();
                c4.Controls.Add(detail3);
                t.Cells.Add(c4);

                DateTime startDate = rdr.GetDateTime(rdr.GetOrdinal("startDate"));
                Label detail4 = new Label();
                detail4.Text = startDate.ToString();
                TableCell c5 = new TableCell();
                c5.Controls.Add(detail4);
                t.Cells.Add(c5);

                DateTime endDate = rdr.GetDateTime(rdr.GetOrdinal("endDate"));
                Label detail5 = new Label();
                detail5.Text = endDate.ToString();
                TableCell c6 = new TableCell();
                c6.Controls.Add(detail5);
                t.Cells.Add(c6);


                int colIndex0 = rdr.GetOrdinal("defenseDate");
                if (!rdr.IsDBNull(colIndex0))
                {
                    DateTime defenseDate = rdr.GetDateTime(rdr.GetOrdinal("defenseDate"));
                    Label detail11 = new Label();
                    detail11.Text = defenseDate.ToString();
                    TableCell c11 = new TableCell();
                    c11.Controls.Add(detail11);
                    t.Cells.Add(c11);
                }

                else
                {
                    TableCell emp = new TableCell();
                    t.Cells.Add(emp);
                }

                int colIndex1 = rdr.GetOrdinal("years");
                if (!rdr.IsDBNull(colIndex1))
                {
                    int years = rdr.GetInt32(rdr.GetOrdinal("years"));
                    Label detail6 = new Label();
                    detail6.Text = years.ToString();
                    TableCell c7 = new TableCell();
                    c7.Controls.Add(detail6);
                    t.Cells.Add(c7);

                }
                else
                {
                    TableCell emp = new TableCell();
                    t.Cells.Add(emp);
                }

                int colIndex2 = rdr.GetOrdinal("grade");
                if (!rdr.IsDBNull(colIndex2))
                {
                    decimal grade = rdr.GetDecimal(rdr.GetOrdinal("grade"));
                    Label detail7 = new Label();
                    detail7.Text = grade.ToString();
                    TableCell c8 = new TableCell();
                    c8.Controls.Add(detail7);
                    t.Cells.Add(c8);
                }

                else
                {
                    TableCell emp = new TableCell();
                    t.Cells.Add(emp);
                }

                int colIndex3 = rdr.GetOrdinal("payment_id");
                if (!rdr.IsDBNull(colIndex3))
                {
                    int payment_id = rdr.GetInt32(rdr.GetOrdinal("payment_id"));
                    Label detail8 = new Label();
                    detail8.Text = payment_id.ToString();
                    TableCell c9 = new TableCell();
                    c9.Controls.Add(detail8);
                    t.Cells.Add(c9);

                }
                else
                {
                    TableCell emp = new TableCell();
                    t.Cells.Add(emp);
                }

                int noOfExtensions = rdr.GetInt32(rdr.GetOrdinal("noOfExtensions"));
                Label detail9 = new Label();
                detail9.Text = noOfExtensions.ToString();
                TableCell c10 = new TableCell();
                c10.Controls.Add(detail9);
                t.Cells.Add(c10);


            }
           

        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            Table2.Visible = false; 
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            Table1.Visible = false;


            SqlCommand AdminViewOnGoingTheses = new SqlCommand("AdminViewOnGoingTheses", conn);
            AdminViewOnGoingTheses.CommandType = CommandType.StoredProcedure;

            SqlParameter count = AdminViewOnGoingTheses.Parameters.Add("@thesesCount", SqlDbType.Int);
            count.Direction = ParameterDirection.Output;

            conn.Open();
            AdminViewOnGoingTheses.ExecuteNonQuery();
            Response.Write("Theses Count :" +"  " +count.Value.ToString());
            conn.Close();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
           

            Response.Redirect("AdminIssuingPayment.aspx");
        }
        protected void Button5_Click(object sender, EventArgs e)
        {

            Response.Redirect("AdminIssuingInstallment.aspx");
        }
        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminUpdatingThesisExtension.aspx");
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {

        }

        protected void addCourse_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin Add Courses.aspx");
        }


        protected void linkCourse_Click(object sender, EventArgs e)
        {
            Response.Redirect("Link Course Student.aspx");
        }

        protected void Cours_grade_Click(object sender, EventArgs e)
        {
            Response.Redirect("Add Course Grade.aspx");
        }
    }
}