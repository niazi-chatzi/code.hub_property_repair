<#macro ownerList owners totalPages=0 currentPage=0 totalElements=0 pageSize=0>
    <table class="table table-dark table-striped shadow">
        <thead>
        <tr>
            <th>#</th>
            <th>AFM</th>
            <th>Email</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Address</th>
            <th>Phone Number</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <#list owners as owner>
            <tr>
                <td>
                    <a <#if (owner.id<10) >class="id-num"</#if> href="/admin/owners/${owner.id}">${owner.id}</a>
                </td>
                <td>${owner.afm}</td>
                <td>${owner.email}</td>
                <td>${owner.firstName}</td>
                <td>${owner.lastName}</td>
                <td>${owner.address}</td>
                <td>${owner.phoneNumber?c}</td>
                <td>
                    <a a class="btn btn-link" href="/admin/owners/edit/${owner.id}">
                        <span data-feather="tool"></span>
                    </a>
                </td>
                <td>
                    <button class="feather-hover btn btn-link trash-style" data-toggle="modal" data-target="#owner-modal"  data-id="${owner.id}">
                        <span  data-feather="trash-2"></span>
                    </button>

                </td>
            </tr>
        </#list>
            <#if (totalPages > 1)>
                <tr>
                    <td colspan="3">
                        <i>Showing ${(currentPage * pageSize) - (pageSize - 1)} to <#if currentPage  < totalPages>${currentPage * pageSize}<#else>${totalElements}</#if> of ${totalElements}</i>
                    </td>
                    <td colspan="6" class="text-right">
                        <#list 1..totalPages as i>
                            <a class="page-number-link ml-1 px-3 btn btn-outline-info<#if currentPage == i> active</#if>" href="/admin/owners?page=${i}" style="color: white;">${i}</a>
                        </#list>
                    </td>
                </tr>
            </#if>
        </tbody>
    </table>
    <#include "../partials/delete-owner-modal.ftlh">
</#macro>

<#macro ownerSingle owner>
    <table class="table table-dark table-striped shadow">
        <tbody>
        <tr>
            <td class="font-weight-bold">#</td>
            <td>${owner.id}</td>
        </tr>
        <tr>
            <td class="font-weight-bold">Afm</td>
            <td>${owner.afm}</td>
        </tr>
        <tr>
            <td class="font-weight-bold">Email</td>
            <td>${owner.email}</td>
        </tr>
        <tr>
            <td class="font-weight-bold">First Name</td>
            <td>${owner.firstName}</td>
        </tr>
        <tr>
            <td class="font-weight-bold">Last Name</td>
            <td>${owner.lastName}</td>
        </tr>
        <tr>
            <td class="font-weight-bold">Address</td>
            <td>${owner.address}</td>
        </tr>
        <tr>
            <td class="font-weight-bold">Phone Number</td>
            <td>${owner.phoneNumber?c}</td>
        </tr>
    </table>
    <table style="width: 100%">
        <tr>
            <td>
            <form action="/admin/owners/edit/${owner.id}">
                <input type="submit" class="btn-primary btn-block btn-lg" value="Edit"></input>
            </form>
            </td>
            <td>
                <form>
                    <input type="button" class="btn-danger btn-block btn-lg" data-toggle="modal" data-target="#owner-modal" data-id="${owner.id}" value="Delete"></input>
                </form>
            </td>
        </tr>
        </tbody>
    </table>
    <#include "../partials/delete-owner-modal.ftlh">
</#macro>