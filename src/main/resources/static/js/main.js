$(function() { // <-- is short for $(document).ready(function() {});
    $("#search-user-select").on("change", function(){ toggleUserSearch();} ); // same thing as doing directly from the element
    // its better to call in js so you can see all events at once without having to go in the html and check for events
    $("#search-repair-select").on("change", function(){ toggleRepairSearch();} );
    $("#search-property-select").on("change", function(){ togglePropertySearch();} );
    $(".page-number-link").on("click", function(e) { if($(e.target).hasClass("active")) e.preventDefault(); });
});

// jQuery - toggle visibility for search menus.
function toggleUserSearch() {
    clearNoResultsFoundH3();
    var selectedValue = $("#search-user-select").children("option:selected").val();
    let $emailForm = $("#email-form");
    let $afmFormOwner = $("#afm-form");

    // toggle visibility
    // can be written in less lines but kept it readable
    if(selectedValue === "afm") {
        $emailForm.addClass("display-none");
        $afmFormOwner.removeClass("display-none");
    } else if (selectedValue === "email") {
        $afmFormOwner.addClass("display-none");
        $emailForm.removeClass("display-none");
    }
}

function toggleRepairSearch() {
    clearNoResultsFoundH3();
    var selectedValue = $("#search-repair-select").children("option:selected").val();
    let $afmFormRepair = $("#afm-form");
    let $dateForm = $("#date-form");
    let $dateRangeForm = $("#range-form");

    // toggle visibility
    // can be written in less lines but kept it readable
    if(selectedValue === "afm") {
        $dateForm.addClass("display-none");
        $dateRangeForm.addClass("display-none");
        $afmFormRepair.removeClass("display-none");
    } else if (selectedValue === "date-range"){
        //alert("I'M IN DATE RANGE");
        $dateForm.addClass("display-none");
        $afmFormRepair.addClass("display-none");
        $dateRangeForm.removeClass("display-none");
    } else if (selectedValue === "date") {
        $afmFormRepair.addClass("display-none");
        $dateRangeForm.addClass("display-none");
        $dateForm.removeClass("display-none");
    }
}

function togglePropertySearch() {
    clearNoResultsFoundH3();
    var selectedValue = $("#search-property-select").children("option:selected").val();
    let $afmFormRepair = $("#afm-form");
    let $propertyIdForm = $("#propertyId-form");

    // toggle visibility
    // can be written in less lines but kept it readable
    if(selectedValue === "afm") {
        $propertyIdForm.addClass("display-none");
        $afmFormRepair.removeClass("display-none");
    } else if (selectedValue === "propertyId") {
        $propertyIdForm.removeClass("display-none");
        $afmFormRepair.addClass("display-none");
    }
}

// if the search type changed clear the no results found message
function clearNoResultsFoundH3() { /*$(".no-result-found-h3").remove();*/ return; }
