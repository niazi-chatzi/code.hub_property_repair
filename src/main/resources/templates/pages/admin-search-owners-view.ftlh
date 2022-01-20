<#import "/spring.ftl" as spring />
<#import "../partials/owner-partial.ftlh" as ownerComponent />
<#include "../partials/top-design.ftlh">
    <title>Admin- Search Owners</title>
</head>

<body>
<!-- header here -->
<#include "../partials/navbar.ftlh">
<#include "../partials/beginContainerWithSidebar.ftlh">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <#include "../forms/userSearchForm.ftlh">
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <#if owner??> <@ownerComponent.ownerSingle owner /> </#if>
                <#if isEmpty?? && isEmpty> <h3 class="no-result-found-h3">No owner found</h3> </#if>
            </div>
        </div>
    </div>
<#include "../partials/endContainerWithSidebar.ftlh">
<script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/130527/h5ab-snow-flurry.js"></script>
<script src="/js/lib/jquery/let_it_snow.js"></script>
<script src="/js/lib/jquery/deleteModal.js"></script>
</body>
</html>