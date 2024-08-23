<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="letter_demo.Login" %>

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
            background-image: url('bgimg/ilma.jpeg');
            background-repeat: no-repeat;
            background-size: cover;
            text-align: right;
        }

        .container {
            margin-top: 70px;
            margin-left: auto;
            width: 100%;
            max-width: 400px;
            padding: 20px;
            border-radius: 10px;
            background-color: rgba(255, 255, 255, 0.4);
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border: 1px solid #ddd;
        }


        .form-control {
            font-size: 15px;
            height: auto;
            padding: 10px;
        }

        .btn-primary {
            font-size: 15px;
            padding: 10px 0;
        }

        .btn:hover {
            cursor: pointer;
        }

        h2 {
            color: #000000;
            margin-bottom: 30px;
            font-size: 20px;
        }

        .text-center {
            text-align: center;
            font-weight: bold;
        }

        .btn-custom {
            background-color: #0094ff;
            border-color: #0094ff;
            color: #fff;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="text-center">
                <img src="https://sdgs.ilmauniversity.edu.pk/images/bizteklogo.png" alt="logo" style="width: 300px; height: 150px; margin-bottom: 15px;" />
            </div>
            <h2 class="text-center">Sign in</h2>
            <div class="form-group">
                <asp:TextBox ID="UserName" CssClass="form-control" runat="server"
                    placeholder="Username"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="Password" CssClass="form-control" runat="server"
                    TextMode="Password" placeholder="Password" ClientIDMode="Static"></asp:TextBox>
                <br />
                <asp:CheckBox ID="ShowPasswordCheckBox" runat="server" Text="Show password" onclick="togglePasswordVisibility()" />
                <script>
                    function togglePasswordVisibility() {
                        var passwordTextBox = document.getElementById('<%= Password.ClientID %>');
                        if (passwordTextBox.type === "password") {
                            passwordTextBox.type = "text";
                        } else {
                            passwordTextBox.type = "password";
                        }
                    }
                </script>
            </div>
            <asp:Label ID="ResultLabel" runat="server" CssClass="text-center" Text="" ForeColor="Red"></asp:Label>
            <asp:Button ID="Submit" CssClass="btn btn-custom btn-block" runat="server" Text="Login" OnClick="Submit_Click" />
        </div>
    </form>
</body>

</html>
