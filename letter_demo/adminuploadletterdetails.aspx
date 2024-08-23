<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminuploadletterdetails.aspx.cs" Inherits="letter_demo.adminuploadletterdetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <title>Uploaded Letters</title>
    <style>
        body {
            background-color: #f0f0f0;
            font-family: Arial, sans-serif;
        }

        .container {
            margin: 40px auto 0;
            width: 100%;
            max-width: 850px;
            padding: 20px;
            border-radius: 10px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border: 1px solid #ddd;
        }

        .form-control {
            font-size: 18px; /* Larger font size for inputs */
            height: auto; /* Adjust height */
            padding: 10px; /* More padding */
        }

        .btn-primary {
            font-size: 18px; /* Larger font size for button */
            padding: 10px 0; /* More padding for button */
        }

        .grid-view {
            width: 100%; /* Ensure GridView takes full width of container */
        }

        /* Responsive table styling */
        .table-responsive {
            overflow-x: auto;
            max-height: 400px; /* Add max-height to display scrollbar */
        }

        h2 {
            color: #0094ff;
            margin-bottom: 20px;
        }

        th, td {
            white-space: nowrap;
        }

        .btn:hover {
            cursor: pointer;
        }

        /* Title styling */
        title {
            font-weight: bold; /* Make the title bold */
        }

        .text-center {
            text-align: center;
            font-weight: bold; /* Add this line to make text bold */
        }

        .btn-custom {
            background-color: #0094ff; /* Custom color */
            border-color: #0094ff; /* Border color */
            color: #fff; /* Text color */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2 class="text-center">Uploaded Letters Detail</h2>
            <div class="form-group">
                <asp:Label ID="SearchLabel" runat="server" Text="Search:" CssClass="mt-2"></asp:Label>
                <div class="d-flex">
                    <asp:DropDownList ID="SearchDropDown" runat="server" AutoPostBack="true" OnSelectedIndexChanged="SearchDropDown_SelectedIndexChanged" CssClass="form-control mt-2">
                        <asp:ListItem Text="All" Value=""></asp:ListItem>
                        <asp:ListItem Text="User Name" Value="UserName"></asp:ListItem>
                        <asp:ListItem Text="SaveDate" Value="SaveDate"></asp:ListItem>
                        <asp:ListItem Text="Designation" Value="Designation"></asp:ListItem>
                        <asp:ListItem Text="Organization" Value="Organization"></asp:ListItem>
                        <asp:ListItem Text="Subject" Value="Subject"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox ID="SearchBox" runat="server" CssClass="form-control mt-2"></asp:TextBox>
                    <asp:Button ID="ClearButton" runat="server" Text="×" CssClass="btn btn-secondary mt-2 ml-2" OnClick="ClearButton_Click" />
                    <asp:Button ID="SearchButton" runat="server" Text="Search" CssClass="btn btn-primary mt-2 ml-2" OnClick="SearchButton_Click" />
                </div>
            </div>
            <div class="table-responsive">
                <!-- Add this div for vertical scrollbar -->
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover" DataKeyNames="DocumentPath">
                    <HeaderStyle CssClass="thead-dark" />
                    <Columns>
                        <asp:BoundField DataField="UserName" HeaderText="User Name" />
                        <asp:BoundField DataField="SaveDate" HeaderText="Save Date" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundField DataField="Designation" HeaderText="Designation" />
                        <asp:BoundField DataField="Organization" HeaderText="Organization" />
                        <asp:BoundField DataField="Subject" HeaderText="Subject" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:Button ID="btnOpenPDF" runat="server" Text="Open PDF"
                                    OnClientClick='<%# "window.open(\"" + Eval("DocumentPath").ToString() + "\", \"_blank\"); return false;" %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <asp:Button ID="NewLetterButton" CssClass="btn btn-custom btn-block" runat="server" Text="Back to Admin Panel" OnClick="NewLetterButton_Click" />
        </div>
    </form>
</body>
</html>

