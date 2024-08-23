<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="userviewuploadoldletters.aspx.cs" Inherits="letter_demo.viewuploadoldletters" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
<head runat="server">
    <title>Old Letter</title>
    <style>
        body {
            background-color: #f0f0f0; /* Light grey background */
            font-family: Arial, sans-serif; /* Stylish font-family */
        }

        .container {
            margin: 40px auto 0; /* Center the container vertically and horizontally */
            width: 100%; /* Adjusted width for better appearance */
            max-width: 800px; /* Max-width of the container */
            padding: 20px;
            border-radius: 10px; /* Rounded corners for the border */
            background-color: #ffffff; /* White background for the form */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Subtle shadow around the form */
            border: 1px solid #ddd; /* Light grey border */
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
    </style>
    <style>
        .text-center {
            text-align: center;
            font-weight: bold; /* Add this line to make text bold */
        }
    </style>
    <style>
        .btn-custom {
            background-color: #0094ff; /* Custom color */
            border-color: #0094ff; /* Border color */
            color: #fff; /* Text color */
        }

        .search-container {
            margin-bottom: 20px; /* Add margin below the search container */
        }

        .search-dropdown {
            width: 150px; /* Adjust width of the search dropdown */
            margin-right: 10px; /* Add right margin */
        }

        .search-textbox {
            width: 200px; /* Adjust width of the search textbox */
            margin-right: 10px; /* Add right margin */
        }

        .search-button {
            padding: 10px 20px; /* Adjust padding of the search button */
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2 class="text-center">Updated Letters Detail</h2>
            <div class="search-container">
                <asp:DropDownList ID="SearchDropDown" runat="server" CssClass="form-control search-dropdown" AutoPostBack="true" OnSelectedIndexChanged="SearchDropDown_SelectedIndexChanged">
                    <asp:ListItem Text="All" Value="All"></asp:ListItem>
                    <asp:ListItem Text="UserName" Value="UserName"></asp:ListItem>
                    <asp:ListItem Text="SaveDate" Value="SaveDate"></asp:ListItem>
                    <asp:ListItem Text="Designation" Value="Designation"></asp:ListItem>
                    <asp:ListItem Text="Organization" Value="Organization"></asp:ListItem>
                    <asp:ListItem Text="Subject" Value="Subject"></asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="SearchBox" runat="server" CssClass="form-control search-textbox"></asp:TextBox>
                <asp:Button ID="SearchButton" runat="server" Text="Search" CssClass="btn btn-primary search-button" OnClick="SearchButton_Click1" />
            </div>
            <div>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover">
                    <HeaderStyle CssClass="thead-dark" />
                    <Columns>
                        <asp:BoundField DataField="UserName" HeaderText="UserName" />
                        <asp:BoundField DataField="SaveDate" HeaderText="Save Date" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundField DataField="Designation" HeaderText="Designation" />
                        <asp:BoundField DataField="Organization" HeaderText="Organization" />
                        <asp:BoundField DataField="Subject" HeaderText="Subject" />
                    </Columns>
                </asp:GridView>
            </div>
            <asp:Button ID="NewLetterButton" CssClass="btn btn-custom btn-block" runat="server" Text="Going Back to Upload Form" OnClick="NewLetterButton_Click" />
        </div>
    </form>
</body>
</html>
