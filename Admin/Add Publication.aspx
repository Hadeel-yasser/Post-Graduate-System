<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add Publication.aspx.cs" Inherits="Admin.Add_Publication" %>

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
                       <asp:Label ID="Label3" runat="server" Text="Add Publication"></asp:Label>
                   </td>
                   
               </tr>
              <tr>
                <td>Title</td>
                <td><asp:TextBox ID="title" runat="server" placeholder="Publication Title"></asp:TextBox></td>
              </tr>
               <tr>
                   <td>Publication Date</td>
                   <td><asp:TextBox ID="pub_date" runat="server" placeholder="DD-MM-YYYY"></asp:TextBox></td>
               </tr>
               <tr>
                   <td>Host</td>
                   <td><asp:TextBox ID="host" runat="server"></asp:TextBox></td>
               </tr>
               <tr>
                   <td>Place</td>
                   <td><asp:TextBox ID="place" runat="server"></asp:TextBox></td>
               </tr>
               <tr>
                   <td>Accepted</td>
                   <td>
                       <asp:RadioButton GroupName="Accepted" ID="Yes" runat="server" Text="Yes" />  <br />
                       <asp:RadioButton GroupName="Accepted" ID="No" runat="server" Text="No"/> 
                   </td>
               </tr> 
             <tr>
                   <td>&nbsp;</td>
                   <td align ="right"> 
                       <asp:Button ID="Add" runat="server" OnClick="Button1_Click" Text="Add" />

                   </td>
               </tr>



           </table>
        </div>
    </form>
</body>
</html>
