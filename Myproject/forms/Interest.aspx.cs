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
    public partial class Interest : System.Web.UI.Page
    {
        

        // export to excel

        void gvDepartmentsFill()
        {

            string Query = "Select * from tblInter";
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConToSEPL"].ConnectionString);
            SqlDataAdapter adp = new SqlDataAdapter(Query, con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            gvInter.DataSource = ds.Tables[0];
            gvInter.DataBind();
        }
        //You have to add an another Event for Export to work properly:
        public override void VerifyRenderingInServerForm(Control control)
        {
            // Can Leave This Blank. 
        }
        protected void lnkExport_Click(object sender, EventArgs e)
        {
            Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "מתעניינים.xls"));
            Response.ContentType = "application/ms-excel";
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            gvInter.AllowPaging = false;
            FillGrid();
            gvInter.HeaderRow.Style.Add("background-color", "#FFFFFF");
            for (int a = 0; a < gvInter.HeaderRow.Cells.Count - 1; a++)
            {
                gvInter.HeaderRow.Cells[a].Style.Add("background-color", "#507CD1");
            }
            int j = 1;
            foreach (GridViewRow gvrow in gvInter.Rows)
            {
                gvInter.BackColor = Color.White;
                if (j <= gvInter.Rows.Count - 1)
                {
                    if (j % 2 != 0)
                    {
                        for (int k = 0; k < gvrow.Cells.Count - 1; k++)
                        {
                            gvrow.Cells[k].Style.Add("background-color", "#EFF3FB");
                        }
                    }
                }
                j++;
            }
            gvInter.RenderControl(htw);
            Response.Write(sw.ToString());
            Response.End();
        }

        //show the date of the regestrtion
        protected void Calendar5_SelectionChanged(object sender, EventArgs e)
        {
            txtDate.Text = Calendar5.SelectedDate.ToShortDateString();
            Calendar5.Visible = false;
        }

        protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
        {
            Calendar5.Visible = true;
        }








        //establish a local connection to database
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=D:\final project\version\14\Myproject\Myproject\App_Data\Data1.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                txtKlass.Focus();
                if (!IsPostBack)
                {
                    FillGrid();
                }
            }
            catch
            {

            }

        }
        // first boot of the grid
        protected void FillGrid()
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "Select CustomerID,Klass,Age,FirstName,LastName,PhoneNumber,MobilePhone,Address,Email,Ways, Comments, Date,Worker from tblInter where IsActive=1";
                cmd.Connection = con;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                gvInter.DataSource = ds;
                gvInter.DataBind();
            }
            catch
            {

            }
        }

        protected void ClearControls()
        {
            try
            {
                txtKlass.Text = "";
                txtAge.Text = "";
                txtFirstName.Text = "";
                txtLastName.Text = "";
                txtPhoneNumber.Text = "";
                txtMobilePhone.Text = "";
                txtAddress.Text = "";
                txtEmail.Text = "";
                txtWays.Text = "";
                txtDate.Text = "";
                txtWorker.Text = "";
                txtComments.Text = "";
                hidCustomerID.Value = "";
                btnSave.Visible = true;
                btnUpdate.Visible = false;
            }
            catch
            {

                throw;
            }
        }
        // function of the save buttun
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "insert into tblInter (Klass,Age,FirstName, LastName,PhoneNumber,MobilePhone,Address,Email,Ways,Comments,Date,Worker,IsActive) values (@Klass,@Age,@FirstName, @LastName,@PhoneNumber,@MobilePhone,@Address,@Email,@Ways,@Comments,@Date,@Worker,1)";
                cmd.Parameters.AddWithValue("@Klass", txtKlass.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Age", txtAge.Text);
                cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
                cmd.Parameters.AddWithValue("@PhoneNumber", txtPhoneNumber.Text);
                cmd.Parameters.AddWithValue("@MobilePhone", txtMobilePhone.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Ways", txtWays.Text);
                cmd.Parameters.AddWithValue("@Comments", txtComments.Text);
                cmd.Parameters.AddWithValue("@Date", txtDate.Text);
                cmd.Parameters.AddWithValue("@Worker", txtWorker.Text);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                FillGrid();
                ClearControls();
                lblMessage.Text = "נשמר בהצלחה";
            }
            catch
            {

            }
            finally
            {
                if (con.State == ConnectionState.Open)
                    con.Close();
            }
        }
        // function of the clear buttun
        protected void btnClear_Click(object sender, EventArgs e)
        {
            try
            {
                ClearControls();
            }
            catch
            {

            }
        }
        // function of the edit buttun
        protected void btnEdit_Click(object sender, EventArgs e)
        {
            try
            {
                ClearControls();
                Button btn = sender as Button;
                GridViewRow grow = btn.NamingContainer as GridViewRow;
                hidCustomerID.Value = (grow.FindControl("lblCustomerID") as Label).Text;
                txtKlass.Text = (grow.FindControl("lblKlass") as Label).Text;
                txtAge.Text = (grow.FindControl("lblAge") as Label).Text;
                txtFirstName.Text = (grow.FindControl("lblFirstName") as Label).Text;
                txtLastName.Text = (grow.FindControl("lblLastName") as Label).Text;
                txtPhoneNumber.Text = (grow.FindControl("lblPhoneNumber") as Label).Text;
                txtMobilePhone.Text = (grow.FindControl("lblMobilePhone") as Label).Text;
                txtAddress.Text = (grow.FindControl("lblAddress") as Label).Text;
                txtEmail.Text = (grow.FindControl("lblEmail") as Label).Text;
                txtWays.Text = (grow.FindControl("lblWays") as Label).Text;
                txtComments.Text = (grow.FindControl("lblComments") as Label).Text;
                txtDate.Text = (grow.FindControl("lblDate") as Label).Text;
                txtWorker.Text = (grow.FindControl("lblWorker") as Label).Text;
                btnSave.Visible = false;
                btnUpdate.Visible = true;
            }
            catch
            {

            }
        }
        // function of the update buttun
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "update tblInter set Klass=@Klass,Age=@Age, FirstName=@FirstName, LastName=@LastName,PhoneNumber=@PhoneNumber,MobilePhone=@MobilePhone,Address=@Address, Email=@Email,Ways=@Ways, Comments=@Comments, Date=@Date , Worker=@Worker where CustomerID=@CustomerID";
                cmd.Parameters.AddWithValue("@Klass", txtKlass.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Age", txtAge.Text);
                cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
                cmd.Parameters.AddWithValue("@PhoneNumber", txtPhoneNumber.Text);
                cmd.Parameters.AddWithValue("@MobilePhone", txtMobilePhone.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Ways", txtWays.Text);
                cmd.Parameters.AddWithValue("@Date", txtDate.Text);
                cmd.Parameters.AddWithValue("@Comments", txtComments.Text);
                cmd.Parameters.AddWithValue("@Worker", txtWorker.Text);
                cmd.Parameters.AddWithValue("@CustomerID", hidCustomerID.Value);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                FillGrid();
                ClearControls();
                lblMessage.Text = "עודכן בהצלחה";
            }
            catch
            {

            }
            finally
            {
                if (con.State == ConnectionState.Open)
                    con.Close();
            }
        }
        // function of the delete buttun
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                ClearControls();
                Button btn = sender as Button;
                GridViewRow grow = btn.NamingContainer as GridViewRow;
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "update tblInter set IsActive=0 where CustomerID=@CustomerID";
                cmd.Parameters.AddWithValue("@CustomerID", (grow.FindControl("lblCustomerID") as Label).Text);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                FillGrid();
                lblMessage.Text = "נמחק בהצלחה";
            }
            catch
            {

            }
            finally
            {
                if (con.State == ConnectionState.Open)
                    con.Close();
            }
        }
    }





}
