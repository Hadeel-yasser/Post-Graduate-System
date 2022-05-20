<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Examiner List Theses.aspx.cs" Inherits="Admin.Examiner_List_Theses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Table ID="Table1" align="center" runat="server" Caption="Theses I Attend" GridLines="Both" Width="547px">
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">Thesis Title</asp:TableCell>
                    <asp:TableCell runat="server">Student First Name</asp:TableCell>
                    <asp:TableCell runat="server">Student Last Name</asp:TableCell>
                    <asp:TableCell runat="server">Supervisor Name</asp:TableCell>
                </asp:TableRow>
                </asp:Table>

        </div>
    </form>
</body>
</html>
