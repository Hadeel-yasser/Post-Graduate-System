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
    public partial class AddProgressReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Button1_Click(object sender, EventArgs e)
        {

            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            if ((string.IsNullOrEmpty(Thesisserialno.Text)) || (string.IsNullOrEmpty(Progressno.Text)) || (string.IsNullOrEmpty(ProgressDate.Text)))

            {
                Response.Write("<script type=\"text/javascript\">alert('Please fill all fields.');</script>");


            }
            else
            {

                 try
                 {
                int thesisSerialNo = Convert.ToInt32(Thesisserialno.Text);
                DateTime ProgressreportDate = Convert.ToDateTime(ProgressDate.Text);
                String student_ID = Session["user"].ToString();
                int progressReportNo = Convert.ToInt32(Progressno.Text);


                SqlCommand AddProgressReport = new SqlCommand("AddProgressReport", conn);
                AddProgressReport.CommandType = CommandType.StoredProcedure;


                AddProgressReport.Parameters.Add(new SqlParameter("@thesisSerialNo", SqlDbType.Int)).Value = thesisSerialNo;
                AddProgressReport.Parameters.Add(new SqlParameter("@progressReportDate", SqlDbType.Date)).Value = ProgressreportDate;
                AddProgressReport.Parameters.Add(new SqlParameter("@studentID", SqlDbType.Int)).Value = Int16.Parse(student_ID);
                AddProgressReport.Parameters.Add(new SqlParameter("@progressReportNo", SqlDbType.Int)).Value = progressReportNo;

                SqlParameter success = AddProgressReport.Parameters.Add("@success", SqlDbType.Bit);
                success.Direction = ParameterDirection.Output;

                conn.Open();
                AddProgressReport.ExecuteNonQuery();
                    if(success.Value.ToString()== "True")
                    {
                        Response.Write("<script type=\"text/javascript\">alert('Progress report has been added');</script>");
                    }
                    else
                    {
                        Response.Write("<script type=\"text/javascript\">alert('Invalid input, progress report wasn't added. Please try again');</script>");
                    }



                    conn.Close();
                }

                catch(SqlException sq)
                {
                    Response.Write("<script type=\"text/javascript\">alert('Progress report number already exists. Please try again');</script>");

                }
                catch (Exception ex)
                {
                    Response.Write("<script type=\"text/javascript\">alert('One of the entered inputs was in incorrect format. Please Try again!');</script>");

                }
            }

        }
    }
}