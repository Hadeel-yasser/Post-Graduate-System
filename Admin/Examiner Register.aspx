<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Examiner Register.aspx.cs" Inherits="Admin.Examiner_Register" %>

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
                   <td >&nbsp;</td>
                   <td align="center">
                       <asp:Label ID="Label3" runat="server" Text="Registration Form"></asp:Label>
                   </td>
                   
               </tr>
              <tr>
                <td>Full Name</td>
                <td><asp:TextBox ID="Full_Name" runat="server" placeholder="Your first name"></asp:TextBox></td>
              </tr>
                 <tr>
                <td>Email</td>
                <td><asp:TextBox ID="Email_E" runat="server" placeholder="example@example.com"></asp:TextBox></td>
              </tr>
                  <tr>
                   <td>Password</td>
                   <td><asp:TextBox ID="Password_E" runat="server" placeholder="*****" TextMode="Password"></asp:TextBox></td>
               </tr>
                 <tr>
                   <td>Field of work</td>
                   <td><asp:TextBox ID="F_work" runat="server" placeholder="Enter Your Specialization"></asp:TextBox></td>
               </tr>
                 <tr>
                     <td>Choose Your <br /> Nationality</td>
                     <td>
                         <asp:RadioButton GroupName="nationality" ID="national" runat="server" Text="National" /> <br />
                         <asp:RadioButton GroupName="nationality" ID="international" runat="server" Text="International" />
                     </td>
                 </tr>
                 <tr>
                     <td>&nbsp;</td>
                   <td align ="right"> 
                       <asp:Button ID="Register_E" runat="server" OnClick="Button1_Click" Text="Register" />

                   </td>
                 </tr>
         </table>

        </div>
    </form>
</body>
</html>
