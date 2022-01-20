<#import "/spring.ftl" as spring />
<#import "../partials/repair-partial.ftlh" as repairComponent />
<#include "../partials/top-design.ftlh">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
        <title>Admin - Search Repairs</title>
    </head>
    <body>
    <!-- header here -->
    <#include "../partials/navbar.ftlh">
    <#include "../partials/beginContainerWithSidebar.ftlh">
        <div class="container-fluid">
       <div class="row">
     <div class="col-12">
        <#include "../forms/repairSearchForm.ftlh">
        </div>
        </div>

          <div class="row">
                <div class="col-12">
                    <#if repairs?has_content && repairs?is_sequence>
                        <#if repairs?size==1> <@repairComponent.repairSingle repairs[0]/>
                        <#else> <@repairComponent.repairList repairs/> </#if>
                    </#if>
                    <#if isEmpty?? && isEmpty> <h3 class="no-result-found-h3">No repair(s) found</h3> </#if>
                </div>
            </div>
        </div>
        <#include "../partials/endContainerWithSidebar.ftlh">
    <script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/130527/h5ab-snow-flurry.js"></script>
    <script src="/js/lib/jquery/let_it_snow.js"></script>
    <script src="/js/lib/jquery/deleteModal.js"></script>
    </body>
</html>