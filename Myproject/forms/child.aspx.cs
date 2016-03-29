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
    public partial class child : System.Web.UI.Page
    {

        // export to excel

        void gvDepartmentsFill()
        {

            string Query = "Select * from tblchildren";
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConToSEPL"].ConnectionString);
            SqlDataAdapter adp = new SqlDataAdapter(Query, con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            gvChildren.DataSource = ds.Tables[0];
            gvChildren.DataBind();
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
            Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "ילדים רשומים.xls"));
            Response.ContentType = "application/ms-excel";
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            gvChildren.AllowPaging = false;
            FillGrid();
            gvChildren.HeaderRow.Style.Add("background-color", "#FFFFFF");
            for (int a = 0; a < gvChildren.HeaderRow.Cells.Count - 1; a++)
            {
                gvChildren.HeaderRow.Cells[a].Style.Add("background-color", "#507CD1");
            }
            int j = 1;
            foreach (GridViewRow gvrow in gvChildren.Rows)
            {
                gvChildren.BackColor = Color.White;
                if (j <= gvChildren.Rows.Count - 1)
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
            gvChildren.RenderControl(htw);
            Response.Write(sw.ToString());
            Response.End();
        }



        //establish a local connection to database
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=D:\final project\version\14\Myproject\Myproject\App_Data\Data1.mdf;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                txtFatherName.Focus();
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
                cmd.CommandText = "Select CustomerID,FatherName,MotherName,LastName,FirstName,Taz, DOB,PhoneNumber,MobilePhone,Address,Email,Klass,Grade,School,HMO, Office, Date, Worker from tblchildren where IsActive=1";
                cmd.Connection = con;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                gvChildren.DataSource = ds;
                gvChildren.DataBind();
            }
            catch
            {

            }
        }



        //show the calender in the DOB
        protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
        {
            Calendar3.Visible = true;

        }

        protected void Calendar3_SelectionChanged(object sender, EventArgs e)
        {
            txtDOB.Text = Calendar3.SelectedDate.ToShortDateString();
            Calendar3.Visible = false;
        }

        //show the date of the regestrtion
        protected void Calendar4_SelectionChanged(object sender, EventArgs e)
        {
            txtDate.Text = Calendar4.SelectedDate.ToShortDateString();
            Calendar4.Visible = false;
        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            Calendar4.Visible = true;
        }






        protected void ClearControls()
        {
            try
            {
                txtFatherName.Text = "";
                txtMotherName.Text = "";
                txtLastName.Text = "";
                txtFirstName.Text = "";
                txtTaz.Text = "";
                txtDOB.Text = "";
                txtPhoneNumber.Text = "";
                txtMobilePhone.Text = "";
                txtAddress.Text = "";
                txtEmail.Text = "";
                txtKlass.Text = "";
                txtGrade.Text = "";
                txtSchool.Text = "";
                txtHMO.Text = "";
                txtOffice.Text = "";
                txtDate.Text = "";
                txtWorker.Text = "";
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
                cmd.CommandText = "insert into tblchildren (FatherName,MotherName,LastName,FirstName,Taz, DOB,PhoneNumber,MobilePhone,Address,Email,Klass,Grade,School,HMO,Office,Date, Worker,IsActive) values (@FatherName,@MotherName,@LastName,@FirstName,@Taz, @DOB,@PhoneNumber,@MobilePhone,@Address,@Email,@Klass,@Grade,@School,@HMO,@Office,@Date,@Worker,1)";
                cmd.Parameters.AddWithValue("@FatherName", txtFatherName.Text);
                cmd.Parameters.AddWithValue("@MotherName", txtMotherName.Text);
                cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
                cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                cmd.Parameters.AddWithValue("@Taz", txtTaz.Text);
                cmd.Parameters.AddWithValue("@DOB", txtDOB.Text);
                cmd.Parameters.AddWithValue("@PhoneNumber", txtPhoneNumber.Text);
                cmd.Parameters.AddWithValue("@MobilePhone", txtMobilePhone.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Klass", txtKlass.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Grade", txtGrade.Text);
                cmd.Parameters.AddWithValue("@School", txtSchool.Text);
                cmd.Parameters.AddWithValue("@HMO", txtHMO.Text);
                cmd.Parameters.AddWithValue("@Office", txtOffice.Text);
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
                txtFatherName.Text = (grow.FindControl("lblFatherName") as Label).Text;
                txtMotherName.Text = (grow.FindControl("lblMotherName") as Label).Text;
                txtLastName.Text = (grow.FindControl("lblLastName") as Label).Text;
                txtFirstName.Text = (grow.FindControl("lblFirstName") as Label).Text;
                txtTaz.Text = (grow.FindControl("lblTaz") as Label).Text;
                txtDOB.Text = (grow.FindControl("lblDOB") as Label).Text;
                txtPhoneNumber.Text = (grow.FindControl("lblPhoneNumber") as Label).Text;
                txtMobilePhone.Text = (grow.FindControl("lblMobilePhone") as Label).Text;
                txtAddress.Text = (grow.FindControl("lblAddress") as Label).Text;
                txtEmail.Text = (grow.FindControl("lblEmail") as Label).Text;
                // txtKlass.Text = (grow.FindControl("lblKlass") as Label).Text;
                txtGrade.Text = (grow.FindControl("lblGrade") as Label).Text;
                txtSchool.Text = (grow.FindControl("lblSchool") as Label).Text;
                txtHMO.Text = (grow.FindControl("lblHMO") as Label).Text;
                txtOffice.Text = (grow.FindControl("lblOffice") as Label).Text;
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
                cmd.CommandText = "update tblchildren set FatherName=@FatherName,MotherName=@MotherName,LastName=@LastName,FirstName=@FirstName,Taz=@Taz, DOB=@DOB, PhoneNumber=@PhoneNumber,MobilePhone=@MobilePhone,Address=@Address, Email=@Email, Klass=@Klass,Grade=@Grade,School=@School,HMO=@HMO, Office=@Office,Date=@Date,Worker=@Worker where CustomerID=@CustomerID";
                cmd.Parameters.AddWithValue("@FatherName", txtFatherName.Text);
                cmd.Parameters.AddWithValue("@MotherName", txtMotherName.Text);
                cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
                cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                cmd.Parameters.AddWithValue("@Taz", txtTaz.Text);
                cmd.Parameters.AddWithValue("@DOB", txtDOB.Text);
                cmd.Parameters.AddWithValue("@PhoneNumber", txtPhoneNumber.Text);
                cmd.Parameters.AddWithValue("@MobilePhone", txtMobilePhone.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Klass", txtKlass.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Grade", txtGrade.Text);
                cmd.Parameters.AddWithValue("@School", txtSchool.Text);
                cmd.Parameters.AddWithValue("@HMO", txtHMO.Text);
                cmd.Parameters.AddWithValue("@Office", txtOffice.Text);
                cmd.Parameters.AddWithValue("@Date", txtDate.Text);
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
                cmd.CommandText = "update tblchildren set IsActive=0 where CustomerID=@CustomerID";
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
