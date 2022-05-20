<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="Admin.Student" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 21px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table align ="Center">
               
                <tr>
                    <td></td>
                    <td>
                        Welcome Student
                    </td>
                </tr>

                <tr>
                <td>Choose From The Following</td>
                   <td>
                       <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="View my details" />
                   </td>
              </tr>             
                 <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="Register New Thesis" />
                    </td>
                </tr>
           
                <tr>
                    <td></td>
                    <td>
                       <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="List all my theses" />
                    </td>
                </tr>


                <tr>
                    <td></td>
                    <td>
                       <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Add progress report" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                       <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Fill my progress report" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1"></td>
                    <td class="auto-style1">
                       <asp:Button ID="Button6" runat="server"  OnClick="Button6_Click" Text="Add publication" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1"></td>
                    <td class="auto-style1">
                       <asp:Button ID="Button9" runat="server"  OnClick="Button9_Click" Text="Link Publication to my Thesis" />
                    </td>
                </tr>
              <tr>
                <td>Add Your Phone Number</td>
                <td><asp:TextBox ID="Phone" runat="server" placeholder="Enter Your Number"></asp:TextBox>   
                       &nbsp;&nbsp;   
                       <asp:Button ID="AddPhone" runat="server" OnClick="Button8_Click" Text="Add Number" />

                   </td>
              </tr>
                

                 <tr>
                    <td> </td>
                    <td>
                      <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="List all my courses and grades" />                
                    </td>
                </tr>

              </table>

        </div>
    </form>
</body>
</html>
