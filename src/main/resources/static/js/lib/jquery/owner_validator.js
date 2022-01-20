
$.validator.addMethod('c_password', function(value){
    if(value == $('#password').val()){
        return true;
    }
    return false;
}, "Password and confirm password fields do not match");

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
            email:{
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
            password:{
                required: true,
                minlength: 8,
                maxlength: 25,
                pattern: "^(?=.*[A-Z])(?=.*[!@#$&*\\-._+])(?=.*[0-9])(?=.*[a-z]).{8,25}$"
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
            password: {
                required: "Please enter your password",
                minlength: "Between 5-25 characters",
                maxlength: "Between 5-25 characters",
            }
        }
    })
});
