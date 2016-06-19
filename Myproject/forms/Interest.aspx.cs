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
using System.Collections.Specialized;


namespace Myproject.forms
{
    public partial class Interest : System.Web.UI.Page
    {

        // function of the search button- filter the gridview by name
        protected void Button1_Click(object sender, EventArgs e)
        {
            String str = "select* from tblInter where(FirstName like '%'+ @search+ '%') ";
            SqlCommand xp = new SqlCommand(str, con);
            xp.Parameters.Add("@search", SqlDbType.NVarChar).Value = txtsearch.Text;
            con.Open();
            xp.ExecuteNonQuery();
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = xp;
            DataSet ds = new DataSet();
            da.Fill(ds, "FirstName");
            gvInter.DataSource = ds;
            gvInter.DataBind();
            con.Close();
        }



        // export to excel
        void gvInterFill()
        {

            string Query = "Select * from tblInter";
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConToSEPL"].ConnectionString);
            SqlDataAdapter adp = new SqlDataAdapter(Query, con);
            DataSet ds = new DataSet();
            adp.Fill(ds);
            gvInter.DataSource = ds.Tables[0];
            gvInter.DataBind();
        }
       
        public override void VerifyRenderingInServerForm(Control control)
        {
            // Can Leave This empty. 
        }


        //export the data into excel file
        protected void lnkExport_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Clear();
                Response.Buffer = true;
                Response.AddHeader("content-disposition", "attachment;filename=Interests.xls");
                Response.Charset = "";
                Response.ContentType = "application/vnd.ms-excel";
                StringWriter sWriter = new StringWriter();
                HtmlTextWriter hWriter = new HtmlTextWriter(sWriter);
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


        //show the date of the regestrtion
        protected void Calendar5_SelectionChanged(object sender, EventArgs e)
        {
            string date = "";
            date = Calendar5.SelectedDate.ToString("dd/MM/yyyy");
            txtDate.Text = date;
          //  txtDate.Text = Calendar5.SelectedDate.ToShortDateString();
            Calendar5.Visible = false;
        }

        protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
        {
            Calendar5.Visible = true;
            

        }


        //establish a  connection to database
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
                cmd.CommandText = "Select CustomerID,Klass,ddl_type_user,FavDays,ddl_KlassTime,Age,FirstName,LastName,PhoneNumber,MobilePhone,Address,ddl_Neighborhood,Email,Ways, Comments, Date,Worker, Info, Descrip from tblInter where IsActive=1";
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




        // the clear button clear all the fields
        protected void ClearControls()
        {
            try
            {
                txtNewKlass.Text = "";
                txtKlass.ClearSelection();
                txtddl_type_user.ClearSelection();
                txtFavDays.Text = "";
                txtddl_KlassTime.ClearSelection();
                txtAge.Text = "";
                txtFirstName.Text = "";
                txtLastName.Text = "";
                txtPhoneNumber.Text = "";
                txtMobilePhone.Text = "";
                txtAddress.Text = "";
                txtddl_Neighborhood.ClearSelection();
                txtEmail.Text = "";
                txtWays.Text = "";
                txtDate.Text = "";
                txtWorker.Text = "";
                txtComments.Text = "";
                InfoBox.ClearSelection();
                txtDescrip.Text = "";
                hidCustomerID.Value = "";
                btnSave.Visible = true;
                btnUpdate.Visible = false;
                btnLinking.Visible = false;
            }
            catch
            {

                throw;
            }
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



        // function of the save buttun
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "insert into tblInter (Klass,ddl_type_user,FavDays, ddl_KlassTime,Age,FirstName, LastName,PhoneNumber,MobilePhone,Address,ddl_Neighborhood,Email,Ways,Comments,Date,Worker,Info,Descrip, IsActive) values (@Klass,@ddl_type_user,@FavDays,@ddl_KlassTime, @Age,@FirstName, @LastName,@PhoneNumber,@MobilePhone,@Address,@ddl_Neighborhood,@Email,@Ways,@Comments,@Date,@Worker,@Info,@Descrip, 1)";
                cmd.Parameters.AddWithValue("@Klass", txtKlass.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@ddl_type_user", txtddl_type_user.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@FavDays", txtFavDays.Text);
                cmd.Parameters.AddWithValue("@ddl_KlassTime", txtddl_KlassTime.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Age", txtAge.Text);
                cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
                cmd.Parameters.AddWithValue("@PhoneNumber", txtPhoneNumber.Text);
                cmd.Parameters.AddWithValue("@MobilePhone", txtMobilePhone.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@ddl_Neighborhood", txtddl_Neighborhood.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Ways", txtWays.Text);
                cmd.Parameters.AddWithValue("@Comments", txtComments.Text);
                cmd.Parameters.AddWithValue("@Date", txtDate.Text);
                cmd.Parameters.AddWithValue("@Worker", txtWorker.Text);
                string s = "";
                for (int i = 0; i < InfoBox.Items.Count; i++)
                {
                    if (InfoBox.Items[i].Selected)//changed 1 to i 
                        s += InfoBox.Items[i].Text.ToString() + ""; //changed 1 to i
                }
                cmd.Parameters.AddWithValue("@Info", s);
                cmd.Parameters.AddWithValue("@Descrip", txtDescrip.Text);
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
                txtddl_type_user.Text = (grow.FindControl("lblddl_type_user") as Label).Text;
                txtFavDays.Text = (grow.FindControl("lblFavDays") as Label).Text;
                txtddl_KlassTime.Text = (grow.FindControl("lblddl_KlassTime") as Label).Text;
                txtAge.Text = (grow.FindControl("lblAge") as Label).Text;
                txtFirstName.Text = (grow.FindControl("lblFirstName") as Label).Text;
                txtLastName.Text = (grow.FindControl("lblLastName") as Label).Text;
                txtPhoneNumber.Text = (grow.FindControl("lblPhoneNumber") as Label).Text;
                txtMobilePhone.Text = (grow.FindControl("lblMobilePhone") as Label).Text;
                txtAddress.Text = (grow.FindControl("lblAddress") as Label).Text;
                txtddl_Neighborhood.Text = (grow.FindControl("lblddl_Neighborhood") as Label).Text;
                txtEmail.Text = (grow.FindControl("lblEmail") as Label).Text;
                txtWays.Text = (grow.FindControl("lblWays") as Label).Text;
                txtComments.Text = (grow.FindControl("lblComments") as Label).Text;
                txtDate.Text = (grow.FindControl("lblDate") as Label).Text;
                txtWorker.Text = (grow.FindControl("lblWorker") as Label).Text;
               InfoBox.Text = (grow.FindControl("lblInfoBox") as Label).Text;
                txtDescrip.Text = (grow.FindControl("lblDescrip") as Label).Text;
                btnSave.Visible = false;
                btnUpdate.Visible = true;
                btnLinking.Visible = true;
            }
            catch
            {

            }
        }



        // function of the linking buttun
        protected void btnLinking_Click(object sender, EventArgs e)
        {

            try{
             SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "insert into tblInter (Klass,ddl_type_user,FavDays, ddl_KlassTime,Age,FirstName, LastName,PhoneNumber,MobilePhone,Address,ddl_Neighborhood,Email,Ways,Comments,Date,Worker,Info,Descrip, IsActive) values (@Klass,@ddl_type_user,@FavDays,@ddl_KlassTime, @Age,@FirstName, @LastName,@PhoneNumber,@MobilePhone,@Address,@ddl_Neighborhood,@Email,@Ways,@Comments,@Date,@Worker,@Info,@Descrip, 1)";
                cmd.Parameters.AddWithValue("@Klass", txtKlass.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@ddl_type_user", txtddl_type_user.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@FavDays", txtFavDays.Text);
                cmd.Parameters.AddWithValue("@ddl_KlassTime", txtddl_KlassTime.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Age", txtAge.Text);
                cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
                cmd.Parameters.AddWithValue("@PhoneNumber", txtPhoneNumber.Text);
                cmd.Parameters.AddWithValue("@MobilePhone", txtMobilePhone.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@ddl_Neighborhood", txtddl_Neighborhood.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Ways", txtWays.Text);
                cmd.Parameters.AddWithValue("@Comments", txtComments.Text);
                cmd.Parameters.AddWithValue("@Date", txtDate.Text);
                cmd.Parameters.AddWithValue("@Worker", txtWorker.Text);
                string s = "";
                for (int i = 0; i < InfoBox.Items.Count; i++)
                {
                    if (InfoBox.Items[i].Selected)
                        s += InfoBox.Items[i].Text.ToString() + ""; 
                }
                cmd.Parameters.AddWithValue("@Info", s);
                cmd.Parameters.AddWithValue("@Descrip", txtDescrip.Text);
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



        // function of the update buttun
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "update tblInter set Klass=@Klass,ddl_type_user=@ddl_type_user,FavDays=@FavDays,ddl_KlassTime=@ddl_KlassTime,Age=@Age, FirstName=@FirstName, LastName=@LastName,PhoneNumber=@PhoneNumber,MobilePhone=@MobilePhone,Address=@Address,ddl_Neighborhood=@ddl_Neighborhood, Email=@Email,Ways=@Ways, Comments=@Comments, Date=@Date , Worker=@Worker,Info=@Info, Descrip=@Descrip where CustomerID=@CustomerID";
                cmd.Parameters.AddWithValue("@Klass", txtKlass.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@ddl_type_user", txtddl_type_user.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@FavDays", txtFavDays.Text);
                cmd.Parameters.AddWithValue("@ddl_KlassTime", txtddl_KlassTime.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Age", txtAge.Text);
                cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
                cmd.Parameters.AddWithValue("@PhoneNumber", txtPhoneNumber.Text);
                cmd.Parameters.AddWithValue("@MobilePhone", txtMobilePhone.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@ddl_Neighborhood", txtddl_Neighborhood.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Ways", txtWays.Text);
                cmd.Parameters.AddWithValue("@Date", txtDate.Text);
                cmd.Parameters.AddWithValue("@Comments", txtComments.Text);
                cmd.Parameters.AddWithValue("@Worker", txtWorker.Text);
                string s = "";
                for (int i = 0; i < InfoBox.Items.Count; i++)
                {
                    if (InfoBox.Items[i].Selected)
                        s += InfoBox.Items[i].Text.ToString() + ""; 
                }
                cmd.Parameters.AddWithValue("@Info", s);
                cmd.Parameters.AddWithValue("@Descrip", txtDescrip.Text);
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
