<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Examiner Update Information.aspx.cs" Inherits="Admin.Examiner_Update_Information" %>

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
                       <asp:Label ID="Label3" runat="server" Text="Update Your Information"></asp:Label>
                   </td>
                   
               </tr>
              <tr>
                <td>Name</td>
                <td><asp:TextBox ID="Name_E" runat="server" placeholder="Your name"></asp:TextBox>&nbsp;&nbsp;&nbsp;
                      <asp:Button ID="update_Name" runat="server" Text="Update Name" Width="97px" OnClick="update_Name_Click" />
                  </td>
                  <td>
                      &nbsp;</td>
              </tr>
               <tr>
                   <td>Field of Work</td>
                   <td><asp:TextBox ID="F_work" runat="server" placeholder="Your field of work"></asp:TextBox>
                       &nbsp;&nbsp;&nbsp;
                       <asp:Button ID="update" runat="server" Text="Update Work" OnClick="updateWork_Click" Width="97px" /></td>
               </tr>
                 <tr>
                   <td></td>
                   <td align="right">
                       &nbsp;</td>
               </tr>
               
                 </table>

        </div>
    </form>
</body>
</html>
