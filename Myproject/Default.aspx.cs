using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Myproject
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {


                Response.Redirect("loginPage.aspx");


            }
            else
            {

                Label1.Text = Session["username"].ToString() + " - ברוך הבא";

            }



        }
    }
}