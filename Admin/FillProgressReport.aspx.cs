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
    public partial class FillProgressReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();

            SqlConnection conn = new SqlConnection(connStr);


            if ((string.IsNullOrEmpty(Thesisserialno.Text)) || (string.IsNullOrEmpty(progressNo.Text)) || (string.IsNullOrEmpty(state.Text)) || (string.IsNullOrEmpty(Description.Text)))

            {
                Response.Write("<script type=\"text/javascript\">alert('Please fill all fields.');</script>");
            }
            else
            {

                try
                {


                    int thesisSerialNo = Convert.ToInt32(Thesisserialno.Text);
                    int progressReportNo = Convert.ToInt32(progressNo.Text);
                    int State = Convert.ToInt32(state.Text);
                    String description = Description.Text;
                    String student_ID = Session["user"].ToString();

                    SqlCommand FillProgressReport = new SqlCommand("FillProgressReport", conn);
                    FillProgressReport.CommandType = CommandType.StoredProcedure;


                    FillProgressReport.Parameters.Add(new SqlParameter("@thesisSerialNo", SqlDbType.Int)).Value = thesisSerialNo;
                    FillProgressReport.Parameters.Add(new SqlParameter("@progressReportNo", SqlDbType.Int)).Value = progressReportNo;
                    FillProgressReport.Parameters.Add(new SqlParameter("@state", SqlDbType.Int)).Value = State;
                    FillProgressReport.Parameters.Add(new SqlParameter("@description", SqlDbType.VarChar)).Value = description;
                    FillProgressReport.Parameters.Add(new SqlParameter("@studentID", SqlDbType.Int)).Value = Int16.Parse(student_ID);

                    SqlParameter success = FillProgressReport.Parameters.Add("@success", SqlDbType.Bit);
                    success.Direction = ParameterDirection.Output;

                    conn.Open();
                    FillProgressReport.ExecuteNonQuery();

                    if(success.Value.ToString()=="True")
                    {
                        Response.Write("<script type=\"text/javascript\">alert('Progress report has been filled');</script>");

                    }
                    else
                    {
                        Response.Write("<script type=\"text/javascript\">alert('Invalid input, progress report wasn't filled. Please try again');</script>");

                    }


                    conn.Close();
                }
                catch (Exception ex)
                {
                    Response.Write("<script type=\"text/javascript\">alert('One of the entered inputs was in incorrect format. Please Try again!');</script>");
                }
            }

        }

    }
}