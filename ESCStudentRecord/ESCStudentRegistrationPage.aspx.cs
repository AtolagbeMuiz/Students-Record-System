using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ESCStudentRecord
{
    public partial class ESCStudentRegistrationPage : System.Web.UI.Page
    {
        SqlConnection sqlConn = new SqlConnection("Server=.;Database=ESCStudentRecordRegistration;Trusted_Connection=True;");
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Page.IsPostBack == false)
            //{
                errormessagePanel.Visible = false;
                successmessagePannel.Visible = false;
           //}
        }

        protected void btnReg_Click(object sender, EventArgs e)
        {
            //This IF-Block makes sure Empty TextBoses isn't saved into the Database
            if (matricNumber.Value == "" || password.Value == "" || surname.Value == "" || firstName.Value == "" || otherName.Value == "" || email.Value == "" || dateofBirth.Value == "" || telephone.Value == "" || currentLevel.Value == "" || currentCGPA.Value == "" || rbtnDegreeOption.SelectedValue == "")
            {
                errormessagePanel.Visible = true;
                lblErrorMessage.ForeColor = System.Drawing.Color.Red;
                lblErrorMessage.Text = "Pls, Ensure all forms are filled";
            }

            else
            {
                //calling CheckUser Method to check if User already exists
                CheckUser();
            }
        }

        public void Reg()
        {
              //Registration
            if (sqlConn.State == System.Data.ConnectionState.Closed)
                sqlConn.Open();
                SqlCommand sqlcmd = new SqlCommand("SaveStudentRecord", sqlConn);
                sqlcmd.CommandType = System.Data.CommandType.StoredProcedure;
                sqlcmd.Parameters.AddWithValue("@Surname", surname.Value.Trim());
                sqlcmd.Parameters.AddWithValue("@FirstName", firstName.Value.Trim());
                sqlcmd.Parameters.AddWithValue("@OtherName", otherName.Value.Trim());
                sqlcmd.Parameters.AddWithValue("@Email", email.Value.Trim());
                sqlcmd.Parameters.AddWithValue("@DOB", dateofBirth.Value.Trim());
                sqlcmd.Parameters.AddWithValue("@Telephone", telephone.Value.Trim());
                sqlcmd.Parameters.AddWithValue("@MatricNumber", matricNumber.Value.Trim());
                sqlcmd.Parameters.AddWithValue("@Password", password.Value.Trim());
                sqlcmd.Parameters.AddWithValue("@CurrentLevel", currentLevel.Value.Trim());
                sqlcmd.Parameters.AddWithValue("@CurrentCGPA", currentCGPA.Value.Trim());

               //Selects a chosen option of radio button and insert it to the database
                sqlcmd.Parameters.AddWithValue("@DegreeOption", rbtnDegreeOption.SelectedValue.Trim());

                //Sqlcmd.ExecuteNonQuery executes the sqlcommands
                sqlcmd.ExecuteNonQuery();

                //closes the sqlconnection
                sqlConn.Close();
            
               //Success Message
               errormessagePanel.Visible = false;
               successmessagePannel.Visible = true;
               lblSuccessMessage.ForeColor = System.Drawing.Color.Green;
               lblSuccessMessage.Text = "Registration Successful";
                
              //calling the clear method to clear the Textboxes after Registration
               Clear();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }

        public void Clear()
        {
            //surname.Value = firstName.Value = otherName.Value = email.Value = dateofBirth.Value = telephone.Value = matricNumber.Value = password.Value = currentLevel.Value = currentCGPA.Value = AGY.Value = AGP.Value = "";
            surname.Value = firstName.Value = otherName.Value = email.Value = dateofBirth.Value = telephone.Value = matricNumber.Value = password.Value = currentLevel.Value = currentCGPA.Value = rbtnDegreeOption.SelectedValue = "";
            btnReg.Enabled = false;

        }

        public void CheckUser()
        {
            //checking if User(matric number and email) entered during registration exists initially in the database
            if (sqlConn.State == System.Data.ConnectionState.Closed)
                sqlConn.Open();
            SqlCommand sqlcmd = new SqlCommand("CheckUSer", sqlConn);
            sqlcmd.CommandType = System.Data.CommandType.StoredProcedure;
            sqlcmd.Parameters.AddWithValue("@MatricNumber", matricNumber.Value);
            sqlcmd.Parameters.AddWithValue("@Email", email.Value);

            //Reads the database
            SqlDataReader reader = sqlcmd.ExecuteReader();
            if (reader.HasRows)
            {
                //User Exists
                successmessagePannel.Visible = false;
                errormessagePanel.Visible = true;
                lblErrorMessage.ForeColor = System.Drawing.Color.Red;
                lblErrorMessage.Text = "Matric Number already exists";
            }

            else
            {
                //close the reader before Reg() is executed
                reader.Close();
                reader.Dispose();
                Reg();
            }
               
            sqlConn.Close();
  
        }       
    }
}