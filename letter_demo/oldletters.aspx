﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="oldletters.aspx.cs" Inherits="letter_demo.oldletters" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <title>Old Letter</title>
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
        <div class="container">
            <h2 class="text-center">Old Letters Detail</h2>
            <div style="overflow-y: auto; max-height: 400px;">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover">
                    <HeaderStyle CssClass="thead-dark" />
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        <asp:BoundField DataField="SaveDate" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:BoundField DataField="Subject" HeaderText="Subject" />
                        <asp:BoundField DataField="Response" HeaderText="Response" />
                        <asp:TemplateField HeaderText="Attachments">
                            <ItemTemplate>
                                <asp:Button ID="btnOpenPDF" runat="server" Text="View" CssClass="custom-btn custom-btn:hover"
                                    OnClientClick='<%# "window.open(\"" + Eval("FilePath").ToString() + "\", \"_blank\"); return false;" %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <asp:Button ID="NewLetterButton" CssClass="btn btn-custom btn-block" runat="server" Text="Go Back To Admin Panel" OnClick="NewLetterButton_Click" />
        </div>
    </form>
</body>
</html>
