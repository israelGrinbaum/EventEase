﻿<%@ Page Title="" Language="C#" MasterPageFile="~/userWebsite/main.Master" AutoEventWireup="true" CodeBehind="addUpdateOrderDetail.aspx.cs" Inherits="eventsHall.userWebsite.addUpdateOrderDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .tab {
            display: none;
        }

        .nav-tabs {
            --bs-nav-tabs-border-width: 0;
            border-bottom: 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="nav" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="maincnt" runat="server">
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
                <div class="col-md-2">
                </div>
                <div class="col-md-8">
                    <!-- general form elements -->
                    <ul class="nav nav-tabs">
                        <asp:Repeater ID="RptCats" runat="server">
                            <ItemTemplate>
                                <li class="nav-item">
                                    <h3 class="nav-link cat-name" style="font-weight: bold; font-size: larger"><%# Eval("catName") %></h3>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>

                    <asp:Repeater ID="rptPortions" runat="server" OnItemDataBound="rptPortions_ItemDataBound">
                        <ItemTemplate>
                            <div class="tab card card-primary">
                                <div class="card-header">
                                    <p id="orderDetailId<%# Eval("Cid") %>">מקסימום לבחירה:</p>
                                </div>
                                <!-- /.card-header -->
                                <!-- form start -->
                                <div class="card-body">
                                    <div class="form-group">
                                        <div class="row">
                                            <asp:Repeater ID="RPTproducts" runat="server" OnItemDataBound="RPTproducts_ItemDataBound">
                                                <ItemTemplate>
                                                    <div class="col-md-4">
                                                        <div class="card" style="padding: 7.5px 7.5px 7.5px 7.5px;">
                                                            <img src="/uploads/pics/portions/<%# Eval("picName") %>" class="card-img-top" alt="...">
                                                            <div class="card-body">
                                                                <h4 class="card-title"><%# Eval("Pname") %> </h4>
                                                                <p class="card-text text-"><%# Eval("price") %> ₪</p>
                                                                <p class="card-text"><%# Eval("Pdesc") %></p>
                                                                <asp:Literal ID="ltlSelectPortionCB" runat="server"></asp:Literal>
                                                                <%--                                                                <input type="checkbox" class="btn-check" autocomplete="off"\>--%>
                                                                <label name="SelectButton" class="btn btn-outline-primary Select-Button" for="btn-check-outlined-<%# Eval("Pid") %>">בחר</label><br>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>מחיר</label>
                                        <asp:TextBox ID="txtPrice" runat="server" class="form-control" placeholder="אוטומטי בבחירת מנה" disabled="true"></asp:TextBox>
                                    </div>

                                    <div class="card-footer">
                                        <%--                                        <asp:Button ID="btnSave" runat="server" class="btn btn-primary" Text="שמור" OnClick="btnSave_Click" />--%>
                                        <a id="prevBtn" href="#" onclick="nextPrev(-1)" class="btn btn-primary">הקודם</a>
                                        <a style="opacity:0;pointer-events:none" class="btn">1</a>
                                        <%--                                        <a id="orderLink" runat="server" href="#" onclick="window.location='orderDetails.aspx?Oid='+document.getElementById('mainCnt_txtOid').value" class="btn btn-primary">חזרה להזמנה</a>--%>
                                        <span id="btnNext&save">

                                        </span>
                                        <div style="position:absolute;left:6%;" class="btn-group">
                                            <button id="btnSave" type="button" class="btn btn-primary" onclick="SavePortions('<%# Eval("Cid") %>')">שמור והבא</button>
                                            <button type="button" class="btn btn-primary dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
                                                <span class="visually-hidden">Toggle Dropstart</span>
                                            </button>
                                            <ul class="dropdown-menu dropdown-menu-end primary">
                                                <a href="#" onclick="nextPrev(1)" class="dropdown-item btn-primary primary">הבא</a>
                                            </ul>
                                        </div>

                                    </div>
                                    <div onclick="selectProd(@#Pid#@,'@#Pname#@','@#price#@')"></div>
                                </div>
                            </div>

                        </ItemTemplate>

                    </asp:Repeater>
                    <%--                    <div style="overflow: auto;">
                        <div style="float: right;">
                            <button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
                            <button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
                        </div>
                    </div>--%>
                </div>
            </div>
    </section>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
    <script>
        var currentTab = 0; // Current tab is set to be the first tab (0)
        showTab(currentTab); // Display the current tab

        function showTab(n) {
            // This function will display the specified tab of the form ...
            var x = document.getElementsByClassName("tab");
            var y = document.getElementsByClassName("cat-name");
            x[n].style.display = "block";
            y[n].classList.add("active");
            // ... and fix the Previous/Next buttons:
            if (n == 0) {
                document.getElementById("prevBtn").style.display = "none";
            } else {
                document.getElementById("prevBtn").style.display = "inline";
            }
            if (n == (x.length - 1)) {
                var btnSave = document.getElementById("btnSave");
                document.getElementById("btnNext&save").innerHTML = btnSave;
                document.getElementById("btnSave").innerHTML = "שמור";
            }
            //} else {
            //    document.getElementById("btnNext&save").innerHTML = "שמור והבא";
            //}
            // ... and run a function that displays the correct step indicator:
        //    fixStepIndicator(n)
        }

        function nextPrev(n) {
            // This function will figure out which tab to display
            var x = document.getElementsByClassName("tab");
            var y = document.getElementsByClassName("cat-name");
            // Exit the function if any field in the current tab is invalid:
            //if (n == 1 && !validateForm()) return false;
            // Hide the current tab:
            x[currentTab].style.display = "none";
            y[currentTab].classList.remove("active");
            // Increase or decrease the current tab by 1:
            currentTab = currentTab + n;
            // if you have reached the end of the form... :
            if (currentTab >= x.length) {
                //...the form gets submitted:
                //document.getElementById("regForm").submit();
                var url = window.location;
                let params = new URLSearchParams(url.search);
                let oid = params.get('Oid');
                location.assign("http://localhost:46327/userWebsite/orderDetail.aspx?Oid=" + oid);
                return false;
            }
            // Otherwise, display the correct tab:
            showTab(currentTab);
        }

        function validateForm() {
            // This function deals with validation of the form fields
            var x, y, i, valid = true;
            x = document.getElementsByClassName("tab");
            y = x[currentTab].getElementsByTagName("input");
            // A loop that checks every input field in the current tab:
            for (i = 0; i < y.length; i++) {
                // If a field is empty...
                if (y[i].value == "") {
                    // add an "invalid" class to the field:
                    y[i].className += " invalid";
                    // and set the current valid status to false:
                    valid = false;
                }
            }
            // If the valid status is true, mark the step as finished and valid:
            if (valid) {
                document.getElementsByClassName("step")[currentTab].className += " finish";
            }
            return valid; // return the valid status
        }

        //function fixStepIndicator(n) {
        //    // This function removes the "active" class of all steps...
        //    var i, x = document.getElementsByClassName("step");
        //    for (i = 0; i < x.length; i++) {
        //        x[i].className = x[i].className.replace(" active", "");
        //    }
        //    //... and adds the "active" class to the current step:
        //    x[n].className += "active";
        //}

    </script>
    <asp:Literal ID="ltlODPermitted" runat="server"></asp:Literal>
    <script>
        $('.Select-Button').on('click', function (e) {
            var portionsSameCat = $("input[name*='" + e.target.parentElement.children[3].name + "']");
            disableSelctedCat(portionsSameCat, currentTab);
        });
        function disableSelctedCat(portionsSameCat, catIndex) {
            var cnt = 0;
            setTimeout(() => {
                for (let i = 0; i < portionsSameCat.length; i++) {
                    if (portionsSameCat[i].checked) {
                        cnt++;
                    }
                }
                if (cnt >= ODpermitted[catIndex].choiceQuantity) {
                    for (let i = 0; i < portionsSameCat.length; i++) {
                        if (!portionsSameCat[i].checked) {
                            portionsSameCat[i].parentElement.children[4].classList.add("disabled");
                        }
                    }
                    let id = "orderDetailId" + ODpermitted[catIndex].orderDetailId;
                    document.getElementById(id).innerHTML += "<span class=\"badge bg-primary\">נבחר</span>";
                } else if (cnt < ODpermitted[catIndex].choiceQuantity) {
                    for (let i = 0; i < portionsSameCat.length; i++) {
                        portionsSameCat[i].parentElement.children[4].classList.remove("disabled");
                    }
                    let id = "orderDetailId" + ODpermitted[catIndex].orderDetailId;
                    document.getElementById(id).innerHTML = document.getElementById(id).innerHTML.replace("<span class=\"badge bg-primary\">נבחר</span>", "");
                }
                console.log(cnt);
            },);

        }
    </script>
    <script>
        $(
            function choiceQuantity() {
                for (let i = 0; i < ODpermitted.length; i++) {
                    let id = "orderDetailId" + ODpermitted[i].orderDetailId;
                    document.getElementById(id).innerText += (ODpermitted[i].choiceQuantity + " ");
                }
            });
        $(
            function getSpecificCat() {
                var url = window.location;
                let params = new URLSearchParams(url.search);
                let cid = params.get('Cid');
                for (let i = 0; i < ODpermitted.length; i++) {
                    if (ODpermitted[i].orderDetailId == cid) {
                        nextPrev(i);
                    }
                }
            });
    </script>
    <script>
        async function SavePortions(Cid) {
            var portionsWithActiveCat = $("input[name*='" + Cid + "']");
            var portions = [];
            for (let i = 0; i < portionsWithActiveCat.length; i++) {
                if (portionsWithActiveCat[i].checked) {
                    portions.push({ "Pid": portionsWithActiveCat[i].value, "ODCatId": Cid });
                }
            }
            var pid = JSON.stringify({ "OrderDetails": portions });
            await jQuery.ajax({
                url: 'http://localhost:46327/userWebsite/addUpdateOrderDetail.aspx/SavePortion',
                type: "POST",
                data: pid,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: await function (data) {
                    var res = JSON.parse(data.d);
                    console.log(res);
                    if (data.d == "{\"not objects send\":\"\"}") {
                        console.log("i'm stop this procces");
                        return;
                    }
                    else {
                        nextPrev(1);
                    }
                },
            });

            console.log(portions);
        }

    </script>
    <script>
        $(() => {
            for (let i = 0; i < ODpermitted.length; i++) {
                var portionsSameCat = $("input[name*='" + ODpermitted[i].orderDetailId + "']");
                disableSelctedCat(portionsSameCat, i);
                for (let j = 0; j < portionsSameCat.length; j++) {
                    if (portionsSameCat[j].checked == true) {
                        paintBorderOnCheck(portionsSameCat[j]);
                    }
                }
            }
        });
        $('.Select-Button').on('click', function (e) {
            paintBorderOnCheck(e.target);
        });
        function paintBorderOnCheck(e) {
            if (e.parentElement.parentElement.style.borderColor == "rgba(0, 0, 0, 0.13)" ||
                e.parentElement.parentElement.style.borderColor == "") {
                e.parentElement.parentElement.style.borderColor = "orange";
            }
            else if (e.parentElement.parentElement.style.borderColor == "orange") {
                e.parentElement.parentElement.style.borderColor = "rgb(0 0 0 / 13%)";
            }
        }
    </script>
</asp:Content>