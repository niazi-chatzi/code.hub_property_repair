<#import "../partials/repair-partial.ftlh" as repairComponent>
<html lang="en">
    <head>
        <#include "../partials/html-header-partial.ftlh">
        <link rel="stylesheet" href="css/snow.css">
        <title>Home</title>
    </head>
    <body>
        <!-- header here -->
        <#include "../partials/navbar.ftlh">
        <!-- content here -->
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <h1>Repair</h1>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <#if repairs?has_content>
                        <div class="table-responsive"><@repairComponent.repairSingle repairs true /></div>
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