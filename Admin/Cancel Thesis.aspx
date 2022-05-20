<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cancel Thesis.aspx.cs" Inherits="Admin.Cancel_Thesis" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table align ="Center" style="width: 351px">         
                <tr>
                    <td></td>
                    <td>
                       Cancel Thesis
                    </td>
                </tr>
                 
                        <tr>
                           <td>Thesis Serial Number</td>
                           <td><asp:TextBox ID="serialNumber" runat="server"></asp:TextBox></td>
                        </tr>
                        
                           <tr>
                    <td></td>
                    <td align="right">
                        <asp:Button ID="Button1" runat="server"  Text="Cancel Thesis" style="height: 26px" OnClick="Button1_Click" />
                    </td>
                </tr>
                       
                 </table>

        </div>
    </form>
</body>
</html>
