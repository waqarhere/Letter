<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="status.aspx.cs" Inherits="letter_demo.status" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reply Send Status</title>
    <style>
        body {
            background-color: #f0f0f0;
            font-family: Arial, sans-serif;
        }

        .container {
            margin: 40px auto 0;
            width: 100%;
            max-width: 800px;
            padding: 20px;
            border-radius: 10px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border: 1px solid #ddd;
        }

        .form-control, .form-upload {
            font-size: 18px;
            height: auto;
            padding: 10px;
            width: calc(100% - 20px);
            box-sizing: border-box;
            margin-bottom: 20px;
        }

        .btn-primary, .btn-custom {
            font-size: 18px;
            padding: 15px 30px;
            margin-bottom: 10px;
            width: calc(100% - 20px);
            box-sizing: border-box;
        }

        .grid-view {
            width: 100%;
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
            <h1 class="text-center">Reply Send Status</h1>
            <div class="form-group">
                <select id="department" name="department" runat="server" class="form-control mr-2">
                    <option value="">Choose Department</option>
                    <option value="Vice Chancellor Office">Vice Chancellor Office</option>
                    <option value="Quality Assurance and Liaison">Quality Assurance and Liaison</option>
                    <option value="Registrar Office">Registrar Office</option>
                    <option value="Student Affairs">Student Affairs</option>
                    <option value="Examinations">Examinations</option>
                    <option value="Marketing & Outreach">Marketing & Outreach</option>
                    <option value="HR">HR</option>
                    <option value="Finance">Finance</option>
                </select>
            </div>

            <div class="form-group">
                <input type="text" id="senderName" name="senderName" runat="server" class="form-control mr-2" readonly />
            </div>

            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script type="text/javascript">
                $(document).ready(function () {
                    $('#department').change(function () {
                        var department = $(this).val();
                        var senderName = getSenderName(department);
                        $('#senderName').val(senderName);
                    });

                    function getSenderName(department) {
                        switch (department) {
                            case 'Vice Chancellor Office':
                                return 'Prof. Dr. Mansoor-uz-Zafar Dawood';
                            case 'Quality Assurance and Liaison':
                                return 'Fawwad Mahmood Butt';
                            case 'Registrar Office':
                                return 'Syed Kashif Rafi';
                            case 'Student Affairs':
                                return 'Wajahat Ullah';
                            case 'Examinations':
                                return 'Muhammad Fazal Qureshi';
                            case 'Marketing & Outreach':
                                return 'Syed Ahmed Zaheer';
                            case 'HR':
                                return 'Basit Ali';
                            case 'Finance':
                                return 'Farid Ali Akh';
                            default:
                                return '';
                        }
                    }
                });
            </script>


            <label for="forwardedTo">Subject of letter to be replied: </label>
            <asp:DropDownList ID="txtsubject" runat="server" CssClass="form-control mr-2">
            </asp:DropDownList>
            <asp:DropDownList ID="ddlSection" runat="server" CssClass="form-control" onchange="showHideSections()">
                <asp:ListItem Value="Choose Delivery Option">Choose Delivery Option</asp:ListItem>
                <asp:ListItem Value="OnHand">On Hand</asp:ListItem>
                <asp:ListItem Value="Delivery">Delivery</asp:ListItem>
            </asp:DropDownList>

            <div id="onHandSection" class="form-group">
                <!-- On Hand Section -->
                <input type="date" id="SaveDate" runat="server" class="form-control" />
                <asp:TextBox ID="recName" CssClass="form-control" runat="server" placeholder="Receiver Name"></asp:TextBox>
                <asp:TextBox ID="recdept" CssClass="form-control" runat="server" placeholder="Department Name"></asp:TextBox>
                <asp:Label ID="Label7" runat="server" Text="Receiving (Not Mandatory)"></asp:Label>
                <asp:Label ID="Label8" runat="server" Text="Only .pdf files allowed" ForeColor="Red"></asp:Label>
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-upload" />
                <asp:Button ID="Button1" CssClass="btn btn-custom btn-block" runat="server" Text="Upload" OnClick="onhandsubmit_Click" />
                <asp:Button ID="Button2" CssClass="btn btn-custom btn-block" runat="server" Text="See Status Update" OnClick="onhandview_Click1" />
            </div>

            <div id="deliverySection" class="form-group" style="display: none;">
                <!-- Delivery Section -->
                <input type="date" id="Date1" runat="server" class="form-control" />
                <asp:DropDownList ID="type" runat="server" CssClass="form-control">
                    <asp:ListItem Value="">Choose Company</asp:ListItem>
                    <asp:ListItem Value="TCS">TCS (Tranzum Courier Services)</asp:ListItem>
                    <asp:ListItem Value="Leopards">Leopards Courier</asp:ListItem>
                    <asp:ListItem Value="M&P">M&P (M&P Express Logistics)</asp:ListItem>
                    <asp:ListItem Value="CallCourier">Call Courier</asp:ListItem>
                    <asp:ListItem Value="BlueEx">BlueEx</asp:ListItem>
                    <asp:ListItem Value="Cheetay">Cheetay Logistics</asp:ListItem>
                    <asp:ListItem Value="Forrun">Forrun</asp:ListItem>
                    <asp:ListItem Value="Bykea">Bykea</asp:ListItem>
                    <asp:ListItem Value="CareemNOW">Careem NOW</asp:ListItem>
                    <asp:ListItem Value="SWIFT">SWIFT Couriers</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="recnum" CssClass="form-control" runat="server" placeholder="Receiving Number"></asp:TextBox>
                <asp:Label ID="Label9" runat="server" Text="Receiving"></asp:Label>
                <asp:Label ID="Label10" runat="server" Text="Only .pdf files allowed" ForeColor="Red"></asp:Label>
                <asp:FileUpload ID="documentUpload" runat="server" CssClass="form-upload" />
                <asp:Button ID="Button3" CssClass="btn btn-custom btn-block" runat="server" Text="Upload" OnClick="upload_Click" />
                <asp:Button ID="Button4" CssClass="btn btn-custom btn-block" runat="server" Text="See Status Update" OnClick="view_Click" />
            </div>

            <script type="text/javascript">
                function showHideSections() {
                    var selectedSection = document.getElementById('<%= ddlSection.ClientID %>').value;
                    if (selectedSection === 'Choose Delivery Option') {
                        document.getElementById('onHandSection').style.display = 'none';
                        document.getElementById('deliverySection').style.display = 'none';
                    } else if (selectedSection === 'Delivery') {
                        document.getElementById('onHandSection').style.display = 'none';
                        document.getElementById('deliverySection').style.display = 'block';
                    } else if (selectedSection === '') {
                        document.getElementById('onHandSection').style.display = 'none';
                        document.getElementById('deliverySection').style.display = 'none';
                    }
                    if (selectedSection === 'OnHand') {
                        document.getElementById('onHandSection').style.display = 'block';
                        document.getElementById('deliverySection').style.display = 'none';
                    }
                }
            </script>

            <%--            <%--//============================by hand section=============================================--%>
<%--            <asp:Label ID="Label3" runat="server" Text="By Hand:"></asp:Label><br />
            <br />
            <div class="form-group">
                <input type="date" id="SaveDate" runat="server" class="form-control" />
            </div>
            <div class="form-group">
                <asp:TextBox ID="recName" CssClass="form-control" runat="server" placeholder="Reciever Name"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="recdept" CssClass="form-control" runat="server" placeholder="Department Name"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="Label5" runat="server" Text="Recieving (Not Mandatory)"></asp:Label>
                <asp:Label ID="Label2" runat="server" Text="Only .pdf files allowed" ForeColor="Red"></asp:Label>
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-upload" />
            </div>
            <asp:Button ID="onhandsubmit" CssClass="btn btn-custom btn-block" runat="server" Text="Upload" OnClick="onhandsubmit_Click" />
            <asp:Button ID="onhandview" CssClass="btn btn-custom btn-block" runat="server" Text="See Status Update" OnClick="onhandview_Click1" />--%>
            <%--//============================delivery section=============================================--%>
            <%--<asp:Label ID="Label4" runat="server" Text="Delivery:"></asp:Label><br />
            <br />
            <div class="form-group">
                <input type="date" id="Date1" runat="server" class="form-control" />
            </div>
            <div class="form-group">
                <asp:DropDownList ID="type" runat="server" CssClass="form-control">
                    <asp:ListItem Value="">Choose Company</asp:ListItem>
                    <asp:ListItem Value="TCS">TCS (Tranzum Courier Services)</asp:ListItem>
                    <asp:ListItem Value="Leopards">Leopards Courier</asp:ListItem>
                    <asp:ListItem Value="M&P">M&P (M&P Express Logistics)</asp:ListItem>
                    <asp:ListItem Value="CallCourier">Call Courier</asp:ListItem>
                    <asp:ListItem Value="BlueEx">BlueEx</asp:ListItem>
                    <asp:ListItem Value="Cheetay">Cheetay Logistics</asp:ListItem>
                    <asp:ListItem Value="Forrun">Forrun</asp:ListItem>
                    <asp:ListItem Value="Bykea">Bykea</asp:ListItem>
                    <asp:ListItem Value="CareemNOW">Careem NOW</asp:ListItem>
                    <asp:ListItem Value="SWIFT">SWIFT Couriers</asp:ListItem>
                </asp:DropDownList>
                <div class="form-group">
                    <asp:TextBox ID="recnum" CssClass="form-control" runat="server" placeholder="Recieving Number"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Recieving"></asp:Label>
                    <asp:Label ID="Label6" runat="server" Text="Only .pdf files allowed" ForeColor="Red"></asp:Label>
                    <asp:FileUpload ID="documentUpload" runat="server" CssClass="form-upload" />
                </div>
                <asp:Button ID="upload" CssClass="btn btn-custom btn-block" runat="server" Text="Upload" OnClick="upload_Click" />
                <asp:Button ID="view" CssClass="btn btn-custom btn-block" runat="server" Text="See Status Update" OnClick="view_Click" />--%>
                <a href="Steps.aspx" class="logout-button">Back</a>
            </div>
    </form>
</body>
</html>
