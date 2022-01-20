<h1 class="">Search for a Repair</h1>

<div class="form-group">
    <label for="search-repair-select">Search by</label>
    <select id="search-repair-select" class="form-control">
        <option value="date" selected> Date </option>
        <option value="date-range" <#if RequestParameters.fromDate?? && RequestParameters.toDate??>selected</#if>> Range of Dates </option>
        <option value="afm" <#if RequestParameters.afm??>selected</#if>>AFM</option>
    </select>
</div>
<form id="date-form" action="/admin/repairs/search" name="searchForm" class="<#if !RequestParameters?has_content || RequestParameters.date??>display-block<#else>display-none</#if>">
    <div id="date-div">
        <div class="row">
            <div class="col-12"><label for="date">Date</label></div>
        </div>

        <div class="row">
            <div class="input-group col-12">
                <div class="input-group-prepend">
                    <span class="input-group-text"><span data-feather="calendar"></span></span>
                </div>
                <input type="date" class="form-control" name="date" id="date" value="<#if RequestParameters.date??>${RequestParameters.date}</#if>">
            </div>
        </div>
    </div>
    <button class="btn btn-primary btn-lg mt-4" type="submit">Search</button>
</form>
<form id="range-form" action="/admin/repairs/search" class="<#if RequestParameters.fromDate?? && RequestParameters.toDate??>display-block<#else>display-none</#if>">
    <div id="range-div">
        <div class="row">
            <div class="col-6"><label for="fromDate">From Date</label></div>
            <div class="col-6"><label for="toDate">To Date</label></div>
        </div>
        <div class="row">
            <div class="input-group col-6">
                <div class="input-group-prepend">
                    <span class="input-group-text"><span data-feather="calendar"></span></span>
                </div>
                <input type="date" class="form-control" name="fromDate" id="fromDate" value="<#if RequestParameters.fromDate??>${RequestParameters.fromDate}</#if>">
            </div>
            <div class="input-group col-6">
                <div class="input-group-prepend">
                    <span class="input-group-text"><span data-feather="calendar"></span></span>
                </div>
                <input type="date" class="form-control" name="toDate" id="toDate" value="<#if RequestParameters.toDate??>${RequestParameters.toDate}</#if>">
            </div>
        </div>
    </div>
    <button class="btn btn-primary btn-lg mt-4" type="submit">Search</button>
</form>
<form id="afm-form" action="/admin/repairs/search" class="<#if RequestParameters.afm??>display-block<#else>display-none</#if>">
    <div id="afm-div">
        <div class="row">
            <div class="col">
                <label for="afm">Afm</label>
            </div>
        </div>
        <div class="row>">
            <div class="input-group mb-0" >
                <div class="input-group-prepend">
                    <span class="input-group-text" id="basic-addon1">AFM</span>
                </div>
                <input type="text" class="form-control" name="afm" id="afm" placeholder="afm" aria-describedby="basic-addon1" value="<#if RequestParameters.afm??>${RequestParameters.afm}</#if>">
            </div>
        </div>
    </div>
    <button class="btn btn-primary btn-lg mt-4" type="submit">Search</button>
</form>
