using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ESCStudentRecord
{
    public partial class ESCStudentLoginPage : System.Web.UI.Page
    {
        SqlConnection sqlConn = new SqlConnection("Server=.;Database=ESCStudentRecordRegistration;Trusted_Connection=True;");
        protected void Page_Load(object sender, EventArgs e)
        {
            this.pannelerrorMessage.Visible = false;
        }

        protected void login_Click(object sender, EventArgs e)
        {
            if (sqlConn.State == System.Data.ConnectionState.Closed)
                sqlConn.Open();
            SqlCommand sqlcmd = new SqlCommand("SelectLoginData", sqlConn);
            sqlcmd.CommandType = System.Data.CommandType.StoredProcedure;
            sqlcmd.Parameters.AddWithValue("@MatricNumber", txtmatricNumber.Value);
            sqlcmd.Parameters.AddWithValue("@Password", txtPassword.Value);

            int codereturn = (int)sqlcmd.ExecuteScalar();

             if (codereturn == 1)
            {
                Response.Redirect("HomePage.aspx");
            }
            else
            {
                pannelerrorMessage.Visible=true;
                this.lblerrormessage.ForeColor = System.Drawing.Color.Red;
                this.lblerrormessage.Text = "Your Username or Password is Invalid";
            }
        }
    }
}