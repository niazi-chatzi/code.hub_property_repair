<#macro propertyList properties totalPages=0 currentPage=0 totalElements=0 pageSize=0 isUser=false>
    <table class="table table-dark table-striped shadow">
        <thead>
            <tr>
                <th>#</th>
                <th>Property ID</th>
                <th>Address</th>
                <th>House Type</th>
                <th>Year of construction</th>
                <th>Owner</th>
                <#if !isUser>
                    <th>Edit</th>
                    <th>Delete</th>
                </#if>
            </tr>
        </thead>

        <tbody>
        <#list properties as property>
            <tr>
                <#if isUser>
                    <td>
                    <a <#if (property.id<10) >class="id-num"</#if> href="/home/properties/${property.id}">${property.id}
                    </a>
                </td>
                <#else>
                    <td>
                    <a <#if (property.id<10) >class="id-num"</#if> href="/admin/properties/${property.id}">${property.id}
                    </a>
                </td>
                </#if>
                <td>${property.propertyId}</td>
                <td>${property.address}</td>
                <td>${property.houseType}</td>
                <td>${property.yearOfConstruction}</td>
                <td>${property.user}</td>
                <#if !isUser>
                    <td>
                        <a class="btn btn-link" href="/admin/properties/edit/${property.id}">
                            <span data-feather="tool"></span>
                        </a>
                    </td>
                    <td>
                        <button class="feather-hover btn btn-link trash-style" data-toggle="modal" data-target="#property-modal" data-id="${property.id}">
                            <span  data-feather="trash-2"></span>
                        </button>
                    </td>
                </#if>
            </tr>
        </#list>
            <#if (totalPages > 1)>
                <tr>
                     <td colspan="3">
                        <i>Showing ${(currentPage * pageSize) - (pageSize - 1)} to <#if currentPage  < totalPages>${currentPage * pageSize}<#else>${totalElements}</#if> of ${totalElements}</i>
                     </td>
                    <td colspan="5" class="text-right">
                        <#list 1..totalPages as i>
                            <a class="page-number-link ml-1 px-3 btn btn-outline-info<#if currentPage == i> active</#if>" href="/admin/properties?page=${i}" style="color: white;">${i}</a>
                        </#list>
                    </td>
                </tr>
            </#if>
        </tbody>
    </table>
    <#include "delete-property-modal.ftlh">
</#macro>

<#macro propertySingle property isUser=false>
    <table class="table table-dark table-striped shadow">
        <tbody>
            <tr>
                <td class="font-weight-bold">#</td>
                <td>${property.id}</td>
            </tr>
            <tr>
                <td class="font-weight-bold">Property ID</td>
                <td>${property.propertyId}</td>
            </tr>
            <tr>
                <td class="font-weight-bold">Address</td>
                <td>${property.address}</td>
            </tr>

            <tr>
                <td class="font-weight-bold">House Type</td>
                <td>${property.houseType}</td>
            </tr>
            <tr>
                <td class="font-weight-bold">Year of construction</td>
                <td>${property.yearOfConstruction} </td>
            </tr>
            <tr>
                <td class="font-weight-bold">Owner</td>
                <td>${property.user}</td>
            </tr>
        </tbody>
    </table>
    <#if !isUser>
        <table style="width: 100%">
            <tr>
                <td>
                    <form action="/admin/properties/edit/${property.id}">
                        <input type="submit" class="btn-primary btn-block btn-lg" value="Edit"></input>
                    </form>
                </td>
                <td>
                    <form>
                        <input type="button" class="btn-danger btn-block btn-lg" data-toggle="modal" data-target="#property-modal" data-id="${property.id}" value="Delete"></input>
                    </form>
                </td>
            </tr>
            </tbody>
        </table>
    </#if>
    <#include "../partials/delete-property-modal.ftlh">
</#macro>