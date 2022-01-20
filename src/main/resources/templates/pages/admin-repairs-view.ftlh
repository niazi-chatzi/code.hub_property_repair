<#import "../partials/repair-partial.ftlh" as repairComponent />
<#include "../partials/top-design.ftlh">
        <title>Admin - Repairs</title>
    </head>
    <body>
        <!-- header here -->
        <#include "../partials/navbar.ftlh">
        <#include "../partials/beginContainerWithSidebar.ftlh">
        <!-- content here -->
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <#--<#if repairs?has_content>-->
                    <#if repairs?has_content>
                        <h1>Repairs</h1>
                    <#else>
                        <h3>There are no Repairs</h3>
                    </#if>
                </div>
            </div>

            <div class="row">
                <div class="col" style="overflow-x: auto;">
                    <#if repairs?has_content && repairs.getContent()?is_sequence>
                        <@repairComponent.repairList repairs.getContent(), repairs.getTotalPages(), repairs.getNumber() + 1, repairs.getTotalElements()?number, repairs.getSize()/>
                    </#if>
                </div>
            </div>

        <#include "../partials/endContainerWithSidebar.ftlh">
        <!-- footer here -->
            <script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/130527/h5ab-snow-flurry.js"></script>
            <script src="/js/lib/jquery/let_it_snow.js"></script>
            <script src="/js/lib/jquery/deleteModal.js"></script>
    </body>
</html>