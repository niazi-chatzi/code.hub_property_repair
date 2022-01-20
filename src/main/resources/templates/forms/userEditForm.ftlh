<#ftl output_format="HTML" strip_whitespace=true>
<#import "/spring.ftl" as spring />
<div class="container-fluid">
    <div class="row">
        <div class="col">
            <h1>Edit Owner</h1>
            <#if errorMessage??>
                <h3 style="color: #dc3545">${errorMessage!""}</h3>
            </#if>
        </div>
    </div>

    <div class="row">
        <div class="col-12">
            <form id="userForm" name="userForm" action="/admin/owners/edit/${userForm.id}" method="post">
                <input type="hidden" id="userId" name="id" value="${userForm.id}">
                <div class="form-group">
                    <label for="email">Email</label>
                    <@spring.bind path="userForm.email"/>
                    <input type="email" class="form-control" id="email" name="email" value="${userForm.email!""}">
                    <#if spring.status.error??>
                        <ul>
                            <#list spring.status.errorMessages as error>
                                <li style="color: #dc3545">${error}</li>
                            </#list>
                        </ul>
                    </#if>
                </div>

                <div class="form-group">
                    <label for="afm">Afm</label>
                    <@spring.bind "userForm.afm"/>
                    <input type="text" class="form-control" id="afm" name="afm" value="${userForm.afm!""}">
                    <#if spring.status.error??>
                        <ul>
                            <#list spring.status.errorMessages as error>
                                <li style="color: #dc3545">${error}</li>
                            </#list>
                        </ul>
                    </#if>
                </div>

                <div class="form-group">
                    <label for="first_name">First Name</label>
                    <@spring.bind "userForm.firstName"/>
                    <input type="text" class="form-control" id="first_name" name="firstName" value="${userForm.firstName!""}">
                    <#if spring.status.error??>
                        <ul>
                            <#list spring.status.errorMessages as error>
                                <li style="color: #dc3545">${error}</li>
                            </#list>
                        </ul>
                    </#if>
                </div>


                <div class="form-group">
                    <label for="last_name">Last Name</label>
                    <@spring.bind "userForm.lastName"/>
                    <input type="text" class="form-control" id="last_name" name="lastName" value="${userForm.lastName!""}">
                    <#if spring.status.error??>
                        <ul>
                            <#list spring.status.errorMessages as error>
                                <li style="color: #dc3545">${error}</li>
                            </#list>
                        </ul>
                    </#if>
                </div>


                <div class="form-row">
                    <div class="col-12 col-md-6">
                        <div class="form-group">
                            <@spring.bind "userForm.address"/>
                            <label for="address">Address</label>
                            <input type="text" class="form-control" id="address" name="address" value="${userForm.address!""}">
                            <#if spring.status.error??>
                                <ul>
                                    <#list spring.status.errorMessages as error>
                                        <li style="color: #dc3545">${error}</li>
                                    </#list>
                                </ul>
                            </#if>
                        </div>
                    </div>

                    <div class="col-12 col-md-6">
                        <div class="form-group">
                            <label for="phone_number">Phone Number</label>
                            <@spring.bind "userForm.phoneNumber"/>
                            <input type="text" class="form-control" id="phone_number" name="phoneNumber" value="${userForm.phoneNumber!""}">
                            <#if spring.status.error??>
                                <ul>
                                    <#list spring.status.errorMessages as error>
                                        <li style="color: #dc3545">${error}</li>
                                    </#list>
                                </ul>
                            </#if>
                        </div>
                    </div>
                </div>


                <div class="form-row">
                    <div class="form-group col-6">
                        <label for="password">Password</label>
                        <@spring.bind "userForm.password"/>
                        <input type="password" class="form-control" id="password" placeholder="Password" name="password">
                        <#if spring.status.error??>
                            <ul>
                                <#list spring.status.errorMessages as error>
                                    <li style="color: #dc3545">${error}</li>
                                </#list>
                            </ul>
                        </#if>
                    </div>
                    <div class="form-group col-6">
                        <label for="confirmPassword">Confirm Password</label>
                        <input type="password" class="c_password form-control" id="confirmPassword" placeholder="Confirm password">
                    </div>
                </div>

                    <div class="form-group">
                        <label for="role">Role</label>
                        <@spring.bind "userForm.roles"/>
                        <select id="roles" name="roles" class="custom-select d-block w-100">
                            <option>Select a role</option>
                            <#if ROLES??>
                                <#list ROLES as roles>
                                    <option value="${roles}"
                                            <#if userForm.roles??>
                                                <#if roles == userForm.roles>
                                                    selected
                                                </#if>
                                            </#if>
                                    >${roles}</option>
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
<#--                    </div>-->

                </div>
                <button class="btn btn-primary btn-lg mt-4" type="submit">Update</button>
            </form>
        </div>
    </div>
</div>
