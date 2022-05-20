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
    public partial class AdminIssuingInstallment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)

        {


            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            if ((string.IsNullOrEmpty(PaymentID.Text)) || (string.IsNullOrEmpty(InstallmentStartDate.Text)))

            {
                Response.Write("<script type=\"text/javascript\">alert('Please fill all fields.');</script>");


            }
            else
            {
                try
                {



                    int paymentID = Convert.ToInt32(PaymentID.Text);
                    DateTime installmentStartDate = Convert.ToDateTime(InstallmentStartDate.Text);

                    SqlCommand AdminIssueInstallPayment = new SqlCommand("AdminIssueInstallPayment", conn);
                    AdminIssueInstallPayment.CommandType = CommandType.StoredProcedure;

                    AdminIssueInstallPayment.Parameters.Add(new SqlParameter("@paymentID", SqlDbType.Int)).Value = paymentID;
                    AdminIssueInstallPayment.Parameters.Add(new SqlParameter("@InstallStartDate", SqlDbType.DateTime)).Value = installmentStartDate;
                    SqlParameter success = AdminIssueInstallPayment.Parameters.Add("@success", SqlDbType.Bit);
                    success.Direction = ParameterDirection.Output;



                    conn.Open();
                    AdminIssueInstallPayment.ExecuteNonQuery();

                    if (success.Value.ToString() == "True")
                    {
                        Response.Write("<script type=\"text/javascript\">alert('Installment Issued Successfully');</script>");
                    }
                    else
                    {
                        Response.Write("<script type=\"text/javascript\">alert('Can't issue installment');</script>");
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