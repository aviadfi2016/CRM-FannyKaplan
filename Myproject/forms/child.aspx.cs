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
    public partial class Child : System.Web.UI.Page
    {


        // function of the search button- filter the gridview by name

        protected void Button1_Click(object sender, EventArgs e)
        {
            String str = "select* from tblchildren where(FirstName like '%'+ @search+ '%') ";
            SqlCommand xp = new SqlCommand(str, con);
            xp.Parameters.Add("@search", SqlDbType.NVarChar).Value = txtsearch.Text;

            con.Open();
            xp.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = xp;
            DataSet ds = new DataSet();
            da.Fill(ds, "FirstName");
            gvChildren.DataSource = ds;
            gvChildren.DataBind();
            con.Close();

        }

        // export to excel

        void gvChildrenFill()
        {

            string Query = "Select * from tblchildren";
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConToSEPL"].ConnectionString);
            SqlDataAdapter adp = new SqlDataAdapter(Query, con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            gvChildren.DataSource = ds.Tables[0];
            gvChildren.DataBind();
        }
       
        public override void VerifyRenderingInServerForm(Control control)
        {
            // Can Leave This empty. 
        }
        //the btn to export to excel
        protected void lnkExport_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Clear();
                Response.Buffer = true;
                Response.AddHeader("content-disposition", "attachment;filename=ילדים.xls");
                Response.Charset = "";
                Response.ContentType = "application/vnd.ms-excel";
                StringWriter sWriter = new StringWriter();
                HtmlTextWriter hWriter = new HtmlTextWriter(sWriter);
                gvChildren.RenderControl(hWriter);
                Response.Output.Write(sWriter.ToString());
                Response.Flush();
                Response.End();
            }
            catch
            {
                throw;
            }
        }




        //establish a connection to database
        SqlConnection con = new SqlConnection(@"Data Source=tcp:sp0pklddh6.database.windows.net,1433;Initial Catalog=fannyCRAKZl3GTV1;User Id=fannyk@sp0pklddh6;Password=Daco6135");
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["username"] == null)
            {


                Response.Redirect("~/loginPage.aspx");
            }
            else
            {

            }

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
                cmd.CommandText = "Select CustomerID,FatherName,MotherName,LastName,FirstName,Taz, DOB,PhoneNumber,MobilePhone,Address,ddl_Neighborhood,Email,Klass,Grade,School,HMO, Office, Date, Worker,Comments,InfoFaceBook from tblchildren where IsActive=1";
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
            string date = "";
            date = Calendar3.SelectedDate.ToString("dd/MM/yyyy");
            txtDOB.Text = date;
          //  txtDOB.Text = Calendar3.SelectedDate.ToShortDateString();
            Calendar3.Visible = false;
        }

        //show the date of the regestrtion
        protected void Calendar4_SelectionChanged(object sender, EventArgs e)
        {
            string date = "";
            date = Calendar4.SelectedDate.ToString("dd/MM/yyyy");
            txtDate.Text = date;

           // txtDate.Text = Calendar4.SelectedDate.ToShortDateString();
            Calendar4.Visible = false;
        }

        protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
        {
            Calendar4.Visible = true;
        }



        //adding new klass to the ddl by the user
        protected void AddItem(object sender, EventArgs e)
        {
            string Klass = txtNewKlass.Text.Trim();
            if (!string.IsNullOrEmpty(Klass))
            {
                txtKlass.Items.Add(new ListItem(Klass, Klass));
            }
        }


        //button that clear all the fields
        protected void ClearControls()
        {
            try
            {

                txtNewKlass.Text = "";
                txtFatherName.Text = "";
                txtMotherName.Text = "";
                txtLastName.Text = "";
                txtFirstName.Text = "";
                txtTaz.Text = "";
                txtDOB.Text = "";
                txtPhoneNumber.Text = "";
                txtMobilePhone.Text = "";
                txtAddress.Text = "";
                txtddl_Neighborhood.ClearSelection();
                txtEmail.Text = "";
                txtKlass.ClearSelection();
                txtGrade.Text = "";
                txtSchool.Text = "";
                txtHMO.Text = "";
                txtOffice.ClearSelection();
                txtDate.Text = "";
                txtWorker.Text = "";
                txtComments.Text = "";
                InfoFaceBook.ClearSelection();
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
                cmd.CommandText = "insert into tblchildren (FatherName,MotherName,LastName,FirstName,Taz, DOB,PhoneNumber,MobilePhone,Address,ddl_Neighborhood,Email,Klass,Grade,School,HMO,Office,Date, Worker,Comments,InfoFaceBook,IsActive) values (@FatherName,@MotherName,@LastName,@FirstName,@Taz, @DOB,@PhoneNumber,@MobilePhone,@Address,@ddl_Neighborhood,@Email,@Klass,@Grade,@School,@HMO,@Office,@Date,@Worker,@Comments,@InfoFaceBook,1)";
                cmd.Parameters.AddWithValue("@FatherName", txtFatherName.Text);
                cmd.Parameters.AddWithValue("@MotherName", txtMotherName.Text);
                cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
                cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                cmd.Parameters.AddWithValue("@Taz", txtTaz.Text);
                cmd.Parameters.AddWithValue("@DOB", txtDOB.Text);
                cmd.Parameters.AddWithValue("@PhoneNumber", txtPhoneNumber.Text);
                cmd.Parameters.AddWithValue("@MobilePhone", txtMobilePhone.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@ddl_Neighborhood", txtddl_Neighborhood.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Klass", txtKlass.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Grade", txtGrade.Text);
                cmd.Parameters.AddWithValue("@School", txtSchool.Text);
                cmd.Parameters.AddWithValue("@HMO", txtHMO.Text);
                cmd.Parameters.AddWithValue("@Office", txtOffice.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Date", txtDate.Text);
                cmd.Parameters.AddWithValue("@Worker", txtWorker.Text);
                cmd.Parameters.AddWithValue("@Comments", txtComments.Text);

                string s = "";
                for (int i = 0; i < InfoFaceBook.Items.Count; i++)
                {

                    if (InfoFaceBook.Items[i].Selected)
                        s += InfoFaceBook.Items[i].Text.ToString() + ""; 
                }

                cmd.Parameters.AddWithValue("@InfoFaceBook", s);
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
                txtddl_Neighborhood.Text = (grow.FindControl("lblddl_Neighborhood") as Label).Text;
                txtEmail.Text = (grow.FindControl("lblEmail") as Label).Text;
                txtKlass.Text = (grow.FindControl("lblKlass") as Label).Text;
                txtGrade.Text = (grow.FindControl("lblGrade") as Label).Text;
                txtSchool.Text = (grow.FindControl("lblSchool") as Label).Text;
                txtHMO.Text = (grow.FindControl("lblHMO") as Label).Text;
                txtOffice.Text = (grow.FindControl("lblOffice") as Label).Text;
                txtDate.Text = (grow.FindControl("lblDate") as Label).Text;
                txtWorker.Text = (grow.FindControl("lblWorker") as Label).Text;
                txtComments.Text = (grow.FindControl("lblComments") as Label).Text;
                InfoFaceBook.Text = (grow.FindControl("lblInfoFaceBook") as Label).Text;
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
                cmd.CommandText = "update tblchildren set FatherName=@FatherName,MotherName=@MotherName,LastName=@LastName,FirstName=@FirstName,Taz=@Taz, DOB=@DOB, PhoneNumber=@PhoneNumber,MobilePhone=@MobilePhone,Address=@Address,ddl_Neighborhood=@ddl_Neighborhood,  Email=@Email, Klass=@Klass,Grade=@Grade,School=@School,HMO=@HMO, Office=@Office,Date=@Date,Worker=@Worker,Comments=@Comments, InfoFaceBook=@InfoFaceBook where CustomerID=@CustomerID";
                cmd.Parameters.AddWithValue("@FatherName", txtFatherName.Text);
                cmd.Parameters.AddWithValue("@MotherName", txtMotherName.Text);
                cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
                cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                cmd.Parameters.AddWithValue("@Taz", txtTaz.Text);
                cmd.Parameters.AddWithValue("@DOB", txtDOB.Text);
                cmd.Parameters.AddWithValue("@PhoneNumber", txtPhoneNumber.Text);
                cmd.Parameters.AddWithValue("@MobilePhone", txtMobilePhone.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@ddl_Neighborhood", txtddl_Neighborhood.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Klass", txtKlass.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Grade", txtGrade.Text);
                cmd.Parameters.AddWithValue("@School", txtSchool.Text);
                cmd.Parameters.AddWithValue("@HMO", txtHMO.Text);
                cmd.Parameters.AddWithValue("@Office", txtOffice.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Date", txtDate.Text);
                cmd.Parameters.AddWithValue("@Worker", txtWorker.Text);
                cmd.Parameters.AddWithValue("@Comments", txtComments.Text);

                string s = "";
                for (int i = 0; i < InfoFaceBook.Items.Count; i++)
                {

                    if (InfoFaceBook.Items[i].Selected)
                        s += InfoFaceBook.Items[i].Text.ToString() + ""; 
                }

                cmd.Parameters.AddWithValue("@InfoFaceBook", s);



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
                Response.Write("<script>alert('הנתונים יימחקו')</script>");
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
