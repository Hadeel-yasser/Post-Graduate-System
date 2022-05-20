<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Examiner Add Grade.aspx.cs" Inherits="Admin.Examiner_Add_Grade" %>

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
                       <asp:Label ID="Label3" runat="server" Text="Add Grade To A Defense"></asp:Label>
                   </td>
                   
               </tr>
              <tr>
                <td>Thesis Serial Number</td>
                <td><asp:TextBox ID="serialNo" runat="server"></asp:TextBox></td>
              </tr>
               <tr>
                   <td>Defense Date</td>
                   <td><asp:TextBox ID="defensedate" runat="server" placeholder ="DD/MM/YYYY"></asp:TextBox></td>
               </tr>
                <tr>
                   <td>Grade</td>
                   <td><asp:TextBox ID="grade" runat="server" ></asp:TextBox></td>
               </tr>
             <tr>
                   <td>&nbsp;</td>
                   <td align ="right"> 
                       <asp:Button ID="Add" runat="server" OnClick="Button1_Click" Text="Add Grade" />

                   </td>
               </tr>



           </table>
        </div>
    </form>
</body>
</html>
