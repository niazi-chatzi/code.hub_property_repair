<#import "../partials/property-partial.ftlh" as propertyComponent />
<#include "../partials/top-design.ftlh">
        <title>Admin - Properties</title>
    </head>
    <body>
        <!-- header here -->
        <#include "../partials/navbar.ftlh">
        <#include "../partials/beginContainerWithSidebar.ftlh">
        <!-- content here -->
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <#--<#if properties?has_content>-->
                    <#if properties?has_content>
                        <h1>Properties</h1>
                    <#else>
                        <h3>There are no Properties</h3>
                    </#if>
                </div>
            </div>

            <div class="row">
                <div class="col" style="overflow-x: auto;">
                    <#if properties?has_content && properties.getContent()?is_sequence>
                        <@propertyComponent.propertyList properties.getContent(), properties.getTotalPages(), properties.getNumber() + 1, properties.getTotalElements()?number, properties.getSize()/>
                    </#if>
                </div>
            </div>

        <#include "../partials/endContainerWithSidebar.ftlh">
            <script src="/js/lib/jquery/deleteModal.js"></script>
        <!-- footer here -->
    </body>
</html>