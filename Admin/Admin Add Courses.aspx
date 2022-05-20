<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin Add Courses.aspx.cs" Inherits="Admin.Admin_Add_Courses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin-left: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table align="center">
                <tr>
                    <td>                         Add Course Details
 </td>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td> Course Code</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td> Credit Hours</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td> Course Fees</td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td> </td>
                    <td align="right">
                        <asp:Button ID="Button1" runat="server" Text="Add" CssClass="auto-style1" Height="25px" Width="68px" OnClick="Button1_Click" />                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
