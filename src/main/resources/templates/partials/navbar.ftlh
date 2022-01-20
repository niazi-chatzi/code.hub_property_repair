<#assign page = springMacroRequestContext.requestUri>
<nav class="navbar navbar-expand-lg navbar-dark sticky-top bg-dark p-0">
    <a href="/<#if page?starts_with("/home")>home<#else>admin</#if>" style="background-color:#343a40">
        <img class="site-logo" src="/images/favicon.gif" width="200" height="100" style="filter:invert(0.02)">
    </a>

    <button class="navbar-toggler mr-2" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <#if page?starts_with("/home")>
            <ul class="navbar-nav mr-auto px-3">
                <li class="nav-item text-nowrap">
                    <a href="/home" class="nav-link">Home</a>
                </li>
            </ul>
        </#if>
        <ul class="nav-bar mr-auto"></ul>
        <a href="/logout">
            <button type="submit"  style="font-size: 1.05em;" class="btn-nav btn btn-dark btn-lg">
                <span data-feather="log-out"></span> Logout
            </button>
        </a>
    </div>
</nav>