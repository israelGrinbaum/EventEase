<%@ Page Title="" Language="C#" MasterPageFile="~/userWebsite/main.Master" AutoEventWireup="true" CodeBehind="addUpdateOrder.aspx.cs" Inherits="eventsHall.userWebsite.addUpdateOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Select2 -->
    <link rel="stylesheet" href="/adminManage/plugins/select2/css/select2.min.css">
    <link rel="stylesheet" href="/adminManage/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
    <link rel="stylesheet" href="https://dtpicker.jewishluach.com/Content/calendar/cangas.datepicker.css">
    <style>
        .form-control:read-only {
            background-color: #fffffc;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="nav" runat="server">
    <section class="content-header" dir="rtl">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 style="color: #ffa102;">הוסף - ערוך הזמנה</h1>
                </div>
                <div class="col-sm-6 primary">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">בית</a></li>
                        <li class="breadcrumb-item active">הוסף - ערוך הזמנה</li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </section>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="maincnt" runat="server">
    <asp:HiddenField ID="HiddenOid" runat="server" />
    <div>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <!-- left column -->
                    <div class="col-md-3">
                    </div>
                    <div class="col-md-6">
                        <!-- general form elements -->
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">הזמנה:</h3>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <div class="card-body">
                                <div class="form-group">
                                    <label>שם לקוח</label>
                                    <asp:TextBox disabled="true" class="form-control disabled" Style="width: 100%; background-color: #e9ecef;" ID="txtUid" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>תאריך אירוע</label>
                                    <asp:TextBox TextMode="DateTimeLocal" ID="txtEventDate" runat="server" class="form-control Required verification-date" placeholder="הכנס תאריך אירוע"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>כמות אנשים</label>
                                    <asp:TextBox ID="txtSomePeople" runat="server" class="form-control verification-number Required" placeholder="הכנס כמות אנשים"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>סוג אירוע</label>
                                    <asp:DropDownList class="select2 form-control Required" data-placeholder="Select a State" Style="width: 100%; background-color: #fffffc;" ID="DDLEventType" runat="server"></asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label>מחיר למנה (אוטומטי בבחירת סוג אירוע)</label>
                                    <input disabled="disabled" class="form-control disabled" style="width: 100%; background-color: #e9ecef;" id="PricePerPortion" placeholder="אוטומטי בבחירת סוג אירוע" />
                                </div>
                                <div class="form-group">
                                    <label>קוד אולם</label>
                                    <asp:DropDownList class="select2 form-control Required" data-placeholder="Select a State" Style="width: 100%; background-color: #fffffc;" ID="DDLHid" runat="server"></asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label>הערות</label>
                                    <asp:TextBox ID="txtNotes" runat="server" class="form-control verification-number" placeholder="הכנס הערות"></asp:TextBox>
                                </div>

                                <div class="card-footer">
                                    <asp:Button ID="btnSave" runat="server" class="btn btn-primary" Text="שמור" OnClick="btnSave_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </section>
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">

    <!-- Select2 -->
    <script src="/adminManage/plugins/select2/js/select2.full.min.js"></script>
    <script src="https://dtpicker.jewishluach.com/Scripts/jewishluach.js"></script>
    <script>
        //$('#maincnt_btnSave').click(function () {
        //    var EventDate = $('#maincnt_txtEventDate')[0].value;
        //    if (new Date() < new Date(EventDate)) {
        //        console.log(false);
        //        return false;
        //    }


        //    return true;
        //});

    </script>
    <script>
        $(function () {
            //$.fn.select2.defaults.set('amdLanguageBase', 'select2/i18n/he');
            $('.select2').select2({ dir: 'rtl' })

            //Initialize Select2 Elements
            $('.select2bs4').select2({
                theme: 'bootstrap4'
            })
            $('.select2-selection').addClass('form-control')
            $('.select2-selection').removeClass('select2-selection select2-selection--single')
            $('.paginate_button current').addClass('btn btn primery')

        })
    </script>
    <asp:Literal ID="ltlEventTypePrice" runat="server"></asp:Literal>
    <script>
        $(function () {
            pricePlanting($('#maincnt_DDLEventType')[0]);
        });
        $('#maincnt_DDLEventType').on('change', (e) => {
            pricePlanting(e.target);
        });
        function pricePlanting(DDLEventType) {
            var eventTypeId = DDLEventType.selectedOptions[0].value;
            for (let i = 0; i < eventTypePrice.length; i++) {
                if (eventTypePrice[i].key == eventTypeId) {
                    document.getElementById('PricePerPortion').value = eventTypePrice[i].value;
                    return;
                }
            }
            document.getElementById('PricePerPortion').value = "לא נבחר סוג אירוע";

        }
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
