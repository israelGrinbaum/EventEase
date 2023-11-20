<%@ Page Title="" Language="C#" MasterPageFile="~/adminManage/main.Master" AutoEventWireup="true" CodeBehind="addUpdateEventType.aspx.cs" Inherits="eventsHall.adminManage.addUpdateEventType" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Select2 -->
    <link rel="stylesheet" href="/adminManage/plugins/select2/css/select2.min.css">
    <link rel="stylesheet" href="/adminManage/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
    <!-- Bootstrap4 Duallistbox -->
    <link rel="stylesheet" href="/adminManage/plugins/bootstrap4-duallistbox/bootstrap-duallistbox.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mainCnt" runat="server">
    <asp:HiddenField ID="HiddenETid" runat="server" />
    <asp:HiddenField ID="HiddenODPs" runat="server" />
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>הוסף - ערוך סוג אירוע</h1>
                </div>
                <div class="col-sm-6" style="direction: rtl;">
                    <ol class="breadcrumb slider-rtl float-sm-right" style="direction: rtl;">
                        <li class="breadcrumb-item"><a href="#">בית</a></li>
                        <li class="breadcrumb-item active"><a href="#" class="disabled">הוסף - ערוך סוג אירוע</a></li>
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
                            <h3 class="card-title">סוג אירוע:</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <div class="card-body">
                            <div class="form-group">
                                <label>שם סוג אירוע</label>
                                <asp:TextBox ID="txtETname" runat="server" class="form-control" placeholder="הכנס שם סוג אירוע"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>מחיר למנה</label>
                                <asp:TextBox ID="txtPricePerPortion" runat="server" class="form-control" placeholder="הכנס מחיר אירוע"></asp:TextBox>
                            </div>
                            <%--                            <div class="form-group">
                                <label>פריטי הזמנה מאופשרים</label>
                                <asp:ListBox SelectionMode="Multiple" ID="DDLOrderDetailsPermitted" runat="server" class="form-control select2bs4" placeholder="הכנס שם סוג אירוע"></asp:ListBox>
                            </div>--%>

                            <div id="ODPInputs" class="form-group">
                                <label style="margin-bottom: 15px;">פריטי הזמנה מאופשרים</label>
                                <input hidden="hidden" id="hiddenNumOfODP" value="1" runat="server" />
                                <button type="button" class="btn btn-primary" text="הוסף פריט" id="btnAddODP" onclick="addODPInput()">הוסף</button>
                                <div id="inputTemp">
                                    <div id="ODPInput1" class="form-group" style="border: 1px solid; border-color: #a9a9a985; border-radius: 8px; padding: 15px;">
                                        <input hidden="hidden" id="ODPid1" value="-1" />
                                        <div class="input-group">
                                            <asp:DropDownList ID="ODPListBox1" runat="server" class="form-control select2-blue" placeholder="הכנס שם סוג אירוע"></asp:DropDownList>
                                            <a href="#" class="btn btn-danger" onclick="if(confirm('האם אתה בטוח?')) deleteODP(document.getElementById('ODPid1').value,ODPInput1)">
                                                <i class="fa-solid fa-trash-alt"></i>
                                            </a>
                                        </div>
                                        <div class="input-group">
                                            <div class="input-group-text" style="padding-left: 27px;">
                                                <input id="inputODPcb1" class="form-check-input mt-0" type="checkbox" value="" aria-label="Checkbox for following text input">
                                            </div>
                                            <span class="input-group-text" style="border-left: solid">אופציונאלי</span>
                                            <input type="number" class="form-control" placeholder="כמות לבחירה" id="inputODPn1" />
                                        </div>
                                    </div>
                                </div>
                            </div>



                            <div class="card-footer">
                                <asp:Button ID="btnSave" runat="server" class="btn btn-primary" Text="שמור" OnClientClick="btnSave()" />
                                <a href="eventTypesList.aspx" class="btn btn-primary">לטבלת סוגי אירוע</a>
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
        function addODPInput() {
            let numOfInputs = Number(document.getElementById("mainCnt_hiddenNumOfODP").value) + 1;
            let id = "inputODP" + numOfInputs;
            var input = document.createElement('div');
            let st = document.getElementById("inputTemp").innerHTML;
            st = st.replace("ODPInput1", "ODPInput" + numOfInputs);
            st = st.replace("ODPInput1", "ODPInput" + numOfInputs);
            st = st.replace("mainCnt_ODPListBox1", "mainCnt_ODPListBox" + numOfInputs);
            st = st.replace("inputODPcb1", "inputODPcb" + numOfInputs);
            st = st.replace("inputODPn1", "inputODPn" + numOfInputs);
            st = st.replace("ODPid1", "ODPid" + numOfInputs);
            st = st.replace("ODPid1", "ODPid" + numOfInputs);
            input.innerHTML = st;
            document.getElementById("ODPInputs").appendChild(input);
            document.getElementById("mainCnt_hiddenNumOfODP").value = numOfInputs;
        }
        function sendToSave(eventType) {
            jQuery.ajax({
                url: 'http://localhost:46327/adminManage/addUpdateEventType.aspx/saveEventType',
                type: "POST",
                data: "{'eventType' : " + eventType + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    res = JSON.parse(data.d);
                    console.log(res);
                },
            });
        };
        function btnSave() {
            console.log(document.getElementById("mainCnt_hiddenNumOfODP").value);
            let numOfODP = document.getElementById("mainCnt_hiddenNumOfODP").value;
            let eventType = { ETid: document.getElementById("mainCnt_HiddenETid").value, ETname: document.getElementById("mainCnt_txtETname").value, PricePerPortion: document.getElementById("mainCnt_txtPricePerPortion").value, orderDetailPermitteds: [] };
            for (let i = 0; i < numOfODP; i++) {
                console.log(i);
                let odp = { ODPid: -1, eventTypeId: -1, orderDetailId: "", optional: 0, choiceQuantity: "" };
                let id = "ODPid" + (i + 1);
                odp.ODPid = document.getElementById(id).value
                id = "mainCnt_ODPListBox" + (i + 1);
                odp.orderDetailId = document.getElementById(id).value;
                id = "inputODPn" + (i + 1);
                odp.choiceQuantity = document.getElementById(id).value;
                id = "inputODPcb" + (i + 1);
                odp.optional = document.getElementById(id).checked;
                eventType.orderDetailPermitteds.push(odp);
            }
            sendToSave(JSON.stringify(eventType));
            console.log(eventType);
        }
        function deleteODP(ODPid, ODPInputN) {
            //let a = document.getElementById(ODPInputN + "");
            ODPInputN.remove();
            jQuery.ajax({
                url: 'http://localhost:46327/adminManage/addUpdateEventType.aspx/deleteODP',
                type: "POST",
                data: "{'ODPid' : " + ODPid + "}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    res = JSON.parse(data.d);
                    console.log(res);
                },
            });

        }
    </script>
    <script>
        $(function () {
            let orderDetailsPermitted = JSON.parse(document.getElementById("mainCnt_HiddenODPs").value);
            for (let i = 0; i < orderDetailsPermitted.length; i++) {
                let numOfInputs = Number(document.getElementById("mainCnt_hiddenNumOfODP").value);
                document.getElementById("mainCnt_ODPListBox" + numOfInputs).value = orderDetailsPermitted[i].orderDetailId;
                document.getElementById("inputODPcb" + numOfInputs).checked = orderDetailsPermitted[i].optional;
                document.getElementById("inputODPn" + numOfInputs).value = orderDetailsPermitted[i].choiceQuantity;
                document.getElementById("ODPid" + numOfInputs).value = orderDetailsPermitted[i].ODPid;
                //document.getElementById("deleteODP" + numOfInputs).innerHTML = document.getElementById("deleteODP" + numOfInputs).innerHTML.replace("'ODPidToDelete" + numOfInputs+"'", orderDetailsPermitted[i].ODPid)
                if (i < orderDetailsPermitted.length - 1) {
                    addODPInput();
                }
            }
            console.log(orderDetailsPermitted);
        });
    </script>
    <script>
        $(function () {
            $('.select2').select2()

            //Initialize Select2 Elements
            $('.select2bs4').select2({
                theme: 'classic',
                //    innerHeight: 'resolve',
                //    class: 'form-control',
                //    ClipboardItem:
            });
            $('.select2-selection').addClass('form-control')
            //$('.select2-selection').removeClass('select2-selection select2-selection--single')
            //$('.paginate_button current').addClass('btn btn primery')

        });
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
