
<%@ Page Title="הנפקת דוחות" Language="C#" MasterPageFile="~/Site.Master"  AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="Myproject.forms.Reports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <body dir="rtl">
    <h2 ><%: Title %></h2>
  <br>  <br />
    <br />
          דוחות
        
<br />

    <div >  
   <table dir="rtl">
    <tr>

           
             <asp:DropDownList ID="ddl_ItemSearch" runat="server">
      <asp:ListItem >-- קטגוריה--</asp:ListItem> 
        <asp:ListItem>מבוגר</asp:ListItem>
        <asp:ListItem>ילד</asp:ListItem>            
        <asp:ListItem>מתעניין</asp:ListItem>
    </asp:DropDownList>


   <asp:DropDownList ID="ddl_ItemSearch1" runat="server" AutoPostBack = "true" >
    <asp:ListItem >-- קטגוריה--</asp:ListItem> 
       <asp:ListItem>דואר אלקטרוני</asp:ListItem>
       <asp:ListItem>חוגים</asp:ListItem>            
        <asp:ListItem>טלפון נייד</asp:ListItem>
       <asp:ListItem>סטטוס</asp:ListItem> 
       <asp:ListItem>שכונה</asp:ListItem>
    </asp:DropDownList>


        <asp:TextBox ID="txtSearchName" runat="server"></asp:TextBox>


        <asp:Button ID="btnSearch_Click" runat="server" Text="חיפוש"  OnClick="btnSearch_Click_Click"  />



        <p>
   
         <asp:LinkButton ID="ExportToExcel" runat="server" Text="יצוא לאקסל" OnClick="ExportToExcelButton_Click"  ForeColor="Red"></asp:LinkButton>
         
            </p>




              <asp:GridView ID="gvAdult" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True"
                        EmptyDataText="לא נמצאו רשומות" GridLines="Vertical" CssClass="gv" EmptyDataRowStyle-ForeColor="Red" CellPadding="4" ForeColor="#333333">
                                 <AlternatingRowStyle BackColor="White" />
                        <Columns >
                            <asp:TemplateField HeaderText="שם פרטי" >
                                <ItemTemplate >
                                    <asp:Label ID="lblFirstName" runat="server" Text='<%#Eval("FirstName") %>'></asp:Label>
                                </ItemTemplate>
                                 </asp:TemplateField>

                                <asp:TemplateField HeaderText="שם משפחה">
                                <ItemTemplate>
                                    <asp:Label ID="lblLastName" runat="server" Text='<%#Eval("LastName") %>'></asp:Label>
                                </ItemTemplate>
                                     </asp:TemplateField>
                           
                            <asp:TemplateField HeaderText="תז">
                                <ItemTemplate>
                                    <asp:Label ID="lblTaz" runat="server" Text='<%#Eval("Taz") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="ת.לידה">
                                <ItemTemplate>
                                    <asp:Label ID="lblDOB" runat="server" Text='<%#Eval("DOB") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="גיל">
                                <ItemTemplate>
                                    <asp:Label ID="lblAge" runat="server" Text='<%#Eval("Age") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="טל' בבית">
                                <ItemTemplate>
                                    <asp:Label ID="lblPhoneNumber" runat="server" Text='<%#Eval("PhoneNumber") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="טל' נייד">
                                <ItemTemplate>
                                    <asp:Label ID="lblMobilePhone" runat="server" Text='<%#Eval("MobilePhone") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="כתובת">
                                <ItemTemplate>
                                    <asp:Label ID="lblAddress" runat="server" Text='<%#Eval("Address") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="שכונה">
                                <ItemTemplate>
                                    <asp:Label ID="lblddl_Neighborhood" runat="server" Text='<%#Eval("ddl_Neighborhood") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="דואר אלקטרוני">
                                <ItemTemplate>
                                    <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("Email") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="משתתף בחוג" >
                                <ItemTemplate>
                                    <asp:Label ID="lblKlass" runat="server" Text='<%#Eval("Klass") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="סטטוס" >
                                <ItemTemplate>
                                    <asp:Label ID="lblOffice" runat="server" Text='<%#Eval("Office") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="תאריך ביצוע" >
                                <ItemTemplate>
                                    <asp:Label ID="lblDate" runat="server" Text='<%#Eval("Date") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="שם העובד" >
                                <ItemTemplate>
                                    <asp:Label ID="lblWorker" runat="server" Text='<%#Eval("Worker") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="הערות" >
                                <ItemTemplate>
                                    <asp:Label ID="lblComments" runat="server" Text='<%#Eval("Comments") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="פייסבוק" >
                                <ItemTemplate>
                                    <asp:Label ID="lblInfoFaceBook" runat="server" Text='<%#Eval("InfoFaceBook") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                              

            </Columns>
                                  <EditRowStyle BackColor="#2461BF" />

<EmptyDataRowStyle ForeColor="Red"></EmptyDataRowStyle>
                                 <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                 <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" BorderStyle="None" />
                                 <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                 <RowStyle BackColor="#EFF3FB" />
                                 <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                 <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                 <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                 <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                 <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
        </asp:GridView>


              <asp:GridView ID="gvChildren" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True"
                        EmptyDataText="לא נמצאו רשומות" GridLines="Vertical" CssClass="gv" EmptyDataRowStyle-ForeColor="Red" CellPadding="4" ForeColor="#333333" Width="1200px" HorizontalAlign="Justify">
                                 <AlternatingRowStyle BackColor="White" />
                        <Columns >
                            <asp:TemplateField HeaderText="שם האב">
                                <ItemTemplate>
                                    <asp:Label ID="lblFatherName" runat="server" Text='<%#Eval("FatherName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="שם האם">
                                <ItemTemplate>
                                    <asp:Label ID="lblMotherName" runat="server" Text='<%#Eval("MotherName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="שם משפחה">
                                <ItemTemplate>
                                    <asp:Label ID="lblLastName" runat="server" Text='<%#Eval("LastName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="שם הילד">
                                <ItemTemplate>
                                    <asp:Label ID="lblFirstName" runat="server" Text='<%#Eval("FirstName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="תז">
                                <ItemTemplate>
                                    <asp:Label ID="lblTaz" runat="server" Text='<%#Eval("Taz") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ת.לידה">
                                <ItemTemplate>
                                    <asp:Label ID="lblDOB" runat="server" Text='<%#Eval("DOB") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="טל' בבית">
                                <ItemTemplate>
                                    <asp:Label ID="lblPhoneNumber" runat="server" Text='<%#Eval("PhoneNumber") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="טל' נייד">
                                <ItemTemplate>
                                    <asp:Label ID="lblMobilePhone" runat="server" Text='<%#Eval("MobilePhone") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="כתובת">
                                <ItemTemplate>
                                    <asp:Label ID="lblAddress" runat="server" Text='<%#Eval("Address") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="שכונה">
                                <ItemTemplate>
                                    <asp:Label ID="lblddl_Neighborhood" runat="server" Text='<%#Eval("ddl_Neighborhood") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="דואר אלקטרוני">
                                <ItemTemplate>
                                    <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("Email") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="משתתף בחוג" >
                                <ItemTemplate>
                                    <asp:Label ID="lblKlass" runat="server" Text='<%#Eval("Klass") %>'></asp:Label>
                                </ItemTemplate>
                                </asp:TemplateField>


                                <asp:TemplateField HeaderText="כיתה">
                                <ItemTemplate>
                                    <asp:Label ID="lblGrade" runat="server" Text='<%#Eval("Grade") %>'></asp:Label>
                                </ItemTemplate>
                                    </asp:TemplateField>


                            <asp:TemplateField HeaderText="בית ספר/גן">
                                <ItemTemplate>
                                    <asp:Label ID="lblSchool" runat="server" Text='<%#Eval("School") %>'></asp:Label>
                                </ItemTemplate>
                                 </asp:TemplateField>

                            <asp:TemplateField HeaderText="קופח">
                                <ItemTemplate>
                                    <asp:Label ID="lblHMO" runat="server" Text='<%#Eval("HMO") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="סטטוס" >
                                <ItemTemplate>
                                    <asp:Label ID="lblOffice" runat="server" Text='<%#Eval("Office") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="תאריך ביצוע" >
                                <ItemTemplate>
                                    <asp:Label ID="lblDate" runat="server" Text='<%#Eval("Date") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="שם העובד" >
                                <ItemTemplate>
                                    <asp:Label ID="lblWorker" runat="server" Text='<%#Eval("Worker") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="הערות" >
                                <ItemTemplate>
                                    <asp:Label ID="lblComments" runat="server" Text='<%#Eval("Comments") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                             <asp:TemplateField HeaderText="פייסבוק" >
                                <ItemTemplate>
                                    <asp:Label ID="lblInfoFaceBook" runat="server" Text='<%#Eval("InfoFaceBook") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>


                           
                        
                        </Columns>
                                 <EditRowStyle BackColor="#2461BF" />

<EmptyDataRowStyle ForeColor="Red"></EmptyDataRowStyle>
                                 <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                 <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" BorderStyle="None" />
                                 <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                 <RowStyle BackColor="#EFF3FB" />
                                 <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                 <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                 <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                 <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                 <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>







                        <asp:GridView ID="gvInter" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True"
                        EmptyDataText="לא נמצאו רשומות" GridLines="Vertical" CssClass="gv" EmptyDataRowStyle-ForeColor="Red" CellPadding="4" ForeColor="#333333">
                                 <AlternatingRowStyle BackColor="White" />


                        <Columns >

    




                    
                            <asp:TemplateField HeaderText="תחום התעניינות">
                                <ItemTemplate>
                                    <asp:Label ID="lblKlass" runat="server" Text='<%#Eval("Klass") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="סוג לקוח">
                                <ItemTemplate>
                                    <asp:Label ID="lblddl_type_user" runat="server" Text='<%#Eval("ddl_type_user") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ימים מועדפים">
                                <ItemTemplate>
                                    <asp:Label ID="lblFavDays" runat="server" Text='<%#Eval("FavDays") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="זמן החוג">
                                <ItemTemplate>
                                    <asp:Label ID="lblddl_KlassTime" runat="server" Text='<%#Eval("ddl_KlassTime") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                           

                            <asp:TemplateField HeaderText="גיל">
                                <ItemTemplate>
                                    <asp:Label ID="lblAge" runat="server" Text='<%#Eval("Age") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="שם פרטי">
                                <ItemTemplate>
                                    <asp:Label ID="lblFirstName" runat="server" Text='<%#Eval("FirstName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="שם משפחה">
                                <ItemTemplate>
                                    <asp:Label ID="lblLastName" runat="server" Text='<%#Eval("LastName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="טל' פרטי">
                                <ItemTemplate>
                                    <asp:Label ID="lblPhoneNumber" runat="server" Text='<%#Eval("PhoneNumber") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="טל' נייד">
                                <ItemTemplate>
                                    <asp:Label ID="lblMobilePhone" runat="server" Text='<%#Eval("MobilePhone") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="כתובת">
                                <ItemTemplate>
                                    <asp:Label ID="lblAddress" runat="server" Text='<%#Eval("Address") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="שכונה">
                                <ItemTemplate>
                                    <asp:Label ID="lblddl_Neighborhood" runat="server" Text='<%#Eval("ddl_Neighborhood") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="כתובת דואר אלקטרוני" >
                                <ItemTemplate>
                                    <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("Email") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="איך הגעתם אלינו?" >
                                <ItemTemplate>
                                    <asp:Label ID="lblWays" runat="server" Text='<%#Eval("Ways") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="הערות" >
                                <ItemTemplate>
                                    <asp:Label ID="lblComments" runat="server" Text='<%#Eval("Comments") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="תאריך קשר" >
                                <ItemTemplate>
                                    <asp:Label ID="lblDate" runat="server" Text='<%#Eval("Date") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="שם העובד" >
                                <ItemTemplate>
                                    <asp:Label ID="lblWorker" runat="server" Text='<%#Eval("Worker") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                           <asp:TemplateField HeaderText="קבלת מידע" >
                                <ItemTemplate>
                                    <asp:Label ID="lblInfoBox" runat="server" Text='<%#Eval("Info")%>'></asp:Label>
              
                                   
                                </ItemTemplate>
                            </asp:TemplateField>





                      
                        </Columns>
                                 <EditRowStyle BackColor="#2461BF" />

<EmptyDataRowStyle ForeColor="Red"></EmptyDataRowStyle>
                                 <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                 <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                 <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                 <RowStyle BackColor="#EFF3FB" />
                                 <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                 <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                 <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                 <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                 <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
    </div>


</body>

    </asp:Content>