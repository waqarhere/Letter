<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UploadOldletters.aspx.cs" Inherits="letter_demo.UploadOldletters" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Upload Old Letters</title>
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

        .form-control, .form-upload {
            font-size: 18px; /* Larger font size for inputs */
            height: auto; /* Adjust height */
            padding: 10px; /* More padding */
            width: calc(100% - 20px); /* Calculate width to account for padding */
            box-sizing: border-box; /* Include padding in the width calculation */
            margin-bottom: 20px; /* Increased spacing */
        }

        .btn-primary, .btn-custom {
            font-size: 18px; /* Larger font size for button */
            padding: 15px 30px; /* More padding for button */
            margin-bottom: 10px; /* Add margin between buttons */
            width: calc(100% - 20px); /* Calculate width to account for padding */
            box-sizing: border-box; /* Include padding in the width calculation */
        }

        .grid-view {
            width: 100%; /* Ensure GridView takes full width of container */
        }

        .table-responsive {
            overflow-x: auto;
        }

        th, td {
            white-space: nowrap;
        }

        h1 {
            color: #0094ff;
            margin-bottom: 20px;
        }

        title {
            font-weight: bold; /* Make the title bold */
        }

        .btn:hover {
            cursor: pointer;
        }

        .text-center {
            text-align: center;
            font-weight: bold; /* Add this line to make text bold */
            font-family: Arial, sans-serif;
        }

        .btn-custom {
            background-color: #0094ff; /* Custom color */
            border-color: #0094ff; /* Border color */
            color: #fff; /* Text color */
        }
    </style>
    <style>
        /* Your existing styles here */

        /* New styles for the logout button */
        .logout-button {
            position: absolute;
            top: 20px; /* Adjust top position as needed */
            right: 20px; /* Adjust right position as needed */
            background-color: #dc3545; /* Red color for logout button */
            border-color: #dc3545; /* Border color */
            color: #fff; /* Text color */
            padding: 10px 20px; /* Padding for the button */
            border-radius: 5px; /* Rounded corners */
            font-size: 16px; /* Font size */
            text-decoration: none; /* Remove underline from link */
        }

            .logout-button:hover {
                background-color: #c82333; /* Darker red color on hover */
                border-color: #c82333;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <div class="container">
            <h1 class="text-center">Upload Letters</h1>
            <div class="form-group">
                <asp:Label ID="Label2" runat="server" Text="Please choose letter date" ForeColor="Red"></asp:Label>
                <input type="date" id="SaveDate" runat="server" class="form-control" />
            </div>
            <div class="form-group">
                <asp:TextBox ID="UserName" CssClass="form-control" runat="server" placeholder="Name"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="designation" CssClass="form-control" runat="server" placeholder="Designation"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="organization" CssClass="form-control" runat="server" placeholder="Organization"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="subject" CssClass="form-control" runat="server" placeholder="Subject"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" Text="Only .pdf files allowed" ForeColor="Red"></asp:Label>
                <asp:FileUpload ID="documentUpload" runat="server" CssClass="form-upload" />
            </div>
            <asp:Button ID="upload" CssClass="btn btn-custom btn-block" runat="server" Text="Upload" OnClick="upload_Click" />
            <asp:Button ID="view" CssClass="btn btn-custom btn-block" runat="server" Text="See Upload Letters" OnClick="view_Click" />
            <a href="Steps.aspx" class="logout-button">Back</a>
        </div>
    </form>
</body>
</html>
