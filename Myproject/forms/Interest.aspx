<%@ Page Title="לקוח מתעניין" Language="C#" MasterPageFile="~/Site.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Interest.aspx.cs" Inherits="Myproject.forms.Interest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <body dir="rtl">
        <h2><%: Title %></h2>

        <td>חיפוש לפי שם:
            <asp:TextBox ID="txtsearch" runat="server"></asp:TextBox>

            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click"
               Text="חיפוש" ValidationGroup="search" />

            <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator9" controltovalidate="txtsearch" errormessage="נא הזן שם לחיפוש " ForeColor="Red" ValidationGroup="search" ></asp:RequiredFieldValidator>


            <div>
                <table dir="rtl" align="center" style="position: relative; top: 20px;">
                    <tr>
                        <td>
                            <table align="center">
                                <tr>
                                    <td>תחום התעניינות :
                                    </td>
                                    <td>

                                        <asp:DropDownList ID="txtKlass" runat="server">
                                            <asp:ListItem>-- בחר חוג--</asp:ListItem>
                                            <asp:ListItem>אולפן רפואי</asp:ListItem>
                                            <asp:ListItem>אולפן תעסוקתי</asp:ListItem>
                                            <asp:ListItem>אנגלית</asp:ListItem>
                                            <asp:ListItem>בלט</asp:ListItem>
                                            <asp:ListItem>ג&#39;אז</asp:ListItem>
                                            <asp:ListItem>השלמת השכלה</asp:ListItem>
                                            <asp:ListItem>זומבה</asp:ListItem>
                                            <asp:ListItem>יוגה</asp:ListItem>
                                            <asp:ListItem>לימודיה</asp:ListItem>
                                            <asp:ListItem>מחשבים</asp:ListItem>
                                            <asp:ListItem>ספריה</asp:ListItem>
                                            <asp:ListItem>פיסול</asp:ListItem>
                                            <asp:ListItem>פלאטיס</asp:ListItem>
                                            <asp:ListItem>ציור</asp:ListItem>
                                            <asp:ListItem>קרטה</asp:ListItem>
                                        </asp:DropDownList>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtKlass" InitialValue="-- בחר חוג--" ErrorMessage="בחר חוג"  ForeColor="Red" />

                                    </td>
                                </tr>
                                <tr>
                                    <td>

                                        <asp:Button ID="btnAdd" runat="server" Text="הוספת חוג חדש" OnClick="AddItem" 	CausesValidation="False" />
                                    </td>
                                    <td>

                                        <asp:TextBox ID="txtNewKlass" runat="server" />
                                    </td>

                                </tr>
                                <tr>
                                    <td>סוג לקוח :
                                    </td>
                                    <td>

                                        <asp:DropDownList ID="txtddl_type_user" runat="server">
                                            <asp:ListItem>-- סוג לקוח--</asp:ListItem>
                                            <asp:ListItem>ילד</asp:ListItem>
                                            <asp:ListItem>מבוגר</asp:ListItem>                        
                                        </asp:DropDownList>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtddl_type_user" InitialValue="-- סוג לקוח--" ErrorMessage=" בחר סוג לקוח"  ForeColor="Red" />

                                    </td>
                                </tr>
                                <tr>
                                    <td>ימים מועדפים :
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtFavDays" runat="server" MaxLength="50" Width="250px"></asp:TextBox>
                                        <asp:DropDownList ID="txtddl_KlassTime" runat="server">
                                            <asp:ListItem>-- זמן החוג--</asp:ListItem>
                                            <asp:ListItem>ערב</asp:ListItem>
                                            <asp:ListItem>בוקר</asp:ListItem>

                                        </asp:DropDownList>

                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtddl_KlassTime" InitialValue="-- זמן החוג--" ErrorMessage="בחר את זמן החוג"  ForeColor="Red" />

                                    </td>

                                </tr>
                                <tr>
                                    <td>גיל :
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtAge" runat="server" MaxLength="50" Width="250px"></asp:TextBox>
                                    </td>
                                </tr>

                                <tr>
                                    <td>שם פרטי :
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtFirstName" runat="server" MaxLength="50" Width="250px"></asp:TextBox>
                                         <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator5" controltovalidate="txtFirstName" errormessage="נא הזן שם פרטי" ForeColor="Red" />
                                    </td>
                                </tr>

                                <tr>
                                    <td>שם משפחה :
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtLastName" runat="server" MaxLength="10" Width="250px"></asp:TextBox>
                                         <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator4" controltovalidate="txtLastName" errormessage="נא הזן שם משפחה" ForeColor="Red" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>טל' בבית :
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtPhoneNumber" runat="server" MaxLength="50" Width="250px"></asp:TextBox>
                                    </td>
                                </tr>

                                <tr>
                                    <td>טל' נייד :
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtMobilePhone" runat="server" MaxLength="50" Width="250px"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator6" controltovalidate="txtMobilePhone" ForeColor="red" errormessage="נא הזן מספר טלפון נייד"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td>כתובת :
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtAddress" runat="server" MaxLength="200" Width="250px"></asp:TextBox>
                                        <asp:DropDownList ID="txtddl_Neighborhood" runat="server">
                                            <asp:ListItem >-- שכונה--</asp:ListItem>
                                            <asp:ListItem>קטמונים א-ו(גוננים)</asp:ListItem>
                                            <asp:ListItem>פת</asp:ListItem>
                                            <asp:ListItem>קטמונים ח-ט</asp:ListItem>
                                            <asp:ListItem>רסקו</asp:ListItem>
                                            <asp:ListItem>קטמון הישנה</asp:ListItem>
                                            <asp:ListItem>גילה</asp:ListItem>
                                            <asp:ListItem>אחר</asp:ListItem>
                                        </asp:DropDownList>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidato32" runat="server" ControlToValidate="txtddl_Neighborhood" InitialValue="-- שכונה--" ErrorMessage="בחר שכונה"  ForeColor="Red" />
                                    </td>
                                </tr>

                                <tr>
                                    <td>דואר אלקטרוני :
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtEmail" runat="server" MaxLength="50" Width="250px"></asp:TextBox>
                                            
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                      ErrorMessage     ="דואר אלקטרוני שגוי" ControlToValidate="txtEmail"
                                      SetFocusOnError="True"
                                             ForeColor="red"
                                      ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                             
                                          </asp:RegularExpressionValidator>
                                    </td>
                                </tr>

                                <tr>
                                    <td>איך הגעת אלינו? :
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtWays" runat="server" MaxLength="50" Width="250px"></asp:TextBox>
                                    </td>
                                </tr>

                                <tr>
                                    <td>הערות :
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtComments" runat="server" MaxLength="50" Width="250px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>תאריך קשר :
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDate" runat="server" MaxLength="50" Width="250px"></asp:TextBox>
                                        <asp:ImageButton ID="ImageButton5" runat="server" Height="17px"
                                            ImageUrl="~/images/cal.jpg" OnClick="ImageButton5_Click" Width="21px"  CausesValidation="False"/>
                                        <asp:Calendar ID="Calendar5" runat="server"
                                            OnSelectionChanged="Calendar5_SelectionChanged" Visible="False" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px">
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
                                    <td>שם העובד :
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtWorker" runat="server" MaxLength="50" Width="250px"></asp:TextBox>
                                    </td>
                                </tr>

                                <tr>
                                    <td>קבלת מידע :
                                    </td>
                                    <td>
                                        <asp:CheckBoxList ID="InfoBox" runat="server" AutoPostBack="True">
                                            <asp:ListItem Text="SMS " Value="SMS"></asp:ListItem>

                                            <asp:ListItem Text="פייסבוק " Value="פייסבוק"></asp:ListItem>

                                            <asp:ListItem Text="וואטסאפ " Value="וואטסאפ"></asp:ListItem>

                                            <asp:ListItem Text="דואר אלקטרוני" Value="דואר-אלקטרוני"></asp:ListItem>

                                        </asp:CheckBoxList>

                                    </td>
                                </tr>
                                <tr>
                                    <td>תאור השיחה :
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtDescrip" runat="server" MaxLength="50" Width="250px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" align="center">

                                        <asp:Button ID="btnSave" runat="server" Text="שמור" OnClick="btnSave_Click" />

                                        <asp:Button ID="btnUpdate" runat="server" Text="עדכן" Visible="false" OnClick="btnUpdate_Click" />

                                        <asp:Button ID="btnClear" runat="server" Text="נקה" OnClick="btnClear_Click"  CausesValidation="False" />

                                        <asp:Button ID="btnLinking" runat="server" Text="שרשר" Visible="false" OnClick="btnLinking_Click"  CausesValidation="False" />

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
                            <asp:LinkButton ID="lnkExport" runat="server" Text="יצוא לאקסל" OnClick="lnkExport_Click" ForeColor="Red" CausesValidation="False"></asp:LinkButton>

                            <asp:GridView ID="gvInter" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True"
                                EmptyDataText="לא נמצאו רשומות" GridLines="Vertical" CssClass="gv" EmptyDataRowStyle-ForeColor="Red" CellPadding="4" ForeColor="#333333">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>

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
                                    <asp:TemplateField HeaderText="כתובת דואר אלקטרוני">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("Email") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="איך הגעתם אלינו?">
                                        <ItemTemplate>
                                            <asp:Label ID="lblWays" runat="server" Text='<%#Eval("Ways") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="הערות">
                                        <ItemTemplate>
                                            <asp:Label ID="lblComments" runat="server" Text='<%#Eval("Comments") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="תאריך קשר">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDate" runat="server" Text='<%#Eval("Date") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="שם העובד">
                                        <ItemTemplate>
                                            <asp:Label ID="lblWorker" runat="server" Text='<%#Eval("Worker") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="קבלת מידע">
                                        <ItemTemplate>
                                            <asp:Label ID="lblInfoBox" runat="server" Text='<%#Eval("Info")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="תאור השיחה">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDescrip" runat="server" Text='<%#Eval("Descrip")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="פעולה">
                                        <ItemTemplate>
                                            <asp:Button ID="btnEdit" runat="server" Text="ערוך" OnClick="btnEdit_Click" CausesValidation="False" />
                                            <asp:Button ID="btnDelete" runat="server" Text="מחק" OnClientClick="האם למחוק???" OnClick="btnDelete_Click" />
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
