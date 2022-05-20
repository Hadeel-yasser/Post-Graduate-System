<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FillProgressReport.aspx.cs" Inherits="Admin.FillProgressReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
            <table align="center">
                <tr>
                    <td></td>
                    <td>                                   
                       Fill Progress Report
                    </td>
                </tr>
                <tr>
                    <td>Thesis Serial Number</td>
                    <td>                                   
                          <asp:TextBox ID="Thesisserialno" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Progress Report Number</td>
                    <td>                                   
                         <asp:TextBox ID="progressNo" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>State</td>
                    <td>                                   
                      <asp:TextBox ID="state" runat="server" ></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td>                                   
                      <asp:TextBox ID="Description" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td align="right">                                   
                      <asp:Button ID="View" runat="server" OnClick="Button1_Click" Text="Fill" Width="72px" />
                    </td>
                </tr>
            </table>  
            
        </div>
    </form>
</body>
</html>
