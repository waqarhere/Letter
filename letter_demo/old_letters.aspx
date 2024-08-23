<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="old_letters.aspx.cs" Inherits="letter_demo.old_letters" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="letters" runat="server" AutoGenerateColumns="false">
                <asp:SqlDataSource runat="server">
                    <columns>
                        <asp:BoundField DataField="SaveDate" HeaderText="Date" />
                        <asp:BoundField DataField="ToPerson" HeaderText="To" />
                        <asp:BoundField DataField="Subject" HeaderText="Subect" />
                        <asp:BoundField DataField="Response" HeaderText="Format" />
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        <asp:TemplateField>
                            <itemtemplate>
                                <asp:LinkButton ID="linkselect" Text="select" runat="server" CommandArgument='<% Eval("CommunicationID") %>' OnClick="linkselect_Click">
                                </asp:LinkButton>
                            </itemtemplate>
                        </asp:TemplateField>
                    </columns>
                </asp:SqlDataSource>

            </asp:GridView>

            <asp:Label ID="lblQRCode" runat="server"></asp:Label>
            <asp:Label ID="lblData" runat="server" Text=""></asp:Label>
            <asp:Label ID="lblStudentName" runat="server" Text=""></asp:Label>
            <asp:Label ID="lblFatherName" runat="server" Text=""></asp:Label>
            <asp:Label ID="lblCell" runat="server" Text=""></asp:Label>
            <asp:Label ID="lblEnrollmentDate" runat="server" Text=""></asp:Label>
            <asp:Label ID="lblDegreeName" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
