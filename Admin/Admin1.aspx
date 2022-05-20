<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin1.aspx.cs" Inherits="Admin.Admin1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:Button ID="Supervisor" runat="server" OnClick="Button1_Click" Text="Supervisor" />

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Thesis" runat="server" OnClick="Button2_Click" Text="Thesis"/>

             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
             <asp:Button ID="OnGoing_Thesis" runat="server" OnClick="Button3_Click" Text="OnGoing Thesis Count" />
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <asp:Button ID="Issue_Payment" runat="server" OnClick="Button4_Click" Text="Issue Payment" />
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <asp:Button ID="Issue_Installment" runat="server" OnClick="Button5_Click" Text="Issue Installment" />
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 

            <asp:Button ID="Add_Thesis_Extension" runat="server" OnClick="Button6_Click" Text="Add Thesis Extension" />

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="addCourse" runat="server" Text="Add Course" OnClick="addCourse_Click" />

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="linkCourse" runat="server" Text="Link Course" OnClick="linkCourse_Click" />

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Cours_grade" runat="server" Text="Add Grade" OnClick="Cours_grade_Click" />

            <asp:Table ID="Table1" runat="server" Caption="Thesis Details" GridLines="Both" Width="827px" Visible="False">
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">Serial Number</asp:TableCell>
                    <asp:TableCell runat="server">Field</asp:TableCell>
                    <asp:TableCell runat="server">Type</asp:TableCell>
                    <asp:TableCell runat="server">Title</asp:TableCell>
                    <asp:TableCell runat="server">Start Date</asp:TableCell>
                    <asp:TableCell runat="server">End Date</asp:TableCell>
                    <asp:TableCell runat="server">Defense Date</asp:TableCell>
                    <asp:TableCell runat="server">Years</asp:TableCell>
                    <asp:TableCell runat="server">Grade</asp:TableCell>
                    <asp:TableCell runat="server">Payment ID</asp:TableCell>
                    <asp:TableCell runat="server">Number of Extensions</asp:TableCell>
                </asp:TableRow>
                
            </asp:Table>

            <br />

            <asp:Table ID="Table2" runat="server" Caption="Supervisor Details" GridLines="Both" Width="507px" Visible="False">
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">ID</asp:TableCell>
                    <asp:TableCell runat="server">Name</asp:TableCell>
                    <asp:TableCell runat="server">Faculty</asp:TableCell>
                </asp:TableRow>
                
            </asp:Table>


        </div>
    </form>
</body>
</html>
