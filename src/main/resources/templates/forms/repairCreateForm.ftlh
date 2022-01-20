<#ftl output_format="HTML" strip_whitespace=true>
<#import "/spring.ftl" as spring />
<div class="container-fluid">

    <div class="row">
        <div class="col">
            <h1>Create Repair</h1>
            <#if errorMessage??>
                <h3 style="color: #dc3545">${errorMessage!""}</h3>
            </#if>
        </div>
    </div>

    <div class="row">
        <div class="col-12">
            <form id="repairForm" name="repairForm" action="/admin/repairs/create" method="post">
                <div class="form-group">
                    <label for="address">Address</label>
                    <@spring.bind "repairForm.address"/>
                    <input type="text" class="form-control" id="address" name="address"  placeholder="Kavalas St. 105, Athens" value="${spring.status.value!""}">
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
                    <input type="text" class="form-control" id="description" name="description" placeholder="Insert description" value="${spring.status.value!""}">
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
                    <@spring.bind "repairForm.userId"/>
                    <input type="text" class="form-control" id="userId" name="userId" placeholder="User ID number" value="${spring.status.value!""}">
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
                    <input type="text" class="form-control" id="cost" name="cost" placeholder="Cost [Euros]" value="${spring.status.value!""}">
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
                    <input type="date" class="form-control" id="date" name="date">
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
                                        <#if spring.status.value??>
                                            <#if  type == spring.status.value>
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
