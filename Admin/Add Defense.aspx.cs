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
    public partial class Add_Defense : System.Web.UI.Page
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
                String DefenseLocation = defenseLocation.Text;



                SqlCommand AddDefenseGucian = new SqlCommand("AddDefenseGucian", conn);
                AddDefenseGucian.CommandType = CommandType.StoredProcedure;


                AddDefenseGucian.Parameters.Add(new SqlParameter("@ThesisSerialNo", SqlDbType.Int)).Value = serialNo;
                AddDefenseGucian.Parameters.Add(new SqlParameter("@DefenseDate", SqlDbType.DateTime)).Value = DefenseDate;
                AddDefenseGucian.Parameters.Add(new SqlParameter("@DefenseLocation", SqlDbType.VarChar)).Value = DefenseLocation;

                SqlParameter success = AddDefenseGucian.Parameters.Add("@success", SqlDbType.Bit);
                success.Direction = ParameterDirection.Output;

                conn.Open();
                AddDefenseGucian.ExecuteNonQuery();

                if (success.Value.ToString() == "True")
                {
                    Response.Write("<script type=\"text/javascript\">alert('Defense has been added');</script>");

                }

                else
                {
                    Response.Write("<script type=\"text/javascript\">alert('Can't add defense.');</script>");

                }

                conn.Close();
            }

            catch (Exception ex)
            {
                Response.Write("<script type=\"text/javascript\">alert('Incorrect data format.');</script>");

            }
        }


    }
}
