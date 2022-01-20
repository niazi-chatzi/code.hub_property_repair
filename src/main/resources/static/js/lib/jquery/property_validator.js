jQuery(function ($) {
    $.validator.addMethod("valueNotEquals", function(value, element, arg){
        return arg !== value;
    }, "Value must not equal arg.");
    $("form[name='propertyForm']").validate({
        rules: {
            address: {
                required: true,
                minlength: 3
            },
            houseType: {
                "valueNotEquals": "Select a house type"
            },
            yearOfConstruction: {
                required: true,
                digits: true
            },
            userId: {
                required: true,
                digits: true
            },
            propertyId: {
                required: true,
                digits: true
            }
        },
        messages: {
            address: {
                required: "Please enter your address",
                minlength: "Must contain 3 or more characters"
            },
            houseType:{
                "valueNotEquals": "You have to select a type"
            },
            yearOfConstruction: {
                required: "Please enter the date",
                digits: "Please enter a valid year"
            },
            userId:{
                required: "Please enter a user id",
                digits: "User id must contain numbers only"
            },
            propertyId:{
                required: "Please enter a property id",
                digits: "Property id must contain numbers only"
            }
        }
    })
});

