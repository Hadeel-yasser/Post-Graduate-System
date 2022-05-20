<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Examiner Search Thesis.aspx.cs" Inherits="Admin.Examiner_Search_Thesis" %>

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
                       <asp:Label ID="Label3" runat="server" Text="Search using keyword"></asp:Label>
                   </td>
                   
               </tr>
              <tr>
                <td>Keyword</td>
                <td><asp:TextBox ID="keyword" runat="server"></asp:TextBox></td>
              </tr>
   
             <tr>
                   <td>&nbsp;</td>
                   <td align ="right"> 
                       <asp:Button ID="Add" runat="server" OnClick="Button1_Click" Text="Search" />

                   </td>
               </tr>

           </table>
            <br />
            <br />
  <asp:Table ID="Table1" runat="server" align="center" Caption="Thesis details that contains the keyword" GridLines="Both" Width="827px" Visible="False">
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">Serial Number</asp:TableCell>
                    <asp:TableCell runat="server">Field</asp:TableCell>
                    <asp:TableCell runat="server">Type</asp:TableCell>
                    <asp:TableCell runat="server">Title</asp:TableCell>
                    <asp:TableCell runat="server">Start Date</asp:TableCell>
                    <asp:TableCell runat="server">End Date</asp:TableCell>
                    <asp:TableCell runat="server">Defense Date</asp:TableCell>
                    <asp:TableCell runat="server">Years</asp:TableCell>
                    <asp:TableCell runat="server">Grade</asp:TableCell>
                    <asp:TableCell runat="server">Payment ID</asp:TableCell>
                    <asp:TableCell runat="server">Number of Extensions</asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </form>
</body>
</html>
