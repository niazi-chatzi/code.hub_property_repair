<#import "../partials/repair-partial.ftlh" as repairComponent>
<#import "../partials/property-partial.ftlh" as propertyComponent>
<html lang="en">
    <head>
        <#include "../partials/html-header-partial.ftlh">
        <title>Home</title>
    </head>
    <body>
    <!-- header here -->
    <#include "../partials/navbar.ftlh">
    <!-- content here -->
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h1>Welcome ${userName!"user"},</h1>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <#if repairs?size != 0>
                    <h2>Your repairs:</h2>
                    <div class="table-responsive"><@repairComponent.repairList repairs, 0, 0, 0, 0, true /></div>
                <#else>
                    <h2>You dont have repairs yet</h2>
                </#if>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <#if properties?size != 0>
                    <h2>Your properties:</h2>
                    <div class="table-responsive"><@propertyComponent.propertyList properties, 0, 0, 0, 0, true /></div>
                <#else>
                    <h2>You dont have repairs yet</h2>
                </#if>
            </div>
        </div>
    </div>
    <!-- footer here -->
    <#include "../partials/scripts.ftlh">
    <script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/130527/h5ab-snow-flurry.js"></script>
    <script src="/js/lib/jquery/let_it_snow.js"></script>
    </body>
</html>