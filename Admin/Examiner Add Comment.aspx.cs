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
    public partial class Examiner_Add_Comment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void update_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();

            SqlConnection conn = new SqlConnection(connStr);

            int serialNumber = Convert.ToInt32(serialNo.Text);
            DateTime defenseDate =Convert.ToDateTime(D_date.Text);
            String comment = comment_E.Text;
            String examiner_ID = Session["user"].ToString();

            SqlCommand AddCommentsGrade = new SqlCommand("AddCommentsGrade", conn);
            AddCommentsGrade.CommandType = CommandType.StoredProcedure;


            AddCommentsGrade.Parameters.Add(new SqlParameter("@ThesisSerialNo", SqlDbType.Int)).Value = serialNumber;
            AddCommentsGrade.Parameters.Add(new SqlParameter("@DefenseDate", SqlDbType.DateTime)).Value = defenseDate;
            AddCommentsGrade.Parameters.Add(new SqlParameter("@comments", SqlDbType.VarChar)).Value = comment;
            AddCommentsGrade.Parameters.Add(new SqlParameter("@examinerID", SqlDbType.Int)).Value = Int16.Parse(examiner_ID);

            SqlParameter success = AddCommentsGrade.Parameters.Add("@success", SqlDbType.Bit);
            success.Direction = ParameterDirection.Output;
            


            conn.Open();
            AddCommentsGrade.ExecuteNonQuery();

            if (success.Value.ToString() == "True")
            {
                Response.Write("comments were added for the thesis");
            }
            else
            {
                Response.Write("Comments weren't added. Please check your inputs!");
            }

            conn.Close();
        }
    }
}