using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Myproject
{
    public partial class logoutPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            Session["username"] = null;

            Response.Redirect("loginPage.aspx");

        }
    }
}