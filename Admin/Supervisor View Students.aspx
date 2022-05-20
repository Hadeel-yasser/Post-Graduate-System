<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Supervisor View Students.aspx.cs" Inherits="Admin.Supervisor_View_Students" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
            <asp:Table ID="Table1" runat="server" Caption="My Students" GridLines="Both" HorizontalAlign="Center" Width="232px">

                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">First Name</asp:TableCell>
                    <asp:TableCell runat="server">Last Name</asp:TableCell>
                    <asp:TableCell runat="server">Years</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                </asp:TableRow>
            </asp:Table>
        </div>
    </form>
</body>
</html>
