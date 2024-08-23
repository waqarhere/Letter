<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="letter.aspx.cs" Inherits="letter_demo.letter" ValidateRequest="false" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Letter Form</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <script src="https://cdn.tiny.cloud/1/wwwa651z42d040ztqhd48ipd26d8eby3cizrkypny8532fge/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
    <script>
        tinymce.init({
            selector: '#BodyText',
            plugins: 'toolbar',
            toolbar: 'undo redo | bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | outdent indent',
            menubar: false
        });
    </script>
    <script>
        ClassicEditor
            .create(document.querySelector('#editor'))
            .catch(error => {
                console.error(error);
            });
    </script>
    <style>
        .btn:hover {
            cursor: pointer;
        }

        .dropdown-width {
            max-width: 100px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-6">
                    <asp:Label ID="Label4" Text="Are you Replying? " runat="server" CssClass="mr-2" />
                </div>
                <div class="col-md-6">
                    <asp:RadioButtonList ID="YesNoRadioButtonList" runat="server" CssClass="d-flex justify-content-between" onclick="toggleDropdown();">
                        <asp:ListItem Text="Yes" Value="Yes" />
                        <asp:ListItem Text="No" Value="No" />
                    </asp:RadioButtonList>
                </div>
            </div>
            <div class="row">
                <div id="txtSTforwardedToDiv">
                    <label for="forwardedTo">Subject of letter to be replied: </label>
                    <asp:DropDownList ID="type" runat="server" CssClass="form-control mr-2" AutoPostBack="True" OnSelectedIndexChanged="txtsubject_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
            </div>

            <script type="text/javascript">
                function toggleDropdown() {
                    var radioList = document.getElementById('<%= YesNoRadioButtonList.ClientID %>');
                    var dropdownDiv = document.getElementById('txtSTforwardedToDiv');
                    var selectedValue = radioList.querySelector('input[type="radio"]:checked').value;
                    dropdownDiv.style.display = selectedValue === 'Yes' ? 'block' : 'none';
                }
            </script>

            <div class="row">
                <div class="col-md-6">
                    <label for="datepicker">Select Date: </label>
                    <input type="date" runat="server" id="SaveDate" class="form-control" />
                </div>
                <div class="col-md-6 text-right">
                    <asp:Button ID="Old" runat="server" CssClass="btn btn-secondary" Text="Back" OnClick="Old_Click" />
                </div>
            </div>
            <div class="row mt-3">
                <div class="col">
                    <asp:Label ID="Label1" AssociatedControlID="Subject" Text="Reference: " runat="server" CssClass="mr-2" />
                    <div class="input-group">
                        <asp:DropDownList ID="DeptRef" runat="server" CssClass="form-control mr-2" Style="font-size: 16px;">
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
            </div>
            <div class="row mt-3">
                <div class="col">
                    <asp:Label ID="Label2" AssociatedControlID="Subject" Text="Concerned File: " runat="server" CssClass="mr-2" />
                    <div class="input-group">
                        <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control mr-2" Style="font-size: 16px;">
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
            </div>
            <div class="row">
                <div class="col">
                    <asp:Label ID="Number" Text="Letter Ref: " runat="server" CssClass="mr-2" />
                    <asp:TextBox ID="CommunicationID" runat="server" CssClass="form-control text-left" ReadOnly="true" Style="width: 150px;"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col">
                    <asp:Label ID="lblName" Text="Name: " runat="server" CssClass="mr-2" />
                    <input type="text" id="Name" runat="server" oninput="updateSecondTextbox(this.value)" class="form-control" />
                </div>
            </div>
            <div class="row mt-3">
                <div class="col">
                    <asp:Label ID="lblorganization" Text="Organization: " runat="server" CssClass="mr-2" />
                    <asp:TextBox ID="Organization" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col">
                    <asp:Label ID="lbldesignation" Text="Designation: " runat="server" CssClass="mr-2" />
                    <asp:TextBox ID="Designation" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col">
                    <asp:Label ID="lblCity" Text="City: " runat="server" CssClass="mr-2" />
                    <asp:DropDownList ID="City" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Select City" Value="" />
                        <asp:ListItem Text="Karachi" Value="Karachi" />
                        <asp:ListItem Text="Lahore" Value="Lahore" />
                        <asp:ListItem Text="Islamabad" Value="Islamabad" />
                        <asp:ListItem Text="Faisalabad" Value="Faisalabad" />
                        <asp:ListItem Text="Rawalpindi" Value="Rawalpindi" />
                        <asp:ListItem Text="Multan" Value="Multan" />
                        <asp:ListItem Text="Gujranwala" Value="Gujranwala" />
                        <asp:ListItem Text="Peshawar" Value="Peshawar" />
                        <asp:ListItem Text="Quetta" Value="Quetta" />
                        <asp:ListItem Text="Hyderabad" Value="Hyderabad" />
                        <asp:ListItem Text="Sialkot" Value="Sialkot" />
                        <asp:ListItem Text="Gujrat" Value="Gujrat" />
                        <asp:ListItem Text="Bahawalpur" Value="Bahawalpur" />
                        <asp:ListItem Text="Sargodha" Value="Sargodha" />
                        <asp:ListItem Text="Sukkur" Value="Sukkur" />
                        <asp:ListItem Text="Larkana" Value="Larkana" />
                        <asp:ListItem Text="Sheikhupura" Value="Sheikhupura" />
                        <asp:ListItem Text="Jhang" Value="Jhang" />
                        <asp:ListItem Text="Rahim Yar Khan" Value="Rahim Yar Khan" />
                        <asp:ListItem Text="Mardan" Value="Mardan" />
                        <asp:ListItem Text="Kasur" Value="Kasur" />
                        <asp:ListItem Text="Mingora" Value="Mingora" />
                        <asp:ListItem Text="Dera Ghazi Khan" Value="Dera Ghazi Khan" />
                        <asp:ListItem Text="Nawabshah" Value="Nawabshah" />
                        <asp:ListItem Text="Sahiwal" Value="Sahiwal" />
                        <asp:ListItem Text="Mirpur Khas" Value="Mirpur Khas" />
                        <asp:ListItem Text="Okara" Value="Okara" />
                        <asp:ListItem Text="Burewala" Value="Burewala" />
                        <asp:ListItem Text="Jacobabad" Value="Jacobabad" />
                        <asp:ListItem Text="Saddiqabad" Value="Saddiqabad" />
                        <asp:ListItem Text="Kohat" Value="Kohat" />
                        <asp:ListItem Text="Muridke" Value="Muridke" />
                        <asp:ListItem Text="Muzaffargarh" Value="Muzaffargarh" />
                        <asp:ListItem Text="Khanewal" Value="Khanewal" />
                        <asp:ListItem Text="Gojra" Value="Gojra" />
                        <asp:ListItem Text="Mandi Bahauddin" Value="Mandi Bahauddin" />
                        <asp:ListItem Text="Abbottabad" Value="Abbottabad" />
                        <asp:ListItem Text="Khuzdar" Value="Khuzdar" />
                        <asp:ListItem Text="Swabi" Value="Swabi" />
                        <asp:ListItem Text="Chiniot" Value="Chiniot" />
                        <asp:ListItem Text="Charsadda" Value="Charsadda" />
                        <asp:ListItem Text="Nowshera" Value="Nowshera" />
                        <asp:ListItem Text="Dera Ismail Khan" Value="Dera Ismail Khan" />
                        <asp:ListItem Text="Thatta" Value="Thatta" />
                        <asp:ListItem Text="Bahawalnagar" Value="Bahawalnagar" />
                        <asp:ListItem Text="Vehari" Value="Vehari" />
                        <asp:ListItem Text="Jhelum" Value="Jhelum" />
                        <asp:ListItem Text="Gujranwala Cantonment" Value="Gujranwala Cantonment" />
                        <asp:ListItem Text="Kasur Cantonment" Value="Kasur Cantonment" />
                        <asp:ListItem Text="Mianwali" Value="Mianwali" />
                        <asp:ListItem Text="Mingora Cantonment" Value="Mingora Cantonment" />
                        <asp:ListItem Text="Bhakkar" Value="Bhakkar" />
                        <asp:ListItem Text="Kharian" Value="Kharian" />
                        <asp:ListItem Text="Mian Channun" Value="Mian Channun" />
                        <asp:ListItem Text="Jamshoro" Value="Jamshoro" />
                        <asp:ListItem Text="Chishtian Mandi" Value="Chishtian Mandi" />
                        <asp:ListItem Text="Bhalwal" Value="Bhalwal" />
                        <asp:ListItem Text="Rahimyar Khan Cantonment" Value="Rahimyar Khan Cantonment" />
                        <asp:ListItem Text="Hafizabad" Value="Hafizabad" />
                        <asp:ListItem Text="Sadiqabad" Value="Sadiqabad" />
                        <asp:ListItem Text="Narowal" Value="Narowal" />
                        <asp:ListItem Text="Kamoke" Value="Kamoke" />
                        <asp:ListItem Text="Umerkot" Value="Umerkot" />
                        <asp:ListItem Text="Ahmadpur East" Value="Ahmadpur East" />
                        <asp:ListItem Text="Kotri" Value="Kotri" />
                        <asp:ListItem Text="Sialkot Cantonment" Value="Sialkot Cantonment" />
                        <asp:ListItem Text="Tando Adam" Value="Tando Adam" />
                        <asp:ListItem Text="Harunabad" Value="Harunabad" />
                        <asp:ListItem Text="Pindi Bhattian" Value="Pindi Bhattian" />
                        <asp:ListItem Text="Lodhran" Value="Lodhran" />
                        <asp:ListItem Text="Shikarpur" Value="Shikarpur" />
                        <asp:ListItem Text="Zhob" Value="Zhob" />
                        <asp:ListItem Text="Bhawana" Value="Bhawana" />
                        <asp:ListItem Text="Mianwali Cantonment" Value="Mianwali Cantonment" />
                        <asp:ListItem Text="Kandhkot" Value="Kandhkot" />
                        <asp:ListItem Text="Hasilpur" Value="Hasilpur" />
                        <asp:ListItem Text="Arifwala" Value="Arifwala" />
                        <asp:ListItem Text="Shahdadkot" Value="Shahdadkot" />
                        <asp:ListItem Text="Hujra Shah Muqim" Value="Hujra Shah Muqim" />
                        <asp:ListItem Text="Jampur" Value="Jampur" />
                        <asp:ListItem Text="Vihari" Value="Vihari" />
                        <asp:ListItem Text="Kashmor" Value="Kashmor" />
                    </asp:DropDownList>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col">
                    <asp:Label ID="lblsubject" AssociatedControlID="Subject" Text="Subject: " runat="server" CssClass="mr-2" />
                    <div class="input-group">
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control mr-2 text-left dropdown-width" Style="font-size: 16px;">
                            <asp:ListItem Text="Choose Reply Or First" Value="" />
                            <asp:ListItem Text="Re:" Value="Re: " />
                            <asp:ListItem Text="First:" Value="Subject: " />
                        </asp:DropDownList>
                        <asp:TextBox ID="Subject" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col">
                    <asp:Label ID="Label3" AssociatedControlID="Subject" Text="Dear: " runat="server" CssClass="mr-2" />
                    <div class="input-group">
                        <asp:DropDownList ID="DropDownList3" runat="server" CssClass="form-control mr-2 text-left dropdown-width" Style="font-size: 16px;">
                            <asp:ListItem Text="Choose Title" Value="" />
                            <asp:ListItem Text="Mr:" Value="Mr." />
                            <asp:ListItem Text="Mrs:" Value="Mrs." />
                        </asp:DropDownList>
                        <input type="text" id="Dear" runat="server" readonly="True" class="form-control" />
                    </div>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col">
                    <asp:Label ID="lblDescription" Text="Body Text: " runat="server" CssClass="mr-2" />
                    <textarea id="BodyText" runat="server"></textarea>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col">
                    <asp:Label ID="lblfrom" Text="CC: " runat="server" CssClass="mr-2" /><br />
                    <asp:TextBox ID="Textarea1" runat="server" TextMode="MultiLine" Rows="5" Columns="50"></asp:TextBox>
                </div>
            </div>
            <hr />
            <asp:Button ID="btnGenerate" runat="server" Text="Generate QR Code" OnClick="btnGenerate_Click" />
            <hr />
            <asp:Image ID="imagesQRCode" Width="100px" Height="100px" runat="server" Visible="false" />
            <br />
            <asp:Label ID="Label5" runat="server" Text="Only .pdf files allowed" ForeColor="Red"></asp:Label><br />
            <br />
            <asp:FileUpload ID="documentUpload" runat="server" CssClass="form-upload" /><br />
            <br />
            <asp:Label ID="lblerror" runat="server"></asp:Label><br />
            <div class="d-flex justify-content-between">
                <asp:Button ID="Save" runat="server" CssClass="btn btn-primary" Text="Save" OnClick="Save_Click" />
            </div>
        </div>
        <script>
            function updateSecondTextbox(value) {
                var secondTextbox = document.getElementById("Dear");
                if (value !== undefined && value !== null) {
                    secondTextbox.value = value;
                } else {
                    secondTextbox.value = "";
                }
            }
        </script>
    </form>
</body>
</html>
