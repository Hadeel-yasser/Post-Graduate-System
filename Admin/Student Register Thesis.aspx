<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student Register Thesis.aspx.cs" Inherits="Admin.Student_Register_Thesis" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 156px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table align ="Center">
               <tr>
                   <td ></td>
                   <td align="center" class="auto-style1">
                       <asp:Label ID="Label3" runat="server" Text="Register New Thesis"></asp:Label>
                   </td>
                   
               </tr>
              
                <tr>
                   <td >SuperVisor ID</td>
                   <td class="auto-style1">
                     <asp:TextBox ID="superVisorID" runat="server" BackColor="#99CCFF"></asp:TextBox>
                   </td>
                   
               </tr>
                <tr>
                   <td >Field</td>
                   <td class="auto-style1">
                      <asp:TextBox ID="field" runat="server" BackColor="#99CCFF"></asp:TextBox>
                   </td>
                   
               </tr>
                <tr>
                   <td >Type</td>
                   <td class="auto-style1">
                      <asp:TextBox ID="type" runat="server" BackColor="#99CCFF"></asp:TextBox>
                   </td>
                   
               </tr>
                <tr>
                   <td >Title</td>
                   <td class="auto-style1">
                      <asp:TextBox ID="title" runat="server" BackColor="#99CCFF"></asp:TextBox>
                   </td>
                   
               </tr>

                <tr>
                   <td > Start Date</td>
                   <td class="auto-style1">
                     <asp:TextBox ID="startDate" runat="server" BackColor="#99CCFF" placeholder="DD/MM/YYYY"></asp:TextBox>
                   </td>
                   
               </tr>

                <tr>
                   <td >End Date</td>
                   <td class="auto-style1">
                     <asp:TextBox ID="endDate" runat="server" BackColor="#99CCFF" placeholder="DD/MM/YYYY"></asp:TextBox>
                   </td>
                   
               </tr>
                   
                <tr>
                   <td >No of Extensions</td>
                   <td class="auto-style1">
                       <asp:TextBox ID="noOfExtensions" runat="server" BackColor="#99CCFF"></asp:TextBox>
                   </td>
                   
               </tr>
            <tr>
                   <td ></td>
                   <td align="right" class="auto-style1">
                     <asp:Button ID="Button1" runat="server" Text="Register" OnClick="Button1_Click" />
                   </td>
                   
               </tr>
           

            </table>
        </div>
    </form>
</body>
</html>
