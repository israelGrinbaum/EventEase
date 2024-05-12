<%@ Page Title="" Language="C#" MasterPageFile="~/adminManage/main.Master" AutoEventWireup="true" CodeBehind="addUpdatePortion.aspx.cs" Inherits="eventsHall.adminManage.addUpdatePortion" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Select2 -->
    <link rel="stylesheet" href="/adminManage/plugins/select2/css/select2.min.css">
    <link rel="stylesheet" href="/adminManage/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
    <!-- Bootstrap4 Duallistbox -->
    <link rel="stylesheet" href="/adminManage/plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainCnt" runat="server">
    <asp:HiddenField ID="HiddenPid" runat="server" />
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>הוסף - ערוך מנה</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">בית</a></li>
                        <li class="breadcrumb-item active">הוסף - ערוך מנה</li>
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
                            <h3 class="card-title">מנה:</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <div class="card-body">
                            <div class="form-group form-floating">
                                <asp:TextBox ID="txtPName" runat="server" class="form-control Required" placeholder="הכנס שם מנה"></asp:TextBox>
                                <label for="mainCnt_txtPName">שם מנה</label>
                            </div>
                            <%--                    <table style="object-fit:contain;text-align:right;direction:rtl;border-color:grey;border:1px solid grey">
                        <tr style="font:bold;font-size:14px"><td style="padding:10px 10px 10px 10px "></td> </tr>
                    </table>--%>
                            <div class="form-group form-floating">
                                <asp:TextBox TextMode="MultiLine" Rows="1" Columns="40" ID="txtPdesc" runat="server" class="form-control" placeholder="הכנס תיאור מנה"></asp:TextBox>
                                <label for="mainCnt_txtPdesc">תיאור מנה</label>
                            </div>
                            <div class="form-group form-floating">
                                <asp:TextBox ID="txtPrice" runat="server" class="form-control Required verification-number" placeholder="הכנס מחיר מנה"></asp:TextBox>
                                <label for="mainCnt_txtPrice">מחיר</label>
                            </div>
                            <div class="form-group form-floating">
                                <asp:Image ID="pic" runat="server" Width="100%" AlternateText="לא ניתן להציג את התמונה" />
                                <label for="mainCnt_pic">תמונה</label>
                            </div>
                            <div class="form-group form-floating">
                                <asp:FileUpload ID="picUpload" runat="server" class="form-control" />
                                <label for="mainCnt_picUpload">העלאת תמונה</label>
                            </div>
                            <div class="form-group form-floating">
                                <asp:ListBox SelectionMode="Multiple" ID="DDLCats" runat="server" class="form-control select2bs4" Style="width: 100%;"></asp:ListBox>
                                <label for="mainCnt_DDLCats">קטגוריות</label>
                                <%--                          <button type="button" class="btn btn-primary" onclick=""--%>
                            </div>


                            <%--                  <div class="form-group">
                    <label >קטגוריית אב</label>
                    <asp:DropDownList ID="DDLparentCat" runat="server" class="form-control"></asp:DropDownList>
                  </div>
                </div>--%>
                            <!-- /.card-body -->

                            <div class="card-footer">
                                <asp:Button ID="btnSave" runat="server" class="btn btn-primary" Text="שמור" OnClick="btnSave_Click" />
                                <a href="portionsList.aspx" class="btn btn-primary">לטבלת מנות</a>
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
        $(function () {
            //Initialize Select2 Elements
            $('.select2bs4').select2({
                theme: 'bootstrap4'
            })
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

        //const demoBaseConfig = {
        //    selector: 'textarea#mainCnt_txtPdesc',
        //    language: 'he_IL',
        //    //width: 755,
        //    //height: 500,
        //    resize: false,
        //    autosave_ask_before_unload: false,
        //    powerpaste_allow_local_images: true,
        //    plugins: [
        //        'a11ychecker', 'advcode', 'advlist', 'anchor', 'autolink', 'codesample', 'fullscreen', 'help',
        //        'image', 'editimage', 'tinydrive', 'lists', 'link', 'media', 'powerpaste', 'preview',
        //        'searchreplace', 'table', 'template', 'tinymcespellchecker', 'visualblocks', 'wordcount'
        //    ],
        //    templates: [
        //        {
        //            title: 'Non-editable Example',
        //            description: 'Non-editable example.',
        //            content: table
        //        },
        //        {
        //            title: 'Simple Table Example',
        //            description: 'Simple Table example.',
        //            content: table2
        //        }
        //    ],
        //    toolbar: 'insertfile a11ycheck undo redo | bold italic | forecolor backcolor | template codesample | alignleft aligncenter alignright alignjustify | bullist numlist | link image',
        //    spellchecker_dialog: true,
        //    spellchecker_ignore_list: ['Ephox', 'Moxiecode'],
        //    tinydrive_demo_files_url: '../_images/tiny-drive-demo/demo_files.json',
        //    tinydrive_token_provider: (success, failure) => {
        //        success({ token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJqb2huZG9lIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.Ks_BdfH4CWilyzLNk8S2gDARFhuxIauLa8PwhdEQhEo' });
        //    },
        //    content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:16px }'
        //};

        tinymce.init(demoBaseConfig);


        //tinymce.init({
        //    selector: 'textarea#mainCnt_txtPdesc',
        //    language: 'he_IL',
        //});

    </script>
</asp:Content>
