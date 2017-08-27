[#escape x as x?html]
<!-- 头部 -->
<div class="head section">
    <!-- 轮播图 -->
    <!-- Swiper -->
    [@ad_position id = 2 /]
    <!-- LOGO -->
    <div class="head-logo">
            <img src="${base}/static/front/default/images/index-logo.png" width="127" height="60">
        </div>
    <!-- 导航栏 -->
    <div class="main-nav"></div>
    <div class="container nav-content">
        <div class="row">
        [#--<div class="col-sm-2"></div>--]
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
            </div>
        </div>
    </div>
</div>
[/#escape]