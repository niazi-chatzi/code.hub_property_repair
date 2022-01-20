jQuery(function ($) {
    $.validator.addMethod("valueNotEquals", function(value, element, arg){
        return arg !== value;
    }, "Value must not equal arg.");
    $("form[name='repairForm']").validate({
        rules: {
            address:{
                required: true,
                minlength: 3
            },
            description:{
                maxlength: 255
            },
            cost:{
                required: true,
                digits: true
            },
            state:{
                "valueNotEquals": "Select a type"
            },
            repairType:{
                "valueNotEquals": "Select a type"
            },
            date:{
                required: true,
                date: true
            },
            userId:{
                required: true,
                digits: true
            }
        },
        messages: {
            address: {
                required: "Please enter your address",
                minlength: "Must contain 3 or more characters"
            },
            description:{
                maxlength: "Must contain less than 255 characters"
            },
            cost:{
                required: "Please enter the cost",
                digits: "Must contain numbers only"
            },
            state:{
                "valueNotEquals": "You have to select a type"
            },
            repairType:{
                "valueNotEquals": "You have to select a type"
            },
            repairType:{
                required: "Please enter a type"
            },
            date:{
                required: "Please enter the date",
                date: "Please enter a valid date in the format 'MM/dd/YYYY'"
            },
            userId:{
                required: "Please enter a user id",
                digits: "User id must contain numbers only"
            }
        }
    })
});
