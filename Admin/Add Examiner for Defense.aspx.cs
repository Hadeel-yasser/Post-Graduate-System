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
    public partial class Add_Examiner_for_Defense : System.Web.UI.Page
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


                int serialNo = Convert.ToInt32(serialNumber.Text);
                DateTime DefenseDate = Convert.ToDateTime(defenseDate.Text);
                int ExaminerID = Convert.ToInt32(examinerID.Text);



                SqlCommand AddExaminer = new SqlCommand("AddExaminer", conn);
                AddExaminer.CommandType = CommandType.StoredProcedure;


                AddExaminer.Parameters.Add(new SqlParameter("@ThesisSerialNo", SqlDbType.Int)).Value = serialNo;
                AddExaminer.Parameters.Add(new SqlParameter("@DefenseDate", SqlDbType.DateTime)).Value = DefenseDate;
                AddExaminer.Parameters.Add(new SqlParameter("@ExaminerId", SqlDbType.Int)).Value = ExaminerID;

                SqlParameter success = AddExaminer.Parameters.Add("@success", SqlDbType.Bit);
                success.Direction = ParameterDirection.Output;

                conn.Open();
                AddExaminer.ExecuteNonQuery();

                if (success.Value.ToString() == "True")
                {
                    Response.Write("<script type=\"text/javascript\">alert('Examiner was added for a defense');</script>");

                }

                else
                {
                    Response.Write("<script type=\"text/javascript\">alert('Can't add examiner. Please check your inputs!');</script>");

                }


                conn.Close();
           }
            catch(SqlException sq)
            {
                Response.Write("<script type=\"text/javascript\">alert('Inputs doesn't exist. Please try again');</script>");
            }
            catch (Exception ex)
           {
               Response.Write("<script type=\"text/javascript\">alert('Incorrect data format.');</script>");
           }
        }
    }
}