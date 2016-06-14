using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Security.Cryptography;
using System.Text;
using System.Configuration;
using System.IO;
namespace Myproject
{
    public partial class loginPage : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(@"Data Source=tcp:sp0pklddh6.database.windows.net,1433;Initial Catalog=fannyCRAKZl3GTV1;User Id=fannyk@sp0pklddh6;Password=Daco6135");
        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr;

        protected void Page_Load(object sender, EventArgs e)
        {

        }



    


        // submit the user name and password
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
           
            con.Open();
            cmd.Connection=con;
            cmd.CommandText = ("Select * from login where username='" + txtusername.Text + "' and pwd ='" + txtpassword.Text + "'");
            dr= cmd.ExecuteReader();
            dr.Read();
            if(dr.HasRows){
                Session["username"]= txtusername.Text;
                Response.Redirect("Default.aspx");


          

            }

            else{

                Response.Write("<script>alert('סיסמא ושם משתמש שגויים')</script>");


            }

           con.Close();


    }
}



}



