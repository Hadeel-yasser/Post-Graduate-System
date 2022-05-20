using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin
{
    public partial class View_Student_Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            String ID = Session["user"].ToString();

            SqlCommand ViewProc = new SqlCommand("viewMyProfile", conn);
            ViewProc.CommandType = CommandType.StoredProcedure;

            ViewProc.Parameters.Add(new SqlParameter("@studentId", SqlDbType.BigInt)).Value = Int16.Parse(ID);

            conn.Open();
            ViewProc.ExecuteNonQuery();
            SqlDataReader rdr = ViewProc.ExecuteReader(CommandBehavior.CloseConnection);
       


            while (rdr.Read())
            {
                TableRow t = new TableRow();
                Table1.Rows.Add(t);


                int id = rdr.GetInt32(rdr.GetOrdinal("id"));
                Label detail8 = new Label();
                detail8.Text = id.ToString();
                TableCell c8 = new TableCell();
                c8.Controls.Add(detail8);
                t.Cells.Add(c8);

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

                

                int colIndex = rdr.GetOrdinal("type");
                if (!rdr.IsDBNull(colIndex))
                {
                    String type = rdr.GetString(rdr.GetOrdinal("type"));
                    Label detail3 = new Label();
                    detail3.Text = type;
                    TableCell c3 = new TableCell();
                    c3.Controls.Add(detail3);
                    t.Cells.Add(c3);
                }
                else
                {
                    TableCell emp = new TableCell();
                    t.Cells.Add(emp);
                }

                String faculty = rdr.GetString(rdr.GetOrdinal("faculty"));
                Label detail4 = new Label();
                detail4.Text = faculty;
                TableCell c4 = new TableCell();
                c4.Controls.Add(detail4);
                t.Cells.Add(c4);



                String address = rdr.GetString(rdr.GetOrdinal("address"));
                Label detail5 = new Label();
                detail5.Text = address;
                TableCell c5 = new TableCell();
                c5.Controls.Add(detail5);
                t.Cells.Add(c5);


                int colIndex1 = rdr.GetOrdinal("GPA");
                if (!rdr.IsDBNull(colIndex1))
                {
                    decimal GPA = rdr.GetDecimal(rdr.GetOrdinal("GPA"));
                    Label detail6 = new Label();
                    detail6.Text = GPA.ToString();
                    TableCell c6 = new TableCell();
                    c6.Controls.Add(detail6);
                    t.Cells.Add(c6);

                }
                else
                {
                    TableCell emp = new TableCell();
                    t.Cells.Add(emp);
                }


                try
                {
                    if (rdr.GetOrdinal("undergradID") >= 0)
                    {
                        int colIndex2 = rdr.GetOrdinal("undergradID");
                        if (!rdr.IsDBNull(colIndex2))
                        {
                            int undergradID = rdr.GetInt32(rdr.GetOrdinal("undergradID"));
                            Label detail7 = new Label();
                            detail7.Text = undergradID.ToString();
                            TableCell c7 = new TableCell();
                            c7.Controls.Add(detail7);
                            t.Cells.Add(c7);
                            

                        }
                        else
                        {
                            TableCell emp = new TableCell();
                            t.Cells.Add(emp);
                        }

                    }
                }

                catch (IndexOutOfRangeException)
                {
                    Label detail9 = new Label();
                    detail9.Text = "no ID";
                    TableCell c9 = new TableCell();
                    c9.Controls.Add(detail9);
                    t.Cells.Add(c9);
                }

                String email = rdr.GetString(rdr.GetOrdinal("email"));
                Label detail10 = new Label();
                detail10.Text = email;
                TableCell c10 = new TableCell();
                c10.Controls.Add(detail10);
                t.Cells.Add(c10);


            }
            conn.Close();
        }
    }

        
 }
