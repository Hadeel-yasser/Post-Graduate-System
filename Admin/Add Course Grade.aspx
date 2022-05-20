<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add Course Grade.aspx.cs" Inherits="Admin.Add_Course_Grade" %>

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
                        Add Course Grade For A Student
                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <td>
                        Course ID
                    </td>
                    <td>
                        <asp:TextBox ID="Course" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Student ID
                    </td>
                    <td>
                        <asp:TextBox ID="student" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Grade
                    </td>
                    <td>
                        <asp:TextBox ID="grade" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>
                       
                    </td>
                    <td align="right">
                        <asp:Button ID="Button1" runat="server" Text="Add Grade" OnClick="Button1_Click" />
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
