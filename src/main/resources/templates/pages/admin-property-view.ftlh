<#import "../partials/property-partial.ftlh" as propertyComponent />
<#include "../partials/top-design.ftlh">
        <title>Admin - Property ${property.id}</title>
    </head>
    <body>
    <!-- header here -->
    <#include "../partials/navbar.ftlh">
    <#include "../partials/beginContainerWithSidebar.ftlh">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <#if property?has_content>
                    <@propertyComponent.propertySingle property/>
                </#if>
            </div>
        </div>
    </div>

    <#include "../partials/endContainerWithSidebar.ftlh">
    <script src="/js/lib/jquery/deleteModal.js"></script>
    </body>
</html>