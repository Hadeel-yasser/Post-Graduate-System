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
    public partial class Evaluate_Progress_Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            try
            {


                String supervisorID = Session["user"].ToString();
                int serialNo = Convert.ToInt32(serialNumber.Text);
                int ProgressReportNo = Convert.ToInt32(progressreportNo.Text);
                int Evaluation = Convert.ToInt32(DropDownList1.SelectedValue);

                SqlCommand EvaluateProgressReport = new SqlCommand("EvaluateProgressReport", conn);
                EvaluateProgressReport.CommandType = CommandType.StoredProcedure;


                EvaluateProgressReport.Parameters.Add(new SqlParameter("@supervisorID", SqlDbType.Int)).Value = int.Parse(supervisorID);
                EvaluateProgressReport.Parameters.Add(new SqlParameter("@thesisSerialNo", SqlDbType.Int)).Value = serialNo;
                EvaluateProgressReport.Parameters.Add(new SqlParameter("@progressReportNo", SqlDbType.VarChar)).Value = ProgressReportNo;
                EvaluateProgressReport.Parameters.Add(new SqlParameter("@evaluation", SqlDbType.VarChar)).Value = Evaluation;


                conn.Open();
                EvaluateProgressReport.ExecuteNonQuery();
                Response.Write("<script type=\"text/javascript\">alert('Progress report is evaluated');</script>");
                conn.Close();
            }
            catch(Exception ex)
            {
                Response.Write("<script type=\"text/javascript\">alert('Incorrect data format.');</script>");

            }
        }

    }
}