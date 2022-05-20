<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CoursesAndGrades.aspx.cs" Inherits="Admin.CoursesAndGrades" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Table ID="Table1" align="center" runat="server" Caption="Courses Details" GridLines="Both" Width="547px">
                <asp:TableRow runat="server">
                   <asp:TableCell runat="server">Course ID</asp:TableCell>
                   <asp:TableCell runat="server">Fees</asp:TableCell>
                    <asp:TableCell runat="server">Credit Hours</asp:TableCell>
                    <asp:TableCell runat="server">Code</asp:TableCell>
                    <asp:TableCell runat="server">Course Grade</asp:TableCell>

                </asp:TableRow>
            </asp:Table>

        </div>
    </form>
</body>
</html>
