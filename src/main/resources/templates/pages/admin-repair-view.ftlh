<#import "../partials/repair-partial.ftlh" as repairComponent />
<#include "../partials/top-design.ftlh">
        <title>Admin - Repair ${repair.id}</title>
    </head>
    <body>
    <!-- header here -->
    <#include "../partials/navbar.ftlh">
    <#include "../partials/beginContainerWithSidebar.ftlh">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <#if repair?has_content>
                    <@repairComponent.repairSingle repair/>
                </#if>
            </div>
        </div>
    </div>

    <#include "../partials/endContainerWithSidebar.ftlh">
    <script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/130527/h5ab-snow-flurry.js"></script>
    <script src="/js/lib/jquery/let_it_snow.js"></script>
    <script src="/js/lib/jquery/deleteModal.js"></script>
    </body>
</html>