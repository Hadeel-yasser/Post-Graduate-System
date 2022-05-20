<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Examiner.aspx.cs" Inherits="Admin.Examiner" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 189px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table align ="center">
                <tr>
                    
                    <td class="auto-style1">
                        Choose from the following
                    </td>
                </tr>
                <tr>
                    
                    <td class="auto-style1">
                        <asp:Button ID="update_E" runat="server" Text="Update your information" Width="178px" OnClick="update_E_Click" />          </td>
                </tr>
                <tr>
                    
                    <td class="auto-style1">
                        <asp:Button ID="list_T" runat="server" Text="Proceed To Theses" Width="181px" OnClick="list_T_Click" />           </td>
                </tr>
                <tr>
                    
                    <td class="auto-style1">
                        <asp:Button ID="comments_E" runat="server" Text="Add comments for a defense" Width="181px" OnClick="comments_E_Click" />           </td>
                </tr>
                <tr>
                    
                    <td class="auto-style1">
                        <asp:Button ID="grade_E" runat="server" Text="Add grade for a defense" Width="181px" OnClick="grade_E_Click" />          </td>
                </tr>
                <tr>
                    
                    <td class="auto-style1">
                        <asp:Button ID="search_E" runat="server" Text="Search for thesis" Width="179px" OnClick="search_E_Click" />          </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
