<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="useroldletters.aspx.cs" Inherits="letter_demo.useroldletters" %>

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
            margin: 150px auto 0; /* Center the container vertically and horizontally */
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2 class="text-center">Old Letters Detail</h2>
            <div>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover">
                    <HeaderStyle CssClass="thead-dark" />
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        <asp:BoundField DataField="SaveDate" HeaderText="Save Date" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundField DataField="Subject" HeaderText="Subject" />
                        <asp:BoundField DataField="Response" HeaderText="Response" />
                    </Columns>
                </asp:GridView>
            </div>
            <asp:Button ID="NewLetterButton" CssClass="btn btn-custom btn-block" runat="server" Text="Make New Letter" OnClick="NewLetterButton_Click" />
            <asp:Button ID="uploadletters" CssClass="btn btn-custom btn-block" runat="server" Text="Upload letter" OnClick="uploadletters_Click" />
    </form>
</body>
</html>
