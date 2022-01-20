<#macro repairList repairs totalPages=0 currentPage=0 totalElements=0 pageSize=0 isUser=false>
    <table class="table table-dark table-striped shadow">
        <thead>
            <tr>
                <th>#</th>
                <th>Date</th>
                <th>Address</th>
                <th>State</th>
                <th>Repair Type</th>
                <th>Cost</th>
                <th>Owner</th>
                <th>Description</th>
                <#if !isUser>
                <th>Edit</th>
                <th>Delete</th>
                </#if>
            </tr>
        </thead>

        <tbody>
        <#list repairs as repair>
            <tr>
                <#if isUser>
                    <td>
                        <a <#if (repair.id<10) >class="id-num"</#if> href="/home/repairs/${repair.id}">${repair.id}
                        </a>
                    </td>
                <#else>
                    <td>
                        <a <#if (repair.id<10) >class="id-num"</#if> href="/admin/repairs/${repair.id}">${repair.id}
                        </a>
                    </td>
                </#if>
                <td>${repair.date}</td>
                <td>${repair.address}</td>
                <td>${repair.state}</td>
                <td>${repair.repairType}</td>
                <td style="min-width:80px;">${repair.cost?c} &euro;</td>
                <td>${repair.user}</td>
                <td>${repair.description}</td>


                <#if !isUser>
                <td>
                    <a class="btn btn-link" href="/admin/repairs/edit/${repair.id}">
                        <span data-feather="tool"></span>
                    </a>
                </td>
                <td>
                    <button class="feather-hover btn btn-link trash-style" data-toggle="modal" data-target="#repair-modal"  data-id="${repair.id}">
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
                    <td colspan="7" class="text-right">
                        <#list 1..totalPages as i>
                            <a class="page-number-link ml-1 px-3 btn btn-outline-info<#if currentPage == i> active</#if>" href="/admin/repairs?page=${i}" style="color: white;">${i}</a>
                        </#list>
                    </td>
                </tr>
            </#if>
        </tbody>
    </table>
    <#include "delete-repair-modal.ftlh">
</#macro>

<#macro repairSingle repair isUser=false>
    <table class="table table-dark table-striped shadow">
        <tbody>

            <#if !isUser>
            <tr>
                <td class="font-weight-bold">#</td>
                <td>${repair.id}</td>
            </tr>
            </#if>


            <tr>
                <td class="font-weight-bold">Address</td>
                <td>${repair.address}</td>
            </tr>
            <tr>
                <td class="font-weight-bold">State</td>
                <td>${repair.state}</td>
            </tr>
            <tr>
                <td class="font-weight-bold">Repair Type</td>
                <td>${repair.repairType}</td>
            </tr>
            <tr>
                <td class="font-weight-bold">Cost</td>
                <td>${repair.cost?c} &euro;</td>
            </tr>
            <tr>
                <td class="font-weight-bold">Owner</td>
                <td>${repair.user}</td>
            </tr>
            <tr>
                <td class="font-weight-bold">Description</td>
                <td>${repair.description}</td>
            </tr>
        </tbody>
    </table>

    <#if !isUser>
    <table style="width: 100%">
        <tr>
            <td>
                <form action="/admin/repairs/edit/${repair.id}">
                    <input type="submit" class="btn-primary btn-block btn-lg" value="Edit"></input>
                </form>
            </td>
            <td>
                <form>
                    <input type="button" class="btn-danger btn-block btn-lg" data-toggle="modal" data-target="#repair-modal" data-id="${repair.id}" value="Delete"></input>
                </form>
            </td>
        </tr>
        </tbody>
    </table>
    <#include "../partials/delete-repair-modal.ftlh">
    </#if>

</#macro>