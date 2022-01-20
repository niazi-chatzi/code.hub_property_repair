<#ftl output_format="HTML" strip_whitespace=true>
<#import "/spring.ftl" as spring />
<div class="container-fluid">

    <div class="row">
        <div class="col">
            <h1>Create Property</h1>
            <#if errorMessage??>
                <h3 style="color: #dc3545">${errorMessage!""}</h3>
            </#if>
        </div>
    </div>

    <div class="row">
        <div class="col-12">
            <form id="propertyForm" name="propertyForm" action="/admin/properties/create" method="post">
                <div class="form-group">
                    <label for="propertyID">Property ID</label>
                    <@spring.bind "propertyForm.propertyId"/>
                    <input type="text" class="form-control" id="propertyId" name="propertyId" placeholder="Insert property ID based on E9" value="${spring.status.value!""}">
                    <#if spring.status.error??>
                        <ul>
                            <#list spring.status.errorMessages as error>
                                <li style="color: #dc3545">${error}</li>
                            </#list>
                        </ul>
                    </#if>
                    </div>
                <div class="form-group">
                    <label for="address">Address</label>
                    <@spring.bind "propertyForm.address"/>
                    <input type="text" class="form-control" id="address" placeholder="Kavalas St. 105, Athens" name="address" value="${spring.status.value!""}">
                    <#if spring.status.error??>
                        <ul>
                            <#list spring.status.errorMessages as error>
                                <li style="color: #dc3545">${error}</li>
                            </#list>
                        </ul>
                    </#if>
                </div>

                <div class="form-group">
                    <label for="user_id">User ID</label>
                    <@spring.bind "propertyForm.userId"/>
                    <input type="text" class="form-control" id="user_id" placeholder="User ID number" name="userId" value="${spring.status.value!""}">
                    <#if spring.status.error??>
                        <ul>
                            <#list spring.status.errorMessages as error>
                                <li style="color: #dc3545">${error}</li>
                            </#list>
                        </ul>
                    </#if>
                </div>

                <div class="form-group">
                    <label for="yearOfConstruction">Year of construction</label>
                    <@spring.bind "propertyForm.yearOfConstruction"/>
                    <input type="number" class="form-control" id="yearOfConstruction" name="yearOfConstruction" placeholder="Insert year of construction" value="${spring.status.value!""}">
                    <#if spring.status.error??>
                        <ul>
                            <#list spring.status.errorMessages as error>
                                <li style="color: #dc3545">${error}</li>
                            </#list>
                        </ul>
                    </#if>
                    </div>
                <div class="form-group">
                    <label for="house_type">House Type</label>
                    <@spring.bind "propertyForm.houseType"/>
                    <select id="house_type" name="houseType" class="custom-select d-block w-100">
                        <option>Select a house type</option>
                        <#if HOUSE_TYPE??>
                            <#list HOUSE_TYPE as type>
                                <option value="${type}"
                                        <#if spring.status.value??>
                                            <#if type == spring.status.value>
                                                selected
                                            </#if>
                                        </#if>

                                >${type}</option>
                            </#list>
                        </#if>
                    </select>
                    <#if spring.status.error??>
                        <ul>
                            <#list spring.status.errorMessages as error>
                                <li style="color: #dc3545">${error}</li>
                            </#list>
                        </ul>
                    </#if>
                </div>
                <button class="btn btn-primary btn-lg mt-4" type="submit">Create</button>
            </form>
        </div>
    </div>
</div>
