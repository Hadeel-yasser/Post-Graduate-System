<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProgressReport.aspx.cs" Inherits="Admin.AddProgressReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Add Progress Report
            
            <br />
            Thesis Serial No
            <asp:TextBox ID="Thesisserialno" runat="server"></asp:TextBox>

            <br />
            Progress Report Date
            <asp:TextBox ID="ProgressDate" runat="server"  placeholder= "DD/MM/YYYY" > </asp:TextBox>
            <br />

            Progress Report No
            <asp:TextBox ID="Progressno" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="View" runat="server" OnClick="Button1_Click" Text="Add" />
        </div>
    </form>
</body>
</html>
