<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="View Student Profile.aspx.cs" Inherits="Admin.View_Student_Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Table ID="Table1" align="center" runat="server" Caption="My Details" GridLines="Both" Width="764px">
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">ID</asp:TableCell>
                    <asp:TableCell runat="server">First Name</asp:TableCell>
                    <asp:TableCell runat="server">Last Name</asp:TableCell>
                    <asp:TableCell runat="server">Type</asp:TableCell>
                    <asp:TableCell runat="server">Faculty</asp:TableCell>
                    <asp:TableCell runat="server">Address</asp:TableCell>
                    <asp:TableCell runat="server">GPA</asp:TableCell>
                    <asp:TableCell runat="server">Undergrad ID</asp:TableCell>
                    <asp:TableCell runat="server">Email</asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </form>
</body>
</html>
