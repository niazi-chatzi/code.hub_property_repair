<#import "/spring.ftl" as spring />
<#import "../partials/owner-partial.ftlh" as ownerComponent />
<#include "../partials/top-design.ftlh">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
    <title>Edit Owner</title>
</head>

<body>
<!-- header here -->
<#include "../partials/navbar.ftlh">
<#include "../partials/beginContainerWithSidebar.ftlh">
<div class="container-fluid">
    <div class="row">
        <main role="main" class="col-md-12 ml-xsm-auto col-lg-12 pt-3 px-4">
            <div class="row">
                <div class="col-md-12 order-md-1">
                    <#include "../forms/userEditForm.ftlh">
                </div>
            </div>
        </main>
    </div>
</div>
<#include "../partials/endContainerWithSidebar.ftlh">

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/additional-methods.min.js"></script>
<script src="/js/lib/jquery/owner_edit_validator.js"></script>
<script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/130527/h5ab-snow-flurry.js"></script>
<script src="/js/lib/jquery/let_it_snow.js"></script>
</body>
</html>

