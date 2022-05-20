<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add Defense.aspx.cs" Inherits="Admin.Add_Defense" %>

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
                    <td></td>
                    <td>
                       Add Defense for gucian students
                    </td>
                </tr>
                 <tr>
                    <td>Input the following</td>
                    <td>
                       
                    </td>
                </tr>
               

                        <tr>
                           <td>Thesis Serial Number</td>
                           <td><asp:TextBox ID="serialNumber" runat="server"></asp:TextBox></td>
                        </tr>

                        <tr>
                           <td>Defense Date</td>
                           <td><asp:TextBox ID="defenseDate" runat="server" placeholder="DD/MM/YYYY"></asp:TextBox></td>
                        </tr>

                          <tr>
                           <td>Defense Location</td>
                           <td><asp:TextBox ID="defenseLocation" runat="server"></asp:TextBox></td>
                        </tr>

                       
                           <tr>
                    <td></td>
                    <td align="right">
                        <asp:Button ID="Button1" runat="server"  Text="Add defense" style="height: 26px" OnClick="Button1_Click" />
                    </td>
                </tr>
                       
                 </table>
        </div>
    </form>
</body>
</html>
