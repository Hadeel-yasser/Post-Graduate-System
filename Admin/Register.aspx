<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Admin.Register" %>

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
                   
                   <td align="center" class="auto-style1">
                       <asp:Label ID="Label3" runat="server" Text="Please register in one of the following" Font-Bold="True" Font-Names="Garamond"></asp:Label>
                   </td>
                   
               </tr>
                <tr>
                   
                   <td align="center" >
                      <asp:Button ID="Student" runat="server" OnClick="Button1_Click" Text="Student" BorderStyle="Groove" />
                       <br />
                   </td>   
               </tr>

                <tr>
                    <td align="center">
                  <asp:Button ID="Supervisor" runat="server" OnClick="Button2_Click" Text="Supervisor" BorderStyle="Groove" />
                        <br />
                    </td>
                </tr>
                <tr>
                    <td align="center">
                   <asp:Button ID="Examiner" runat="server" OnClick="Button3_Click" Text="Examiner" BorderStyle="Groove" />
                        <br />
                    </td>
                </tr>
                

                </table>
        

        </div>
    </form>
</body>
</html>
