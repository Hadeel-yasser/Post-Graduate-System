<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Supervisor View Publications.aspx.cs" Inherits="Admin.Supervisor_View_Publications" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>Enter Student ID</td>
                    <td>
                        <asp:TextBox ID="studentID" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td align="right">
                        <asp:Button ID="ViewButton" runat="server" Text="View Publication" OnClick="Button1_Click" />
                    </td>
                </tr>
            </table>

            <asp:Table ID="Table1" runat="server" Caption="Students' Publications" GridLines="Both" Width="683px">
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">Publication ID</asp:TableCell>
                    <asp:TableCell runat="server">Title</asp:TableCell>
                    <asp:TableCell runat="server">Date of publication</asp:TableCell>
                    <asp:TableCell runat="server">Place</asp:TableCell>
                    <asp:TableCell runat="server">Accepted</asp:TableCell>
                    <asp:TableCell runat="server">Host</asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </form>
</body>
</html>
