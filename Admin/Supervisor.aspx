<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Supervisor.aspx.cs" Inherits="Admin.Supervisor" %>

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
                        Welcome Supervisor
                    </td>
                </tr>
                
             <tr>
                <td>Choose From The Following</td>
                   <td>
                       <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="View my students" />
                       <br />

                   </td>
              </tr>             
                 <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="View publications of students" />
                    </td>
                </tr>

                
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Add a defense for gucian" />
                    </td>
                </tr>

                 <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="Add a defense for non-gucian" />
                    </td>
                </tr>

                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Add examiner for a defense" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Evaluate a progress report" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="Cancel thesis" style="height: 26px" />
                    </td>
                </tr>

           </table>
        </div>
    </form>
</body>
</html>
