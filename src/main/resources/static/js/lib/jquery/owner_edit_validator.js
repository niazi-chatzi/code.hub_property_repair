jQuery(function ($) {
    $.validator.addMethod("valueNotEquals", function(value, element, arg){
        return arg !== value;
    }, "Value must not equal arg.");
    $.validator.addMethod('c_password', function(value){
        if(value == $('#password').val()) {
            return true;
        }
        return false;
    }, "Password and confirm password fields do not match");
    $("form[name='userForm']").validate({
        rules: {
            email: {
                required: true,
                email: true
            },
            afm:{
                required: true,
                minlength: 9,
                maxlength: 9,
                digits: true
            },
            firstName:{
                required: true,
                minlength: 4,
                maxlength: 25
            },
            lastName:{
                required: true,
                minlength: 5,
                maxlength: 30
            },
            address:{
                required: true,
                minlength: 3
            },
            phoneNumber:{
                required: true,
                digits: true,
                minlength: 10,
                maxlength: 10
            },
            houseType:{
                "valueNotEquals": "Select a type"
            },
            roles: {
                "valueNotEquals": "Select a role"
            }
        },
        messages: {
            email: {
                required: "Please enter your Email",
                email: "Please use a real Email"
            },
            afm: {
                required: "Please enter your Afm",
                minlength: "Only 9 characters",
                maxlength: "Only 9 characters",
                digits: "Please use only numbers"
            },
            firstName: {
                required: "Please enter your first name",
                minlength: "Between 4-25 characters",
                maxlength: "Between 4-25 characters",
            },
            lastName: {
                required: "Please enter your last name",
                minlength: "Between 5-25 characters",
                maxlength: "Between 5-25 characters"
            },
            address: {
                required: "Please enter your address",
                minlength: "Must contain 3 or more characters"
            },
            phoneNumber: {
                required: "Please enter your phone number",
                digits: "Phone number should contain only digits",
                minlength: "Only 10 characters",
                maxlength: "Only 10 characters"
            },
            houseType:{
                "valueNotEquals": "Please select one of the above"
            },
            roles: {
                "valueNotEquals": "Select one of the above"
            }
        }
    })
});