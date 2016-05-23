﻿

<%@ Page Title="משתמש חדש- מבוגר" Language="C#" MasterPageFile="~/Site.Master"  AutoEventWireup="true"  enableEventValidation ="false" Codefile="adult.aspx.cs" Inherits="Myproject.forms.adult" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <body dir="rtl" >
    <h2><%: Title %></h2>


    
     <td> 
       חיפוש לפי שם: <asp:TextBox ID="txtsearch" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click"
        Text="חיפוש" />
    <div>
        <table dir="rtl" align="center" style="position: relative; top: 20px;">
            <tr>
                <td>
                    <table align="center">
                        <tr>
                            <td>
                               שם פרטי :
                            </td>
                            <td>
                                <asp:TextBox ID="txtFirstName" runat="server" MaxLength="50" Width="250px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                              שם משפחה :
                            </td>
                            <td>
                                <asp:TextBox ID="txtLastName" runat="server" MaxLength="50" Width="250px"></asp:TextBox>
                            </td>
                        </tr>


                         <tr>
                            <td>
                               ת"ז :
                            </td>
                            <td>
                                <asp:TextBox ID="txtTaz" runat="server" MaxLength="50" Width="250px" ValidateRequestMode="Inherit"></asp:TextBox>
                            </td>
                        </tr>




                         <tr>
                            <td>
                     ת. לידה :
                            </td>
                            <td>
                                <asp:TextBox ID="txtDOB" runat="server" MaxLength="50" Width="250px"></asp:TextBox>
                                 <asp:ImageButton ID="ImageButton1" runat="server" Height="17px"
                                        ImageUrl="~/images/cal.jpg" onclick="ImageButton1_Click" Width="21px" />
                                        <asp:Calendar ID="Calendar1" runat="server"
                                          onselectionchanged="Calendar1_SelectionChanged" Visible="False" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px">
                                            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                                            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                                            <OtherMonthDayStyle ForeColor="#999999" />
                                            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                                            <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                                            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                                            <WeekendDayStyle BackColor="#CCCCFF" />
                                       </asp:Calendar>
                                </tr>

                        <tr>
                                    <td>
            גיל :
                            </td>
                           <td>
                                <asp:TextBox ID="txtAge" runat="server" MaxLength="50" Width="50px"></asp:TextBox>
                               
                               
                               <asp:rangevalidator errormessage="Please enter value between 10-20." forecolor="Red" controltovalidate="txtAge" minimumvalue="18" maximumvalue="99" runat="server">
            </asp:rangevalidator></td>


                            </td>


                            </tr>
                        

                        <tr>
                            <td>
                              טל' בבית :
                                                           </td>
                            <td>
                                <asp:TextBox ID="txtPhoneNumber" runat="server" MaxLength="10" Width="250px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                               טל' נייד :
                            </td>
                            <td>
                                <asp:TextBox ID="txtMobilePhone" runat="server" MaxLength="50" Width="250px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                               כתובת :
                            </td>
                            <td>
                                <asp:TextBox ID="txtAddress" runat="server" MaxLength="200" Width="250px"></asp:TextBox>
                                 <asp:DropDownList ID="txtddl_Neighborhood" runat="server">
                                    <asp:ListItem Value="">-- שכונה--</asp:ListItem> 
                                    <asp:ListItem>קטמונים א-ו(גוננים)</asp:ListItem>
                                    <asp:ListItem>פת</asp:ListItem>
                                    <asp:ListItem>קטמונים ח-ט</asp:ListItem>
                                    <asp:ListItem>רסקו</asp:ListItem> 
                                    <asp:ListItem>קטמון הישנה</asp:ListItem>
                                    <asp:ListItem>גילה</asp:ListItem>
                                     <asp:ListItem>אחר</asp:ListItem>
                                </asp:DropDownList>

                            </td>
                        </tr>

                        <tr>
                            <td>
                               דואר אלקטרוני :
                            </td>
                            <td>
                                <asp:TextBox ID="txtEmail" runat="server" MaxLength="50" Width="250px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
              
                                 <asp:Button ID="btnAdd" runat="server" Text="הוספת חוג חדש" OnClick="AddItem" />
                            </td>
                            <td>

                                <asp:TextBox ID="txtNewKlass" runat="server" />
                            </td>



                        </tr>
                        <tr>
                            <td>
                     משתתף בחוג :
                            </td>
                            <td>

                                <asp:DropDownList ID="txtKlass" runat="server">
                                    <asp:ListItem Value="15">-- בחר חוג--</asp:ListItem> 
                                    <asp:ListItem>אולפן רפואי</asp:ListItem>
                                    <asp:ListItem>אולפן תעסוקתי</asp:ListItem>
                                    <asp:ListItem>אנגלית</asp:ListItem>
                                    <asp:ListItem>בלט</asp:ListItem>
                                    <asp:ListItem>ג&#39;אז</asp:ListItem>
                                    <asp:ListItem>פיסולהשלמת השכלה</asp:ListItem>
                                    <asp:ListItem>זומבה</asp:ListItem>
                                    <asp:ListItem>יוגה</asp:ListItem>
                                    <asp:ListItem>לימודיה</asp:ListItem>
                                    <asp:ListItem>מחשבים</asp:ListItem>
                                    <asp:ListItem>ספריה</asp:ListItem> 
                                    <asp:ListItem>פלאטיס</asp:ListItem>
                                    <asp:ListItem>ציור</asp:ListItem>
                                    <asp:ListItem>קרטה</asp:ListItem>
                                </asp:DropDownList>

                                 <tr>
                            <td>
                             סטטוס :
                                      </td>
                            <td>
                                <asp:DropDownList ID="txtOffice" runat="server">
                                    <asp:ListItem Value="0">-- סטטוס--</asp:ListItem> 
                                    <asp:ListItem>בהמתנה לפתיחה</asp:ListItem>
                                    <asp:ListItem>הקפאה</asp:ListItem>
                                    <asp:ListItem>עזב</asp:ListItem>
                                    <asp:ListItem>רשום</asp:ListItem>
                                </asp:DropDownList>

                               
                            </td>
                        </tr>

                                 <tr>
                            <td>
                             תאריך ביצוע :
                            </td>
                            <td>
                                <asp:TextBox ID="txtDate" runat="server" MaxLength="50" Width="250px"></asp:TextBox>
                                 <asp:ImageButton ID="ImageButton2" runat="server" Height="17px"
                                        ImageUrl="~/images/cal.jpg" onclick="ImageButton2_Click" Width="21px" />
                                        <asp:Calendar ID="Calendar2" runat="server"
                                          onselectionchanged="Calendar2_SelectionChanged" Visible="False" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px">
                                            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                                            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                                            <OtherMonthDayStyle ForeColor="#999999" />
                                            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                                            <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                                            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                                            <WeekendDayStyle BackColor="#CCCCFF" />
                                       </asp:Calendar>
                            </td>
                        </tr>

                                <tr>
                            <td>
                             שם העובד :
                            </td>
                            <td>
                                <asp:TextBox ID="txtWorker" runat="server" MaxLength="50" Width="250px"></asp:TextBox>
                            </td>
                        </tr>
                             <tr>
                            <td>
                             הערות :
                            </td>
                            <td>
                                <asp:TextBox ID="txtComments" runat="server" MaxLength="50" Width="250px"></asp:TextBox>
                            </td>
                        </tr>

                            </td>
                        </tr>

                         <tr>
                            <td>
                          מתעדכן בדף הפייסבוק? 
                            </td>
                            <td>



                                <asp:CheckBoxList ID="InfoFaceBook" runat="server"       AutoPostBack ="True"> 
                                    
                                    
                                
                                
                                     <asp:ListItem text="כן " Value="כן"></asp:ListItem>
                                

                               
                                         <asp:ListItem text="לא " Value="לא"></asp:ListItem>
                                      

                                
                               
                                     
                                    </asp:CheckBoxList>
                               
                                    
                                    

                                
                                
                               
                                 
                            </td>
                        </tr>

                        <tr>
                            <td colspan="2" align="center">
                              
                                <asp:Button ID="btnSave" runat="server" Text="שמור"  OnClick="btnSave_Click" />

                                <asp:Button ID="btnUpdate" runat="server" Text="עדכן"  Visible="false" OnClick="btnUpdate_Click"/>


                                <asp:Button ID="btnClear" runat="server" Text="נקה"  OnClick="btnClear_Click" />
                                
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <br />

                                       <asp:Label ID="lblMessage" runat="server" EnableViewState="false" ForeColor="Blue"></asp:Label>

                  
                </td>
            </tr>
            <tr dir="rtl">
                <td dir="rtl">

                    	
                             <asp:LinkButton ID="lnkExport" runat="server" Text="יצוא לאקסל" onclick="lnkExport_Click"></asp:LinkButton>
                        
                        
                        
       
                             
                  
                    
                   
                    
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



                            <asp:TemplateField HeaderText="פעולה">
                                <ItemTemplate>
                                    <asp:Button ID="btnEdit" runat="server" Text="ערוך" OnClick="btnEdit_Click" />
                                    <asp:Button ID="btnDelete" runat="server" Text="מחק"  OnClientClick="האם למחוק???"  OnClick="btnDelete_Click" />
                                    <asp:Label ID="lblCustomerID" runat="server" Text='<%#Eval("CustomerID") %>' Visible="false"></asp:Label>
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

                </td>
            </tr>
        </table>
       <input type="hidden" runat="server" id="hidCustomerID" />
    </div>
  
</body>

</asp:Content>
