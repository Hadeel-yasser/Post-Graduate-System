<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Supervisor Register.aspx.cs" Inherits="Admin.Supervisor_Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <table align ="Center">
               <tr>
                   <td ></td>
                   <td align="center">
                       <asp:Label ID="Label1" runat="server" Text="Registration Form"></asp:Label>                   </td>
               </tr>

                  <tr>
                <td>First Name</td>
                <td>
                    <asp:TextBox ID="First_Name_S" runat="server" placeholder="Your first name"></asp:TextBox></td>
              </tr>
                 <tr>
                   <td>Last Name</td>
                   <td><asp:TextBox ID="Last_Name_S" runat="server" placeholder="Your family name"></asp:TextBox></td>
               </tr>
                 <tr>
                   <td>Password</td>
                   <td><asp:TextBox ID="Password_S" runat="server" placeholder="*****" TextMode="Password"></asp:TextBox></td>
               </tr>
                 <tr>
                   <td>Faculty</td>
                   <td><asp:TextBox ID="Faculty_S" runat="server"></asp:TextBox></td>
               </tr>
                 <tr>
                   <td>Email</td>
                   <td> <asp:TextBox ID="Email_S" runat="server" placeholder="example@example" TextMode="Email"></asp:TextBox></td>
               </tr>
                 <tr>
                   <td>&nbsp;</td>
                   <td align ="right"> 
                       <asp:Button ID="Register_S" runat="server" OnClick="Button1_Click" Text="Register" />

                   </td>
               </tr>

           </table>

        </div>
    </form>
</body>
</html>
