<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Examiner Add Comment.aspx.cs" Inherits="Admin.Examiner_Add_Comment" %>

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
                       <asp:Label ID="Label3" runat="server" Text="Add comments for thesis"></asp:Label>
                   </td>
                   
               </tr>
              <tr>
                <td>Thesis serialNumber</td>
                <td><asp:TextBox ID="serialNo" runat="server" placeholder="serialNo"></asp:TextBox></td>
              </tr>
               <tr>
                   <td>Defense Date</td>
                   <td><asp:TextBox ID="D_date" runat="server" placeholder="DD-MM-YYYY"></asp:TextBox></td>
               </tr>
                <tr>
                   <td>Comments</td>
                   <td><asp:TextBox ID="comment_E" runat="server" placeholder="Comments for thesis"></asp:TextBox></td>
               </tr>
                 <tr>
                   <td></td>
                   <td align="right">
                       <asp:Button ID="add_C" runat="server" Text="Add Comment" OnClick="update_Click" /></td>
               </tr>
               
                 </table>
        </div>
    </form>
</body>
</html>
