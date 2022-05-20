<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Evaluate Progress Report.aspx.cs" Inherits="Admin.Evaluate_Progress_Report" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                 <table align ="Center" style="width: 351px">         
                <tr>
                    <td></td>
                    <td>
                       Evaluate Progress Report
                    </td>
                </tr>
                 <tr>
                    <td>Input the following</td>
                    <td>                       
                    </td>
                </tr>
                        <tr>
                           <td>Thesis Serial Number</td>
                           <td><asp:TextBox ID="serialNumber" runat="server"></asp:TextBox></td>
                        </tr>

                        <tr>
                           <td>Progress Report Number</td>
                           <td><asp:TextBox ID="progressreportNo" runat="server" ></asp:TextBox></td>
                        </tr>

                          <tr>
                           <td>Evaluation</td>
                           <td>
                               <asp:DropDownList ID="DropDownList1" runat="server" Height="16px"  Width="68px">
                                   <asp:ListItem>0</asp:ListItem>
                                   <asp:ListItem>1</asp:ListItem>
                                   <asp:ListItem>2</asp:ListItem>
                                   <asp:ListItem>3</asp:ListItem>
                               </asp:DropDownList></td>
                        </tr>

                       
                           <tr>
                    <td></td>
                    <td align="right">
                        <asp:Button ID="Button1" runat="server"  Text="Evaluate" style="height: 26px" OnClick="Button1_Click" />
                    </td>
                </tr>
                       
                 </table>
        </div>
    </form>
</body>
</html>
