<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_mail.aspx.cs" Inherits="letter_demo.Add_mail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <title>Add Mail</title>
    <style>
        body {
            background-color: #f0f0f0;
            font-family: Arial, sans-serif;
            overflow-x: hidden;
        }

        .container {
            margin: auto auto 0;
            width: 100%;
            max-width: 800px;
            padding: 20px;
            border-radius: 10px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border: 1px solid #ddd;
        }

        .btn-warning {
            margin-top: 0px;
            margin-right: 0px;
        }

        .form-control {
            font-size: 18px;
            height: auto;
            padding: 10px;
        }

        .btn-primary {
            font-size: 18px;
            padding: 10px 0;
        }

        .grid-view {
            width: 100%;
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
            font-weight: bold;
        }
    </style>
    <style>
        .text-center {
            text-align: center;
            font-weight: bold;
        }
    </style>
    <style>
        .btn-custom {
            background-color: #0094ff;
            border-color: #0094ff;
            color: #fff;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="row">
            <div class="col-md-6 offset-md-5 text-right mt-3 mb-3">
                <asp:Button ID="Old" runat="server" CssClass="btn btn-secondary" Text="Back" OnClick="Old_Click" />
            </div>
        </div>
        <div class="container">
            <h2 class="text-center">Upload Mail</h2>
            <div class="form-group">
                <label for="datepicker">Select Date: </label>
                <input type="date" runat="server" id="Date" class="form-control" />
            </div>
            <div class="form-group">
                <asp:Label ID="lblName" Text="Name: " runat="server" CssClass="mr-2" />
                <input type="text" id="Name" runat="server" oninput="updateSecondTextbox(this.value)" class="form-control" />
            </div>
            <div class="form-group">
                <asp:Label ID="txtsbj" Text="Subject: " runat="server" CssClass="mr-2" />
                <asp:TextBox ID="subject" CssClass="form-control" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label ID="Label2" AssociatedControlID="Subject" Text="Concerned File: " runat="server" CssClass="mr-2" />
                <div class="input-group">
                    <asp:DropDownList ID="concernedfile" runat="server" CssClass="form-control" Style="font-size: 16px;">
                        <asp:ListItem Text="Choose Concerned File" Value="" />
                        <asp:ListItem Text="APQN" Value="APQN" />
                        <asp:ListItem Text="CIEC" Value="CIEC" />
                        <asp:ListItem Text="Chief Minister House Sindh" Value="Cheif Minister House Sindh" />
                        <asp:ListItem Text="CROSSREF" Value="CROSSREF" />
                        <asp:ListItem Text="EOBI" Value="EOBI" />
                        <asp:ListItem Text="FUIW" Value="FUIW" />
                        <asp:ListItem Text="Governer House Sindh" Value="Governer House Sindh" />
                        <asp:ListItem Text="HEC" Value="HEC" />
                        <asp:ListItem Text="IAU" Value="IAU" />
                        <asp:ListItem Text="IGNITE" Value="IGNITE" />
                        <asp:ListItem Text="INQAAHE" Value="INQAAHE" />
                        <asp:ListItem Text="Ministry of Education - Federal" Value="Ministry of Education - Federal" />
                        <asp:ListItem Text="Ministry of Education - Sindh" Value="Ministry of Education - Sindh" />
                        <asp:ListItem Text="Ministry of IT - Federal" Value="Ministry of IT - Federal" />
                        <asp:ListItem Text="Ministry of IT - Sindh" Value="Ministry of IT - Sindh" />
                        <asp:ListItem Text="Pakistan Statistic Bureau" Value="Pakistan Statistic Bureau" />
                        <asp:ListItem Text="President House" Value="President House" />
                        <asp:ListItem Text="Prime Minister House Sindh" Value="Prime Minister House Sindh" />
                        <asp:ListItem Text="SESSI" Value="SESSI" />
                        <asp:ListItem Text="SHEC" Value="SHEC" />
                    </asp:DropDownList>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label3" AssociatedControlID="Subject" Text="Concerned Dept: " runat="server" CssClass="mr-2" />
                <div class="input-group">
                    <asp:DropDownList ID="concerneddept" runat="server" CssClass="form-control" Style="font-size: 16px;">
                        <asp:ListItem Text="Choose Ref" Value="" />
                        <asp:ListItem Text="Accounts" Value="Accts" />
                        <asp:ListItem Text="Administration" Value="Admin" />
                        <asp:ListItem Text="Admissions" Value="Adms" />
                        <asp:ListItem Text="Business Administration" Value="BA" />
                        <asp:ListItem Text="Chair BoG Secretariat" Value="BoG" />
                        <asp:ListItem Text="Computer Science" Value="CS" />
                        <asp:ListItem Text="Creative & Digital Marketing" Value="CDM" />
                        <asp:ListItem Text="ERP" Value="ERP" />
                        <asp:ListItem Text="Examinations" Value="Exams" />
                        <asp:ListItem Text="Finance" Value="Fin" />
                        <asp:ListItem Text="HR" Value="HR" />
                        <asp:ListItem Text="I.T" Value="IT" />
                        <asp:ListItem Text="Library" Value="Lib" />
                        <asp:ListItem Text="Media Science" Value="MS" />
                        <asp:ListItem Text="ORIC" Value="ORIC" />
                        <asp:ListItem Text="Quality Assurance and Liaison" Value="QA&L" />
                        <asp:ListItem Text="Registrar Office" Value="Reg" />
                        <asp:ListItem Text="Software Engineering" Value="SE" />
                        <asp:ListItem Text="Student Affairs" Value="SA" />
                        <asp:ListItem Text="Vice Chancellor Office" Value="VC" />
                    </asp:DropDownList>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label1" AssociatedControlID="Subject" Text="Choose Type: " runat="server" CssClass="mr-2" />
                <div class="input-group">
                    <asp:DropDownList ID="type" runat="server" CssClass="form-control" Style="font-size: 16px;">
                        <asp:ListItem Text="Choose One" Value="" />
                        <asp:ListItem Text="Reply to be given" Value="Reply to be given" />
                        <asp:ListItem Text="For Information purpose only" Value="For information purpose only" />
                    </asp:DropDownList>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="Label4" runat="server" Text="only upload in .pdf format" ForeColor="Red"></asp:Label><br />
                <asp:FileUpload ID="documentUpload" runat="server" CssClass="form-upload" />
            </div>
            <asp:Button ID="ShowReport" CssClass="btn btn-custom btn-block" runat="server" Text="Upload Mail" OnClick="ShowReport_Click" />
        </div>
    </form>
</body>
</html>
