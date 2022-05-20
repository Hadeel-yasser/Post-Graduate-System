<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Link Course Student.aspx.cs" Inherits="Admin.Link_Course_Student" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table align="center">
                <tr>
                    <td>
                        Link Course To A Student
                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td>
                        Student ID
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Course ID
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>
                       
                    </td>
                    <td align="right">
                        <asp:Button ID="Button1" runat="server" Text="Link" Height="21px" OnClick="Button1_Click" Width="71px" />                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
