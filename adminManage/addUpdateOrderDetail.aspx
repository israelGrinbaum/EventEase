<%@ Page Title="" Language="C#" MasterPageFile="~/adminManage/main.Master" AutoEventWireup="true" CodeBehind="addUpdateOrderDetail.aspx.cs" Inherits="eventsHall.adminManage.addUpdateOrderDetail" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Select2 -->
    <link rel="stylesheet" href="/adminManage/plugins/select2/css/select2.min.css">
    <link rel="stylesheet" href="/adminManage/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
    <!-- Bootstrap4 Duallistbox -->
    <link rel="stylesheet" href="/adminManage/plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainCnt" runat="server">
    <asp:HiddenField ID="HiddenODid" runat="server" />
    <asp:HiddenField ID="HiddenOid" runat="server" />
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>הוסף - ערוך פריט הזמנה</h1>
                </div>
                <div class="col-sm-6" style="direction: rtl;">
                    <ol class="breadcrumb slider-rtl float-sm-right" style="direction: rtl;">
                        <li class="breadcrumb-item"><a href="#">בית</a></li>
                        <li class="breadcrumb-item active"><a href="#" class="disabled">הוסף - ערוך פריט הזמנה</a></li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </section>
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <!-- left column -->
                <div class="col-md-6">
                    <!-- general form elements -->
                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">פריט הזמנה:</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <div class="card-body">
                            <div class="form-group">
                                <label>קוד הזמנה</label>
                                <asp:TextBox ID="txtOid" runat="server" class="form-control" placeholder="הכנס קוד הזמנה" disabled="true"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>מנה</label>
                                <button id="btnProd" runat="server" style="text-align: right; color: #6c757d" type="button" class="form-control" data-bs-toggle="modal" data-bs-target="#exampleModal">לבחירת מנה</button>
                                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" dir="rtl">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content" style="align-items: start; align-content: start;">
                                            <div class="modal-header">
                                                <button id="btnCloseProd" type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body" style="width: 100%;">
                                                <div class="container">
                                                    <div class="row">
                                                        <asp:Repeater ID="RPTproducts" runat="server">
                                                            <ItemTemplate>
                                                                <div class="col-md-4">
                                                                    <div class="card" style="padding: 7.5px 7.5px 7.5px 7.5px">
                                                                        <img src="/uploads/pics/portions/<%# Eval("picName") %>" class="card-img-top" alt="...">
                                                                        <div class="card-body">
                                                                            <h4 class="card-title"><%# Eval("Pname") %> </h4>
                                                                            <p class="card-text text-"><%# Eval("price") %> ₪</p>
                                                                            <p class="card-text"><%# Eval("Pdesc") %></p>
                                                                            <a href="#" class="btn btn-info" onclick="selectProd(<%# Eval("Pid") %>,'<%# Eval("Pname") %>','<%# Eval("price") %>')" data-bs-dismiss="modal" aria-label="Close">בחר</a>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:Repeater>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <input id="inputPid" runat="server" hidden />
                            </div>
                            <div class="form-group">
                                <label>כמות</label>
                                <asp:TextBox ID="txtAmount" runat="server" class="form-control" placeholder="הכנס כמות"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>מחיר</label>
                                <asp:TextBox ID="txtPrice" runat="server" class="form-control" placeholder="אוטומטי בבחירת מנה" disabled="true"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>קטגוריית פריט הזמנה</label>
                                <asp:ListBox ID="DDLODCatId" runat="server" class="form-control select2bs4" Style="width: 100%;"></asp:ListBox>

                            </div>

                            <div class="card-footer">
                                <asp:Button ID="btnSave" runat="server" class="btn btn-primary" Text="שמור" OnClick="btnSave_Click" />
                                <a id="orderLink" runat="server" href="#" class="btn btn-primary">חזרה להזמנה</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </section>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <!-- Select2 -->
    <script src="/adminManage/plugins/select2/js/select2.full.min.js"></script>
    <script>
        function selectProd(Pid, Pname, price) {
            document.getElementById("mainCnt_btnProd").innerText = "נבחר: " + Pname;
            document.getElementById("mainCnt_inputPid").value = Pid;
            document.getElementById("mainCnt_txtPrice").value = price;
        }
    </script>
    <script>
        $(function () {
            $('.select2').select2()

            //Initialize Select2 Elements
            $('.select2bs4').select2({
                theme: 'bootstrap4'
            })
            $('.select2-selection').addClass('form-control')
            $('.select2-selection').removeClass('select2-selection select2-selection--single')
            $('.paginate_button current').addClass('btn btn primery')

        })
    </script>
    <script src="../tinymce/js/tinymce/tinymce.min.js"></script>
    <script>


        const table = '<p>This table uses features of the non-editable plugin to make the text in the<br><strong>top row</strong> and <strong>left column</strong> uneditable.</p>' +
            '    <table style="width: 60%; border-collapse: collapse;" border="1"> ' +
            '        <caption class="mceNonEditable">Ephox Sales Analysis</caption> ' +
            '       <tbody> ' +
            '          <tr class="mceNonEditable"> ' +
            '                <th style="width: 40%;">&nbsp;</th><th style="width: 15%;">Q1</th> ' +
            '                <th style="width: 15%;">Q2</th><th style="width: 15%;">Q3</th> ' +
            '                <th style="width: 15%;">Q4</th> ' +
            '            </tr> ' +
            '            <tr> ' +
            '                <td class="mceNonEditable">East Region</td> ' +
            '                <td>100</td> <td>110</td> <td>115</td> <td>130</td> ' +
            '            </tr> ' +
            '            <tr> ' +
            '                <td class="mceNonEditable">Central Region</td> ' +
            '                <td>100</td> <td>110</td> <td>115</td> <td>130</td> ' +
            '            </tr> ' +
            '            <tr> ' +
            '                <td class="mceNonEditable">West Region</td> ' +
            '                <td>100</td> <td>110</td> <td>115</td> <td>130</td> ' +
            '            </tr> ' +
            '        </tbody> ' +
            '    </table>';

        const table2 = '<div> ' +
            '        <p>' +
            '            Templates are a great way to help content authors get started creating content.  You can define the HTML for the template and ' +
            '            then when the author inserts the template they have a great start towards creating content! ' +
            '        </p> ' +
            '        <p> ' +
            '            In this example we create a simple table for providing product details for a product page on your web site.  The headings are ' +
            '            made non-editable by loading the non-editable plugin and placing the correct class on the appropriate table cells. ' +
            '        </p> ' +
            '        <table style="width:90%; border-collapse: collapse;" border="1"> ' +
            '        <tbody> ' +
            '        <tr style="height: 30px;"> ' +
            '            <th class="mceNonEditable" style="width:40%; text-align: left;">Product Name:</td><td style="width:60%;">{insert name here}</td> ' +
            '        </tr> ' +
            '        <tr style="height: 30px;"> ' +
            '            <th class="mceNonEditable" style="width:40%; text-align: left;">Product Description:</td><td style="width:60%;">{insert description here}</td> ' +
            '        </tr> ' +
            '        <tr style="height: 30px;"> ' +
            '            <th class="mceNonEditable" style="width:40%; text-align: left;">Product Price:</td><td style="width:60%;">{insert price here}</td> ' +
            '        </tr> ' +
            '        </tbody> ' +
            '        </table> ' +
            '    </div> ';

        const demoBaseConfig = {
            selector: 'textarea#mainCnt_txtPdesc',
            language: 'he_IL',
            //width: 755,
            //height: 500,
            resize: false,
            autosave_ask_before_unload: false,
            powerpaste_allow_local_images: true,
            plugins: [
                'a11ychecker', 'advcode', 'advlist', 'anchor', 'autolink', 'codesample', 'fullscreen', 'help',
                'image', 'editimage', 'tinydrive', 'lists', 'link', 'media', 'powerpaste', 'preview',
                'searchreplace', 'table', 'template', 'tinymcespellchecker', 'visualblocks', 'wordcount'
            ],
            templates: [
                {
                    title: 'Non-editable Example',
                    description: 'Non-editable example.',
                    content: table
                },
                {
                    title: 'Simple Table Example',
                    description: 'Simple Table example.',
                    content: table2
                }
            ],
            toolbar: 'insertfile a11ycheck undo redo | bold italic | forecolor backcolor | template codesample | alignleft aligncenter alignright alignjustify | bullist numlist | link image',
            spellchecker_dialog: true,
            spellchecker_ignore_list: ['Ephox', 'Moxiecode'],
            tinydrive_demo_files_url: '../_images/tiny-drive-demo/demo_files.json',
            tinydrive_token_provider: (success, failure) => {
                success({ token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJqb2huZG9lIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.Ks_BdfH4CWilyzLNk8S2gDARFhuxIauLa8PwhdEQhEo' });
            },
            content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:16px }'
        };

        tinymce.init(demoBaseConfig);


    //tinymce.init({
    //    selector: 'textarea#mainCnt_txtPdesc',
    //    language: 'he_IL',
    //});

    </script>
</asp:Content>
