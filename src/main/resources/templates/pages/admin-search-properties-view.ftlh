<#import "/spring.ftl" as spring />
<#import "../partials/property-partial.ftlh" as propertyComponent />
<#include "../partials/top-design.ftlh">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
        <title>Admin - Search Properties</title>
    </head>
    <body>
    <!-- header here -->
    <#include "../partials/navbar.ftlh">
    <#include "../partials/beginContainerWithSidebar.ftlh">
        <div class="container-fluid">
       <div class="row">
     <div class="col-12">
        <#include "../forms/propertySearchForm.ftlh">
        </div>

        </div>
              <div class="row">
                <div class="col-12">
                    <#if properties?has_content && properties?is_sequence>
                        <#if properties?size==1> <@propertyComponent.propertySingle properties[0]/>
                        <#else> <@propertyComponent.propertyList properties/> </#if>
                    </#if>
                    <#if isEmpty?? && isEmpty> <h3 class="no-result-found-h3">No property found</h3> </#if>
                </div>
            </div>
        </div>
        <#include "../partials/endContainerWithSidebar.ftlh">
    <script src="/js/lib/jquery/deleteModal.js"></script>
    </body>
</html>