using System;  
using System.Collections.Generic;  
using System.Linq;  
using System.Web;  
using System.Web.UI;  
using System.Web.UI.WebControls;  
using System.Text;  
using System.Data.SqlClient;
using System.Security.Cryptography;

using System.IO;



namespace Myproject.forms
{
    public partial class reg : System.Web.UI.Page
    {

        //registration form for new users
        SqlConnection con = new SqlConnection(@"Data Source=tcp:sp0pklddh6.database.windows.net,1433;Initial Catalog=fannyCRAKZl3GTV1;User Id=fannyk@sp0pklddh6;Password=Daco6135");
        protected void Page_Load(object sender, EventArgs e)
        { 
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string strpass = TextBox3.Text;
            SqlCommand cmd = new SqlCommand("insert into login values(@username,@pwd)", con);
            cmd.Parameters.AddWithValue("@username", TextBox1.Text);

            cmd.Parameters.AddWithValue("@pwd", strpass);
            con.Open();
            int i = cmd.ExecuteNonQuery();
            con.Close();
            if (i != 0)
            {
               
            }
            else
            {
             
            }
        }
      

       


    }
}