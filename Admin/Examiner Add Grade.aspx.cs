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
    public partial class Examiner_Add_Grade : System.Web.UI.Page
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


                int serialNumber = Convert.ToInt32(serialNo.Text);
                DateTime DefenseDate = Convert.ToDateTime(defensedate.Text);
                Decimal Grade = Convert.ToDecimal(grade.Text);
                String examiner_ID = Session["user"].ToString();

                SqlCommand AddDefenseGrade = new SqlCommand("AddDefenseGrade", conn);
                AddDefenseGrade.CommandType = CommandType.StoredProcedure;


                AddDefenseGrade.Parameters.Add(new SqlParameter("@ThesisSerialNo", SqlDbType.Int)).Value = serialNumber;
                AddDefenseGrade.Parameters.Add(new SqlParameter("@DefenseDate", SqlDbType.DateTime)).Value = DefenseDate;
                AddDefenseGrade.Parameters.Add(new SqlParameter("@grade", SqlDbType.Decimal)).Value = Grade;
                AddDefenseGrade.Parameters.Add(new SqlParameter("@examinerID", SqlDbType.Int)).Value = Int16.Parse(examiner_ID);

                SqlParameter success = AddDefenseGrade.Parameters.Add("@success", SqlDbType.Bit);
                success.Direction = ParameterDirection.Output;




                conn.Open();
                AddDefenseGrade.ExecuteNonQuery();


                if (success.Value.ToString() == "True")
                {
                    Response.Write("Grade was added for the thesis");
                }
                else
                {
                    Response.Write("Grade wasn't added for the thesis. Please check your inputs!");

                }
                conn.Close();
            }
            catch(Exception ex)
            {
                Response.Write("<script type=\"text/javascript\">alert('One of the entered inputs was in incorrect format. Please Try again!');</script>");

            }
        }
    }
}