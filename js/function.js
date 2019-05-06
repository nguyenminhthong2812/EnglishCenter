$(document).ready(function () {
    $(document).keypress(function (e) {
        if (e.keyCode == 13)
            e.preventDefault();
    });
});


function SetTarget() {
    originalTarget = document.forms[0].target;
    document.forms[0].target = '_blank';
    window.setTimeout("document.forms[0].target=originalTarget;", 300);
    return true;
}