<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student View Thesis.aspx.cs" Inherits="Admin.Student_View_Thesis" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Table ID="Table1" runat="server" Caption="Thesis Details" GridLines="Both" Width="827px">

                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">Serial Number</asp:TableCell>
                    <asp:TableCell runat="server">Field</asp:TableCell>
                    <asp:TableCell runat="server">Type</asp:TableCell>
                    <asp:TableCell runat="server">Title</asp:TableCell>
                    <asp:TableCell runat="server">Start Date</asp:TableCell>
                    <asp:TableCell runat="server">End Date</asp:TableCell>
                    <asp:TableCell runat="server">Defense Date</asp:TableCell>
                    <asp:TableCell runat="server">Years</asp:TableCell>
                    <asp:TableCell runat="server">Grade</asp:TableCell>
                    <asp:TableCell runat="server">Payment ID</asp:TableCell>
                    <asp:TableCell runat="server">Number of Extensions</asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </form>
</body>
</html>
