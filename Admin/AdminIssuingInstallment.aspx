<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminIssuingInstallment.aspx.cs" Inherits="Admin.AdminIssuingInstallment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>


            Payment ID:<asp:TextBox ID="PaymentID" runat="server"></asp:TextBox>


        </div>
        <p>
            Installment Start Date: <asp:TextBox ID="InstallmentStartDate" runat="server"></asp:TextBox>
        </p>

        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Issue" />

    </form>
</body>
</html>
