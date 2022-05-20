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
    public partial class AdminIssuingPayment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { }

        protected void Button1_Click(object sender, EventArgs e)
        
            {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            int ThesisSerialNo = Convert.ToInt32(Thesis_Serial_Number.Text);
            decimal amount = Convert.ToDecimal(Amount.Text);
            int noOfInstallments = Convert.ToInt32(Number_Of_Installments.Text);
            Decimal fundPercentage = Convert.ToDecimal(Fund_Percentage.Text);

            SqlCommand AdminIssueThesisPayment = new SqlCommand("AdminIssueThesisPayment", conn);
            AdminIssueThesisPayment.CommandType = CommandType.StoredProcedure;

            AdminIssueThesisPayment.Parameters.Add(new SqlParameter("@ThesisSerialNo", SqlDbType.Int)).Value = ThesisSerialNo;
            AdminIssueThesisPayment.Parameters.Add(new SqlParameter("@amount", SqlDbType.Decimal)).Value = amount;
            AdminIssueThesisPayment.Parameters.Add(new SqlParameter("@noOfInstallments", SqlDbType.Int)).Value = noOfInstallments;
            AdminIssueThesisPayment.Parameters.Add(new SqlParameter("@fundPercentage", SqlDbType.Decimal)).Value = fundPercentage;



            conn.Open();
            AdminIssueThesisPayment.ExecuteNonQuery();
            Response.Write("payment Issued");
            conn.Close();
    
    }
    }
}