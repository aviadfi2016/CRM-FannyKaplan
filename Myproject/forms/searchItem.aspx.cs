using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;
using System.Collections;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;





namespace Myproject.forms
{
    public partial class searchItem : System.Web.UI.Page
    {
        //tblchildren,tblInter, tblCustomers
        // searching page by age, mobile number, phone number and first name in each of the category- adult, child and intersts 


        

        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=D:\final project\version\14\Myproject\Myproject\App_Data\Data1.mdf;Integrated Security=True");




        protected void Page_Load(object sender, EventArgs e)
        {


            if (Session["username"] == null)
            {


                Response.Redirect("~/loginPage.aspx");


            }
            else
            {



            }


        }

        


        // function of the search button

        protected void btnSearch_Click_Click(object sender, EventArgs e)
        {

            string Query = string.Empty;
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                if (DropDownList2.SelectedValue.ToString() == "מבוגר")
                {

                    if (DropDownList1.SelectedValue.ToString() == "גיל")
                    {
                        Query = "select * from tblCustomers where Age Like '%" + txtSearchName.Text + "'";
                    }
                   if (DropDownList1.SelectedValue.ToString() == "שם פרטי")
                    {
                     //  Query = "select * from tblCustomers where FirstName Like '" + txtSearchName.Text + "%'";
                        
                       Query = "select* from tblCustomers where(FirstName like '%'+ @search+ '%') ";
                                 
                    }  
                    else if (DropDownList1.SelectedValue.ToString() == "טלפון בבית")
                    {
                        Query = "select * from tblCustomers where PhoneNumber Like '%" + txtSearchName.Text + "'";
                    }
                    else if (DropDownList1.SelectedValue.ToString() == "טלפון נייד")
                    {
                        Query = "select * from tblCustomers where MobilePhone Like '%" + txtSearchName.Text + "'";
                    }

                    SqlDataAdapter sqlDa = new SqlDataAdapter(Query, con);
                    sqlDa.SelectCommand.Parameters.AddWithValue("@search", txtSearchName.Text);
                    DataSet Ds = new DataSet();
                    sqlDa.Fill(Ds);
                    gvAdult.DataSource = Ds;
                    gvAdult.DataBind();
                }


                else if (DropDownList2.SelectedValue.ToString() == "ילד")
                {

                    if (DropDownList1.SelectedValue.ToString() == "גיל")
                    {
                        Query = "select * from tblchildren where Age Like '%" + txtSearchName.Text + "'";
                    }
                    else if (DropDownList1.SelectedValue.ToString() == "שם פרטי")
                    {
                        //Query = "select * from tblchildren where FirstName Like '%" + txtSearchName.Text + "'";

                        Query = "select* from tblchildren where(FirstName like '%'+ @search+ '%') ";
                    }

                    else if (DropDownList1.SelectedValue.ToString() == "טלפון בבית")
                    {
                        Query = "select * from tblchildren where PhoneNumber Like '%" + txtSearchName.Text + "'";
                    }
                    else if (DropDownList1.SelectedValue.ToString() == "טלפון נייד")
                    {
                        Query = "select * from tblchildren where MobilePhone Like '%" + txtSearchName.Text + "'";
                    }

                    SqlDataAdapter sqlDa = new SqlDataAdapter(Query, con);
                    sqlDa.SelectCommand.Parameters.AddWithValue("@search", txtSearchName.Text);
                    DataSet Ds = new DataSet();
                    sqlDa.Fill(Ds);
                    gvChildren.DataSource = Ds;
                    gvChildren.DataBind();


                }

                else if (DropDownList2.SelectedValue.ToString() == "מתעניין")
                {

                    if (DropDownList1.SelectedValue.ToString() == "גיל")
                    {
                        Query = "select * from tblInter where Age Like '%" + txtSearchName.Text + "'";
                    }
                    else if (DropDownList1.SelectedValue.ToString() == "שם פרטי")
                    {
                        //Query = "select * from tblInter where FirstName Like '%" + txtSearchName.Text + "'";
                        
                        Query = "select* from tblInter where(FirstName like '%'+ @search+ '%') ";

                    }

                    else if (DropDownList1.SelectedValue.ToString() == "טלפון בבית")
                    {
                        Query = "select * from tblInter where PhoneNumber Like '%" + txtSearchName.Text + "'";
                    }
                    else if (DropDownList1.SelectedValue.ToString() == "טלפון נייד")
                    {
                        Query = "select * from tblInter where MobilePhone Like '%" + txtSearchName.Text + "'";
                    }

                    SqlDataAdapter sqlDa = new SqlDataAdapter(Query, con);
                    sqlDa.SelectCommand.Parameters.AddWithValue("@search", txtSearchName.Text);
                    DataSet Ds = new DataSet();
                    sqlDa.Fill(Ds);
                    gvInter.DataSource = Ds;
                    gvInter.DataBind();
                    gvInter.DataSource = null;
                }
            }
            catch (Exception ex)
            {
                HttpContext.Current.Response.Write("<script>alert('לא קימים נתונים')</script>" + ex.Message);
            }
            finally
            {
                con.Close();
          
            }
        }

    }

       
}