using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Drawing;
using System.IO;
using System.Text;
using System.Web.Security;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;


namespace Myproject.forms
{
    public partial class Reports : System.Web.UI.Page
    {


        SqlConnection con = new SqlConnection(@"Data Source=tcp:sp0pklddh6.database.windows.net,1433;Initial Catalog=fannyCRAKZl3GTV1;User Id=fannyk@sp0pklddh6;Password=Daco6135");

        //clear the search method in the ddl
        protected void ClearControls()
        {
            try
            {
                txtSearchName.Text = "";
                ddl_ItemSearch.ClearSelection();
                ddl_ItemSearch1.ClearSelection();
            }
            catch
            {

                throw;
            }
        }

        //redirect to login page when no login was made
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

        // the button the export the result of the search to excel file
        protected void ExportToExcelButton_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Clear();
                Response.Buffer = true;
                Response.AddHeader("content-disposition", "attachment;filename=דוח.xls");
                Response.Charset = "";
                Response.ContentType = "application/vnd.ms-excel";
                StringWriter sWriter = new StringWriter();
                HtmlTextWriter hWriter = new HtmlTextWriter(sWriter);
                gvAdult.RenderControl(hWriter);
                gvChildren.RenderControl(hWriter);
                gvInter.RenderControl(hWriter);
                Response.Output.Write(sWriter.ToString());
                Response.Flush();
                Response.End();
            }
            catch
            {
                throw;
            }
        }


        public override void VerifyRenderingInServerForm(Control control)
        {
        }


        // function of the search button by methods thatwas requsted by the customer

        protected void btnSearch_Click_Click(object sender, EventArgs e)
        {

            string Query = string.Empty;
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                if (ddl_ItemSearch.SelectedValue.ToString() == "מבוגר")
                {

                    if (ddl_ItemSearch1.SelectedValue.ToString() == "דואר אלקטרוני")
                    {
                        Query = "select * from tblCustomers where Email Like '%" + txtSearchName.Text + "'";
                    }
                    if (ddl_ItemSearch1.SelectedValue.ToString() == "חוגים")
                    {

                        Query = "select* from tblCustomers where(Klass like '%'+ @search+ '%') ";

                    }
                    else if (ddl_ItemSearch1.SelectedValue.ToString() == "טלפון נייד")
                    {
                        Query = "select * from tblCustomers where MobilePhone Like '%" + txtSearchName.Text + "'";
                    }
                    else if (ddl_ItemSearch1.SelectedValue.ToString() == "סטטוס")
                    {
                        Query = "select * from tblCustomers where (Office like '%'+ @search+ '%') ";
                    }
                    else if (ddl_ItemSearch1.SelectedValue.ToString() == "שכונה")
                    {
                        Query = "select * from tblCustomers where (ddl_Neighborhood like '%'+ @search+ '%') ";
                    }

                    SqlDataAdapter sqlDa = new SqlDataAdapter(Query, con);
                    sqlDa.SelectCommand.Parameters.AddWithValue("@search", txtSearchName.Text);
                    DataSet Ds = new DataSet();
                    sqlDa.Fill(Ds);
                    gvAdult.DataSource = Ds;
                    gvAdult.DataBind();


                    ClearControls();
                }


                else if (ddl_ItemSearch.SelectedValue.ToString() == "ילד")
                {

                    if (ddl_ItemSearch1.SelectedValue.ToString() == "דואר אלקטרוני")
                    {
                        Query = "select * from tblChildren where Email Like '%" + txtSearchName.Text + "'";
                    }
                    if (ddl_ItemSearch1.SelectedValue.ToString() == "חוגים")
                    {

                        Query = "select* from tblChildren where(Klass like '%'+ @search+ '%') ";

                    }
                    else if (ddl_ItemSearch1.SelectedValue.ToString() == "טלפון נייד")
                    {
                        Query = "select * from tblChildren where MobilePhone Like '%" + txtSearchName.Text + "'";
                    }
                    else if (ddl_ItemSearch1.SelectedValue.ToString() == "סטטוס")
                    {
                        Query = "select * from tblChildren where (Office like '%'+ @search+ '%') ";
                    }
                    else if (ddl_ItemSearch1.SelectedValue.ToString() == "שכונה")
                    {
                        Query = "select * from tblChildren where (ddl_Neighborhood like '%'+ @search+ '%') ";
                    }
                    SqlDataAdapter sqlDa = new SqlDataAdapter(Query, con);
                    sqlDa.SelectCommand.Parameters.AddWithValue("@search", txtSearchName.Text);
                    DataSet Ds = new DataSet();
                    sqlDa.Fill(Ds);
                    gvChildren.DataSource = Ds;
                    gvChildren.DataBind();

                    ClearControls();
                }

                else if (ddl_ItemSearch.SelectedValue.ToString() == "מתעניין")
                {

                    if (ddl_ItemSearch1.SelectedValue.ToString() == "דואר אלקטרוני")
                    {
                        Query = "select * from tblInter where Email Like '%" + txtSearchName.Text + "'";
                    }
                    if (ddl_ItemSearch1.SelectedValue.ToString() == "חוגים")
                    {

                        Query = "select* from tblInter where(Klass like '%'+ @search+ '%') ";

                    }
                    else if (ddl_ItemSearch1.SelectedValue.ToString() == "טלפון נייד")
                    {
                        Query = "select * from tblInter where MobilePhone Like '%" + txtSearchName.Text + "'";
                    }
                    else if (ddl_ItemSearch1.SelectedValue.ToString() == "סטטוס")
                    {
                        Query = "select * from tblInter where (Office like '%'+ @search+ '%') ";
                    }
                    else if (ddl_ItemSearch1.SelectedValue.ToString() == "שכונה")
                    {
                        Query = "select * from tblInter where (ddl_Neighborhood like '%'+ @search+ '%') ";
                    }

                    SqlDataAdapter sqlDa = new SqlDataAdapter(Query, con);
                    sqlDa.SelectCommand.Parameters.AddWithValue("@search", txtSearchName.Text);
                    DataSet Ds = new DataSet();
                    sqlDa.Fill(Ds);
                    gvInter.DataSource = Ds;
                    gvInter.DataBind();
                    gvInter.DataSource = null;
                    ClearControls();
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












