<#assign page = springMacroRequestContext.requestUri>
<div class="container-fluid container-fluid-sidebar">
    <div class="row">
        <nav class="col-md-2 d-none d-md-block bg-dark sidebar">
            <div class="sidebar-sticky">
                <ul class="nav flex-column">
                    <li class="nav-item btn-outline-info ">

                        <a class="nav-link text-white <#if page == '/admin' || page == '/admin/home'>bg-info active</#if> " href="/admin">
                            <span data-feather="home"></span>
                            Home
                        </a>
                    </li>

                    <li class="nav-item btn-outline-primary  <#if page == '/admin/owners'>bg-primary active</#if>">
                        <a class="nav-link text-white" href="/admin/owners">
                            <span data-feather="users"></span>
                            Owners
                        </a>
                    </li>

                    <li class="nav-item btn-outline-primary  <#if page == '/admin/repairs'>bg-primary active</#if>">
                        <a class="nav-link text-white" href="/admin/repairs">
                            <span data-feather="truck"></span>
                            Repairs
                        </a>
                    </li>

                    <li class="nav-item btn-outline-primary  <#if page == '/admin/properties'>bg-primary active</#if>">
                        <a class="nav-link text-white" href="/admin/properties">
                            <span data-feather="home"></span>
                            Properties
                        </a>
                    </li>

                    <li class="nav-item btn-outline-success  <#if page == '/admin/owners/search'>bg-success active</#if>">
                        <a class="nav-link text-white" href="/admin/owners/search">
                            <span data-feather="search"></span>
                            Search Owners
                        </a>
                    </li>

                    <li class="nav-item btn-outline-success  <#if page == '/admin/repairs/search'>bg-success active</#if>">
                        <a class="nav-link text-white" href="/admin/repairs/search">
                            <span data-feather="search"></span>
                            Search Repairs
                        </a>
                    </li>

                    <li class="nav-item btn-outline-success  <#if page == '/admin/properties/search'>bg-success active</#if>">
                        <a class="nav-link text-white" href="/admin/properties/search">
                            <span data-feather="search"></span>
                            Search Property
                        </a>
                    </li>

                    <li class="nav-item btn-outline-warning  <#if page == '/admin/owners/create'>bg-warning active</#if>">
                        <a class="nav-link text-white" href="/admin/owners/create">
                            <span data-feather="plus-circle"></span>
                            Create Owner
                        </a>
                    </li>

                    <li class="nav-item btn-outline-warning <#if page == '/admin/repairs/create'> bg-warning active</#if>" >
                        <a class="nav-link text-white" href="/admin/repairs/create">
                            <span data-feather="plus-circle"></span>
                            Create Repair
                        </a>
                    </li>

                    <li class="nav-item btn-outline-warning <#if page == '/admin/properties/create'> bg-warning active</#if>" >
                        <a class="nav-link text-white" href="/admin/properties/create">
                            <span data-feather="plus-circle"></span>
                            Create Property
                        </a>
                    </li>

                </ul>
                <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                    <span>Admin</span>
                </h6>
                <ul class="nav flex-column mb-2">
                    <li class="nav-item btn-outline-danger">
                        <a class="nav-link text-white" href="/logout">
                            <span data-feather="log-out"></span>
                            Logout
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
            <div class="row">
                <div class="col-md-12 order-md-1">