<#import "../partials/owner-partial.ftlh" as ownerComponent />
<#import "../partials/repair-partial.ftlh" as repairComponent />
<#import "../partials/property-partial.ftlh" as propertyComponent />
<#include "../partials/top-design.ftlh">
        <title>Admin - Owner ${owner.id}</title>
    </head>
    <body>
        <!-- header here -->
        <#include "../partials/navbar.ftlh">
        <#include "../partials/beginContainerWithSidebar.ftlh">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <#if owner?has_content>
                        <h2>The owner</h2>
                        <@ownerComponent.ownerSingle owner/>
                    </#if>
                </div>
            </div>

            <div class="row">
                 <div class="col-12">
                    <#-- If exists show under the user the repairs and properties attached to him -->
                    <#if repairs?has_content>
                        <h2>The repairs of this owner</h2>
                        <#if (repairs?size > 1)><@repairComponent.repairList repairs />
                            <#else> <@repairComponent.repairSingle repairs[0] />
                        </#if>
                    <#else><h2>No repair(s) found for this owner</h2>
                    </#if>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <#if properties?has_content>
                        <h2>The properties of this owner</h2>
                        <#if (properties?size > 1)><@propertyComponent.propertyList properties />
                            <#else> <@propertyComponent.propertySingle properties[0] />
                        </#if>
                    <#else><h2>No properties found for this owner</h2>
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