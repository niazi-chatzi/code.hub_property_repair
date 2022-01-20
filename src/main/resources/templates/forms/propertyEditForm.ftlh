<#ftl output_format="HTML" strip_whitespace=true>
<#import "/spring.ftl" as spring />
<script src="static/js/lib/jquery/owner_validator.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script>

<div class="container-fluid">

    <div class="row">
        <div class="col">
            <h1>Edit Property</h1>
            <#if errorMessage??>
                <h3 style="color: #dc3545">${errorMessage!""}</h3>
            </#if>
        </div>
    </div>

    <div class="row">
        <div class="col-12">
            <form id="propertyForm" name="propertyForm" action="/admin/properties/edit/${propertyForm.id}" method="post">
                <input type="hidden" id="id" name="id" value="${propertyForm.id}"/>
                <input type="hidden" id="userId" name="userId" value="${propertyForm.userId}"/>

                <div class="form-group">
                    <label for="propertyId">Property ID</label>
                    <@spring.bind "propertyForm.propertyId"/>
                    <input type="text" class="form-control" id="propertyId" name="propertyId" value="${propertyForm.propertyId!""}">
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
                    <input type="text" class="form-control" id="address" name="address" value="${propertyForm.address!""}">
                    <#if spring.status.error??>
                        <ul>
                            <#list spring.status.errorMessages as error>
                                <li style="color: #dc3545">${error}</li>
                            </#list>
                        </ul>
                    </#if>
                </div>

                <div class="form-group">
                    <label for="yearOfConstruction">Year of Construction</label>
                    <@spring.bind "propertyForm.yearOfConstruction"/>
                    <input type="text" class="form-control" id="yearOfConstruction" name="yearOfConstruction" value="${propertyForm.yearOfConstruction!""}">
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
                    <select id="housetype" name="houseType" class="custom-select d-block w-100">
                        <option>Select a house type</option>
                        <#if HOUSE_TYPE??>
                            <#list HOUSE_TYPE as type>
                                <option value="${type}"
                                        <#if propertyForm.houseType??>
                                            <#if type == propertyForm.houseType>
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

                <button class="btn btn-primary btn-lg mt-4" type="submit">Update</button>
            </form>
        </div>
    </div>
</div>
