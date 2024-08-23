<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Fetch_Crystal.aspx.cs" Inherits="letter_demo.Report.Fetch_Crystal" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
<head runat="server">
    <title>See Report</title>
    <style>
        body {
            background-color: #f0f0f0; /* Light grey background */
            font-family: Arial, sans-serif; /* Stylish font-family */
        }

        .container {
            margin: 70px auto 0;
            width: 100%;
            max-width: 800px; /* Max-width of the container */
            padding: 20px;
            border-radius: 10px; /* Rounded corners for the border */
            background-color: #ffffff; /* White background for the form */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Subtle shadow around the form */
            border: 1px solid #ddd; /* Light grey border */
        }

        .btn-warning{
            margin-top: 20px;
            margin-right: 20px;
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
        <div class="row">
            <div class="col-md-6 offset-md-6 text-right">
                <asp:Button ID="Old" runat="server" CssClass="btn btn-warning" Text="Back" OnClick="Old_Click" />
            </div>
        </div>
        <div class="container">
            <h2 class="text-center">Print Report</h2>
            <div class="form-group">
                <asp:TextBox ID="RefNo" CssClass="form-control" runat="server"
                    placeholder="Ref-No"></asp:TextBox>
            </div>
            <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" />
            <asp:Button ID="ShowReport" CssClass="btn btn-custom btn-block" runat="server" Text="Show Report" OnClick="ShowReport_Click" />
        </div>
    </form>
</body>
</html>
