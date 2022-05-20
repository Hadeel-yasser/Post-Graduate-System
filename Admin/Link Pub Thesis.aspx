<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Link Pub Thesis.aspx.cs" Inherits="Admin.Link_Pub_Thesis" %>

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
                       <asp:Label ID="Label3" runat="server" Text="Link Publication To Thesis"></asp:Label>
                   </td>
                   
               </tr>
              <tr>
                <td>Publication ID</td>
                <td><asp:TextBox ID="pubID" runat="server"></asp:TextBox></td>
              </tr>
               <tr>
                   <td>Thesis Serial Number</td>
                   <td><asp:TextBox ID="thesisSerialNo" runat="server" ></asp:TextBox></td>
               </tr>
             
             <tr>
                   <td>&nbsp;</td>
                   <td align ="right"> 
                       <asp:Button ID="Link" runat="server" OnClick="Button1_Click" Text="Link" />

                   </td>
               </tr>



           </table>
        </div>
    </form>
</body>
</html>
