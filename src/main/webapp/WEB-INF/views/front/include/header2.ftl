[#escape x as x?html]
<!-- 头部 -->
<div class="top">
    <div class="head-logo">
        <img src="${base}/static/front/default/images/index-logo.png" width="127" height="60">
    </div>
    <div class="main-nav"></div>
    <div class="container nav-content">
        <div class="row">
        [#--<div class="col-sm-1"></div>--]
            <div class="col-sm-12">
                <ul>
                    [@navigation_list position = "top"]
                        [#list navigations as navigation]
                            <li>
                                <a class="nav-content-fot" href="${navigation.url}" [#if navigation.isBlankTarget]
                                   target="_blank"[/#if]>${navigation.name}
                                </a>
                            </li>
                        [/#list]
                    [/@navigation_list]
                </ul>
            [#--<ul class="nav-content-ul">--]
            [#--<li class="nav-content-ul-li"><a href="#">首页</a></li>--]
            [#--<li class="nav-content-ul-li"><a href="#">关于众云</a></li>--]
            [#--<li class="nav-content-ul-li"><a href="#">众云动态</a></li>--]
            [#--<li class="nav-content-ul-li"><a href="#">加入众云</a></li>--]
            [#--<li class="nav-content-ul-li"><a href="#">联系我们</a></li>--]
            [#--</ul>--]
            </div>
        [#--<div class="col-sm-1"></div>--]
        </div>
    [#--<ul>--]
    [#--[@navigation_list position = "top"]--]
    [#--[#list navigations as navigation]--]
    [#--<li>--]
    [#--<a class="nav-content-fot" href="${navigation.url}" [#if navigation.isBlankTarget]--]
    [#--target="_blank"[/#if]>${navigation.name}</a>--]
    [#--</li>--]
    [#--[/#list]--]
    [#--[/@navigation_list]--]
    [#--</ul>--]
    </div>
[#--<div class="nav">--]
[#--</div>--]
[#--<div class="nav-content">--]
[#--<ul>--]
[#--[@navigation_list position = "top"]--]
[#--[#list navigations as navigation]--]
[#--<li>--]
[#--<a class="nav-content-fot" href="${navigation.url}" [#if navigation.isBlankTarget]--]
[#--target="_blank"[/#if]>${navigation.name}</a>--]
[#--</li>--]
[#--[/#list]--]
[#--[/@navigation_list]--]
[#--</ul>--]
[#--</div>--]
</div>
[/#escape]