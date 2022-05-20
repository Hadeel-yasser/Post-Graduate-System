<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminIssuingPayment.aspx.cs" Inherits="Admin.AdminIssuingPayment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            Thesis Serial Number:<asp:TextBox ID="Thesis_Serial_Number" runat="server"></asp:TextBox>

        </div>
        <p>
            Amount:
            <asp:TextBox ID="Amount" runat="server"></asp:TextBox>
        </p>
        Number Of Installments:<asp:TextBox ID="Number_Of_Installments" runat="server"></asp:TextBox>
        <p>
            Fund Percentage:<asp:TextBox ID="Fund_Percentage" runat="server" style="margin-bottom: 6px"></asp:TextBox>

        </p>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click"  Text="Issue" />
    </form>
</body>
</html>
