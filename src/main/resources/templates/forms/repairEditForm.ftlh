<#ftl output_format="HTML" strip_whitespace=true>
<#import "/spring.ftl" as spring />
<script src="static/js/lib/jquery/owner_validator.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script>

<div class="container-fluid">

    <div class="row">
        <div class="col">
            <h1>Edit Repair</h1>
            <#if errorMessage??>
                <h3 style="color: #dc3545">${errorMessage!""}</h3>
            </#if>
        </div>
    </div>

    <div class="row">
        <div class="col-12">
            <form id="repairForm" name="repairForm" action="/admin/repairs/edit/${repairForm.id}" method="post">
                <input type="hidden" id="repairId" name="id" value="${repairForm.id}"/>
                <input type="hidden" id="userId" name="userId" value="${repairForm.userId}"/>
                <div class="form-group">
                    <label for="address">Address</label>
                    <@spring.bind "repairForm.address"/>
                    <input type="text" class="form-control" id="address" name="address" value="${repairForm.address!""}">
                    <#if spring.status.error??>
                        <ul>
                            <#list spring.status.errorMessages as error>
                                <li style="color: #dc3545">${error}</li>
                            </#list>
                        </ul>
                    </#if>
                </div>

                <div class="form-group">
                    <label for="description">Description</label>
                    <@spring.bind "repairForm.description"/>
                    <input type="text" class="form-control" id="description" name="description" value="${repairForm.description!""}">
                    <#if spring.status.error??>
                        <ul>
                            <#list spring.status.errorMessages as error>
                                <li style="color: #dc3545">${error}</li>
                            </#list>
                        </ul>
                    </#if>
                </div>

                <div class="form-group">
                    <label for="cost">Cost</label>
                    <@spring.bind "repairForm.cost"/>
                    <input type="text" class="form-control" id="cost" name="cost" value="${repairForm.cost!spring.status.value!""}">
                    <#if spring.status.error??>
                        <ul>
                            <#list spring.status.errorMessages as error>
                                <li style="color: #dc3545">${error}</li>
                            </#list>
                        </ul>
                    </#if>
                </div>

                <div class="form-group">
                    <label for="date">Date</label>
                    <@spring.bind "repairForm.date"/>
                    <input type="date" class="form-control" id="date" name="date" value="${repairForm.date!""}">
                    <#if spring.status.error??>
                        <ul>
                            <#list spring.status.errorMessages as error>
                                <li style="color: #dc3545">${error}</li>
                            </#list>
                        </ul>
                    </#if>
                </div>

                <div class="form-group">
                    <label for="repair_type">Repair Type</label>
                    <@spring.bind "repairForm.repairType"/>
                    <select id="repair_type" name="repairType" class="custom-select d-block w-100">
                        <option>Select a type</option>
                        <#if REPAIR_TYPE??>
                            <#list REPAIR_TYPE as type>
                                <option value="${type}"
                                        <#if repairForm.repairType??>
                                            <#if type == repairForm.repairType>
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


                <div class="form-group">
                    <label for="state">State</label>
                    <@spring.bind "repairForm.state"/>
                    <select id="state" name="state" class="custom-select d-block w-100">
                        <option>Select a type</option>
                        <#if STATE??>
                            <#list STATE as type>
                                <option value="${type}"
                                        <#if repairForm.state??>
                                            <#if type == repairForm.state>
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
