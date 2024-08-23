<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Steps.aspx.cs" Inherits="letter_demo.Steps" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Steps</title>
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

        .btn-primary, .btn-custom {
            font-size: 18px; /* Larger font size for button */
            padding: 15px 30px; /* More padding for button */
            margin-bottom: 10px; /* Add margin between buttons */
            width: 100%; /* Make all buttons the same width */
        }

        .grid-view {
            width: 100%; /* Ensure GridView takes full width of container */
        }

        /* Responsive table styling */
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
        /* Title styling */
        title {
            font-weight: bold; /* Make the title bold */
        }

        .btn:hover {
            cursor: pointer;
        }

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
    <form id="form1" runat="server">
        <div class="container">
            <h1 class="text-center">Admin Panel</h1>
            <asp:Button ID="NewLetterButton" CssClass="btn btn-custom btn-block" runat="server" Text="New Letter" OnClick="NewLetterButton_Click" />
            <asp:Button ID="Seeoldletter" CssClass="btn btn-custom btn-block" runat="server" Text="See old letter" OnClick="Seeoldletter_Click" />
            <asp:Button ID="loadreport" CssClass="btn btn-custom btn-block" runat="server" Text="Print Letter" OnClick="loadreport_Click" />
            <asp:Button ID="uploadletters" CssClass="btn btn-custom btn-block" runat="server" Text="Upload Old letters" OnClick="uploadletters_Click" />
            <asp:Button ID="AddUser" CssClass="btn btn-custom btn-block" runat="server" Text="Add User" OnClick="AddUser_Click" />
            <a href="Login.aspx" class="logout-button">Logout</a>
        </div>
    </form>
</body>
</html>--%>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Steps.aspx.cs" Inherits="letter_demo.Steps" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <style>
        body, h1, h3, p, ul, li, button {
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #dfe9f5;
        }
        /* Navbar styles */
        nav {
            position: fixed;
            top: 0;
            left: 0;
            height: 100vh;
            width: 280px;
            background-color: #2e526f;
            overflow-y: auto; /* Enable vertical scrolling if needed */
            box-shadow: 0 20px 35px rgba(0, 0, 0, 0.1);
        }

            nav ul {
                list-style-type: none;
                padding: 0;
            }

            nav li {
                padding: 10px;
            }

            nav a {
                color: rgb(85, 83, 83);
                text-decoration: none;
                display: flex;
                align-items: center;
                padding: 10px;
                transition: background-color 0.3s ease;
            }

            nav .logo img {
                width: 45px;
                height: 45px;
                border-radius: 50%;
                margin-right: 10px;
            }

        .nav-item {
            font-weight: normal;
            text-transform: capitalize;
            color: white;
            font-family: Arial, sans-serif;
        }

            .nav-item.dashboard {
                font-weight: bold;
            }

        nav a:hover {
            background-color: #333;
            padding: 10px 15px;
        }

        nav .logo:hover {
            background-color: transparent; /* Keep background color transparent */
            color: white; /* Keep text color white */
        }
        /* Main section styles */
        .main {
            margin-left: 280px; /* Adjusted to match the navbar width */
            padding: 20px;
        }

        .main-top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .main-skills {
            display: flex;
            flex-wrap: wrap; /* Allow items to wrap to the next line if needed */
            gap: 20px; /* Spacing between cards */
        }

        .card {
            flex-basis: calc(25% - 20px); /* Adjusted to fit 4 cards per row with spacing */
            background-color: #fff;
            border-radius: 20px;
            padding: 20px;
            box-shadow: 0 20px 35px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

            .card h3 {
                margin-bottom: 10px;
            }

            .card button {
                background-color: orangered;
                color: #fff;
                padding: 7px 15px;
                border-radius: 10px;
                margin-top: 15px;
                cursor: pointer;
                border: none;
            }

                .card button:hover {
                    background-color: rgba(223, 70, 15, 0.856);
                }
        /* Course section styles */
        .main-course {
            margin-top: 20px;
            text-transform: capitalize;
        }

        .course-box {
            background-color: #fff;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 20px 35px rgba(0, 0, 0, 0.1);
            margin-top: 10px;
        }

            .course-box ul {
                display: flex;
                list-style-type: none;
                margin-bottom: 10px;
            }

                .course-box ul li {
                    margin-right: 20px;
                    color: gray;
                    cursor: pointer;
                }

                    .course-box ul li.active {
                        color: #000;
                        border-bottom: 2px solid #000;
                        font-weight: bold;
                    }

        .box {
            background-color: #e3f2fd;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 20px 35px rgba(0, 0, 0, 0.1);
            flex: 1;
            margin: 10px;
            text-align: center;
            transition: background-color 0.3s ease;
        }

            .box:hover {
                background-color: #bbdefb;
            }

            .box h3 {
                margin-bottom: 10px;
            }

            .box p {
                color: gray;
                margin-bottom: 15px;
            }

            .box button {
                background-color: #000;
                color: #fff;
                padding: 7px 15px;
                border-radius: 10px;
                cursor: pointer;
                border: none;
            }

                .box button:hover {
                    background-color: rgba(0, 0, 0, 0.842);
                }

        .html {
            color: rgb(25, 94, 54);
        }

        .css {
            color: rgb(104, 179, 35);
        }

        .js {
            color: rgb(28, 98, 179);
        }

        .course {
            display: flex;
            flex-wrap: nowrap;
            justify-content: space-between;
            align-items: center;
        }

        .box {
            flex: 1;
            margin: 10px;
            text-align: center;
        }

        .course-box {
            display: block;
            overflow: hidden;
        }

        .gridview-wrapper {
            max-height: 300px;
            overflow-y: auto;
            overflow-x: hidden;
            text-align: center;
        }

        .custom-btn {
            color: #fff;
            background-color: #17a2b8;
            border-color: #17a2b8;
            padding: 0.375rem 0.75rem;
            font-size: 0.700rem;
            line-height: 1.5;
            border-radius: 0.25rem;
        }

            .custom-btn:hover {
                color: #bbdefb;
                background-color: #138496;
                border-color: #117a8b;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <nav>
                <ul>
                    <li><a href="#" class="logo">
                        <img src="https://upload.wikimedia.org/wikipedia/commons/7/70/Ilmaunilogo.jpg" alt="Logo" />
                        <span class="nav-item dashboard">Dashboard</span>
                    </a></li>
                    <li><a href="letter.aspx" class="logout-button">
                        <span class="nav-item">Create New Letter</span>
                    </a></li>
                    <li><a href="oldletters.aspx" class="logout-button">
                        <span class="nav-item">See Old Letters</span>
                    </a></li>
                    <li><a href="Fetch_Crystal.aspx" class="logout-button">
                        <span class="nav-item">See Letter Report</span>
                    </a></li>
                    <li><a href="rplLETTER.aspx" class="logout-button">
                        <span class="nav-item">See Replied Letters</span>
                    </a></li>
                    <li><a href="status.aspx" class="logout-button">
                        <span class="nav-item">Reply Send Status</span>
                    </a></li>
                    <li><a href="UploadOldletters.aspx" class="logout-button">
                        <span class="nav-item">Upload Old Letters</span>
                    </a></li>
                    <li><a href="adminuploadletterdetails.aspx" class="logout-button">
                        <span class="nav-item">See Uploaded Letters</span>
                    </a></li>
                    <li><a href="Register.aspx" class="logout-button">
                        <span class="nav-item">Add User</span>
                    </a></li>
                    <li><a href="Add_mail.aspx" class="logout-button">
                        <span class="nav-item">Add Mail</span>
                    </a></li>
                    <li><a href="Login.aspx" class="logout-button">
                        <span class="nav-item">Log out</span>
                    </a></li>
                </ul>
            </nav>
            <section class="main">

                <div class="main-top">
                </div>
                <section class="main-course">
                    <h3><b>Activity</b></h3>
                    <div class="course-box">
                        <div class="course">
                            <div class="box">
                                <h6><b>Old<br /> Letters</b></h6>
                                <asp:Label ID="oldLettersCountLabel" runat="server"></asp:Label>
                            </div>
                            <div class="box">
                                <h6><b>New Letters</b></h6>
                                <asp:Label ID="Label1" runat="server"></asp:Label>
                            </div>
                            <div class="box">
                                <h6><b>Mails Uploaded</b></h6>
                                <asp:Label ID="Label2" runat="server"></asp:Label>
                            </div>
                            <div class="box">
                                <h6><b>Pending Replies</b></h6>
                                <asp:Label ID="Label3" runat="server"></asp:Label>
                            </div>
                            <div class="box">
                                <h6><b>Replied Letters</b></h6>
                                <asp:Label ID="Label4" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="main-course">
                    <h2><b>Uploaded Mails</b></h2>
                    <div class="gridview-wrapper">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-hover">
                            <HeaderStyle CssClass="thead-dark" />
                            <Columns>
                                <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}" />
                                <asp:BoundField DataField="Name" HeaderText="Name" />
                                <asp:BoundField DataField="Subject" HeaderText="Subject" />
                                <asp:BoundField DataField="type" HeaderText="Review" />
                                <asp:TemplateField HeaderText="Actions">
                                    <ItemTemplate>
                                        <asp:Button ID="btnOpenPDF" runat="server" Text="View" CssClass="custom-btn custom-btn:hover"
                                            OnClientClick='<%# "window.open(\"" + Eval("documentUpload").ToString() + "\", \"_blank\"); return false;" %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </section>
            </section>
        </div>
    </form>
</body>
</html>



