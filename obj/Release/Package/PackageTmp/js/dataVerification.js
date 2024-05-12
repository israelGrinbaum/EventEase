
$(document).on('change', '.verification-number', (e) => {
    verificationNumber(e);
});
$(document).on('blur', '.verification-date', (e) => {
    verificationDate(e);
});
$(document).on('blur', '.Required', (e) => {
    Required(e);
});
$('#maincnt_btnSave').click(function () {
    return requiredOnSave();
});
$('#mainCnt_btnSave').click(function () {
    return requiredOnSave();
});
$('#btnRegister').click(function () {
    return requiredOnSave();
});
$('#btnLogin').click(function () {
    return requiredOnSave();
});
$('select').on('change', (e) => {
    e.target.parentElement.children[2].children[0].children[0].classList.remove('is-invalid');
    if (e.target.parentElement.children[2].children[0].children[0].parentElement.parentElement.querySelectorAll('.warningMassegeRequired').length > 0)
        e.target.parentElement.children[2].children[0].children[0].parentElement.parentElement.querySelectorAll('.warningMassegeRequired')[0].remove();
});

function verificationNumber(e) {
    let val = + e.target.value;
    let isNum = /^\d+$/.test(val);
    if (!isNum) {
        e.target.classList.add('is-invalid');
        e.target.value = '';
        if (!e.target.parentElement.querySelectorAll('.warningMassegeNumber').length > 0)
        e.target.parentElement.appendChild($('.warningMassegeNumber')[0].cloneNode(true));
    } else if (isNum) {
        e.target.classList.remove('is-invalid');
        e.target.parentElement.querySelector('.warningMassegeNumber').remove();
    }
}
function verificationDate(e) {
    let date = new Date(e.target.value);
    let isValidDate = (date !== 'Invalid Date') && (!isNaN(date)) && (new Date() < date);
    if (!isValidDate) {
        e.target.classList.add('is-invalid');
        if (!e.target.parentElement.querySelectorAll('.warningMassegeDate').length > 0)
            e.target.parentElement.appendChild($('.warningMassegeDate')[0].cloneNode(true));
        e.target.value = '';
    } else if (isValidDate) {
        e.target.classList.remove('is-invalid');
        e.target.parentElement.querySelector('.warningMassegeDate').remove();
    }

}
function Required(e) {
    let val = e.target.value;
    let text = e.target.innerText;
    let isFill = (val != '' && val != null) || (text != '' && text != null);
    if (!isFill) {
        e.target.classList.add('is-invalid');
        if (!e.target.parentElement.querySelectorAll('.warningMassegeRequired').length > 0)
            e.target.parentElement.appendChild($('.warningMassegeRequired')[0].cloneNode(true));
        e.target.value = '';
    } else if (isFill) {
        e.target.classList.remove('is-invalid');
        e.target.parentElement.querySelector('.warningMassegeRequired').remove();
    }
}
function requiredOnSave() {
    let flag = true;
    let RequiredValues = $('.Required');
    for (let i = 0; i < RequiredValues.length; i++) {
        if ((RequiredValues[i].localName == 'input' || RequiredValues[i].localName == 'button') && RequiredValues[i].value == '') {
            RequiredValues[i].classList.add('is-invalid');
            if (!RequiredValues[i].parentElement.querySelectorAll('.warningMassegeRequired').length > 0)
                RequiredValues[i].parentElement.appendChild($('.warningMassegeRequired')[0].cloneNode(true));
            flag = false;
        }
        if (RequiredValues[i].localName == 'select' && RequiredValues[i].selectedIndex == 0) {
            RequiredValues[i].parentElement.children[2].children[0].children[0].classList.add('is-invalid');
            if (RequiredValues[i].parentElement.children[2].children[0].children[0].parentElement.parentElement.querySelectorAll('.warningMassegeRequired').length != 1)
                RequiredValues[i].parentElement.children[2].children[0].parentElement.appendChild($('.warningMassegeRequired')[0].cloneNode(true));
            flag = false;
        }
    }
    isTheInformationCorrect = flag;
    return flag;
}
