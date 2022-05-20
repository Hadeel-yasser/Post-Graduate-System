<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminUpdatingThesisExtension.aspx.cs" Inherits="Admin.AdminUpdatingThesisExtension" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Thesis Serial Number:
            <asp:TextBox ID="ThesisSerialNumber" runat="server"></asp:TextBox>
        </div>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Update" />
    </form>
</body>
</html>
