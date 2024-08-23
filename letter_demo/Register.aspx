<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="letter_demo.Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <style>
        body {
            background-color: #f0f0f0; /* Light grey background */
            font-family: Arial, sans-serif; /* Stylish font-family */
        }

        .container {
            margin-top: 90px;
            width: 100%;
            max-width: 400px;
            padding: 20px;
            border-radius: 10px;
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
        .btn:hover {
            cursor: pointer;
        }

        h2 {
            color: #0094ff; /* Bootstrap primary color for the heading */
            margin-bottom: 20px;
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
            <h2 class="text-center">Add User</h2>
            <div class="form-group">
                <asp:TextBox ID="UserName" CssClass="form-control" runat="server"
                    placeholder="UserName"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="Dept" CssClass="form-control" runat="server"
                    placeholder="Department"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:DropDownList ID="type" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select Type" Value=""></asp:ListItem>
                    <asp:ListItem Text="User" Value="user"></asp:ListItem>
                    <asp:ListItem Text="Admin" Value="admin"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:TextBox ID="Password" CssClass="form-control" runat="server"
                    TextMode="Password" placeholder="Password" ClientIDMode="Static"></asp:TextBox>
                <asp:CheckBox ID="ShowPasswordCheckBox" runat="server" Text="Show Password" onclick="togglePasswordVisibility()" />
                <script>
                    function togglePasswordVisibility() {
                        var passwordTextBox = document.getElementById('Password');
                        if (passwordTextBox.type === "password") {
                            passwordTextBox.type = "text";
                        } else {
                            passwordTextBox.type = "password";
                        }
                    }
                </script>
            </div>
            <asp:Button ID="Add" CssClass="btn btn-custom btn-block" runat="server" Text="Add" OnClick="Add_Click" />
            <asp:Button ID="NewLetterButton" CssClass="btn btn-custom btn-block" runat="server" Text="Go Back To Admin Panel" OnClick="NewLetterButton_Click" />
    </form>
</body>
</html>
