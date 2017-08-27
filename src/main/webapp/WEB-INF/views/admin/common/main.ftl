[#assign shiro = JspTaglibs["http://shiro.apache.org/tags"] /]
[#escape x as x?html]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>${setting.siteName} - 管理后台</title>
    <meta name="keywords" content="">
    <meta name="description" content="">

    <link rel="shortcut icon" href="favicon.ico">
    <link href="${base}/static/admin/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="${base}/static/admin/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">

    <link href="${base}/static/admin/css/animate.min.css" rel="stylesheet">
    <link href="${base}/static/admin/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html"/>
    <![endif]-->
    <script>if (window.top !== window.self) {
        window.top.location = window.location;
    }</script>
</head>
<body class="fixed-sidebar full-height-layout gray-bg" style="overflow:hidden">
<div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="nav-close"><i class="fa fa-times-circle"></i>
        </div>
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element">
                        <span><img alt="image" class="img-circle"
                                   src="${base}/static/admin/img/profile_small.jpg"/></span>
                        <a href="#">
                            <span class="clear">
                            <span class="block m-t-xs"><strong class="font-bold">Beaut-zihan</strong></span>
                            <span class="text-muted text-xs block">超级管理员</span>
                            </span>
                        </a>
                    </div>
                    <div class="logo-element">H+
                    </div>
                </li>
                [#list ["admin:setting", "admin:role", "admin:admin"] as permission]
                    [@shiro.hasPermission name = permission]
                        <li>
                            <a href="#">
                                <i class="fa fa-home"></i>
                                <span class="nav-label">系统管理</span>
                                <span class="fa arrow"></span>
                            </a>
                            <ul class="nav nav-second-level">
                                [@shiro.hasPermission name="admin:setting"]
                                    <li>
                                        <a class="J_menuItem" href="${base}/admin/setting.jhtml">系统设置</a>
                                    </li>
                                [/@shiro.hasPermission]
                                [@shiro.hasPermission name="admin:role"]
                                    <li>
                                        <a class="J_menuItem" href="${base}/admin/role.jhtml">角色管理</a>
                                    </li>
                                [/@shiro.hasPermission]
                                [@shiro.hasPermission name="admin:admin"]
                                    <li>
                                        <a class="J_menuItem" href="${base}/admin/admin.jhtml">管理员</a>
                                    </li>
                                [/@shiro.hasPermission]
                            </ul>
                        </li>
                        [#break /]
                    [/@shiro.hasPermission]
                [/#list]
                [#list ["admin:nav", "admin:article", "admin:articleClassify", "admin:friendLink", "admin:adPosition", "admin:ad", "admin:static"] as permission]
                    [@shiro.hasPermission name = permission]
                        <li>
                            <a href="#"><i class="fa fa-edit"></i> <span class="nav-label">内容管理</span><span
                                    class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                [@shiro.hasPermission name="admin:nav"]
                                    <li><a class="J_menuItem" href="${base}/admin/navigation.jhtml">导航管理</a>
                                    </li>
                                [/@shiro.hasPermission]
                                [@shiro.hasPermission name="admin:article"]
                                    <li><a class="J_menuItem" href="${base}/admin/article.jhtml">文章管理</a>
                                    </li>
                                [/@shiro.hasPermission]
                                [@shiro.hasPermission name="admin:articleClassify"]
                                    <li><a class="J_menuItem" href="${base}/admin/articleCategory.jhtml">文章分类</a>
                                    </li>
                                [/@shiro.hasPermission]
                                [@shiro.hasPermission name="admin:friendLink"]
                                    <li><a class="J_menuItem" href="${base}/admin/friendLink.jhtml">友情链接</a>
                                    </li>
                                [/@shiro.hasPermission]
                                [@shiro.hasPermission name="admin:adPosition"]
                                    <li><a class="J_menuItem" href="${base}/admin/adPosition.jhtml">广告位</a>
                                    </li>
                                [/@shiro.hasPermission]
                                [@shiro.hasPermission name="admin:ad"]
                                    <li><a class="J_menuItem" href="${base}/admin/ad.jhtml">广告管理</a>
                                    </li>
                                [/@shiro.hasPermission]
                                [@shiro.hasPermission name="admin:static"]
                                    <li><a class="J_menuItem" href="${base}/admin/static/generate.jhtml">静态化管理</a>
                                    </li>
                                [/@shiro.hasPermission]
                            </ul>
                        </li>
                        [#break /]
                    [/@shiro.hasPermission]
                [/#list]
                [#list ["admin:hotStatistic", "admin:SEOSetting"] as permission]
                    [@shiro.hasPermission name = permission]
                        <li>
                            <a href="#">
                                <i class="fa fa fa-bar-chart-o"></i>
                                <span class="nav-label">运营管理</span>
                                <span class="fa arrow"></span>
                            </a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a class="J_menuItem"
                                       href="http://new.cnzz.com/v1/login.php?siteid=1262783269">访问统计</a>
                                </li>
                                [@shiro.hasPermission name="admin:hotStatistic"]
                                    <li>
                                        <a class="J_menuItem" href="${base}/admin/article_ranking.jhtml">文章热度统计</a>
                                    </li>
                                [/@shiro.hasPermission]
                                [@shiro.hasPermission name="admin:SEOSetting"]
                                    <li>
                                        <a class="J_menuItem" href="${base}/admin/seo.jhtml">SEO设置</a>
                                    </li>
                                [/@shiro.hasPermission]
                                [@shiro.hasPermission name="admin:joinUs"]
                                <li>
                                    <a class="J_menuItem" href="${base}/admin/joinUs.jhtml">职位申请</a>
                                </li>
                                [/@shiro.hasPermission]
                                <li>
                                    <a class="J_menuItem" href="${base}/admin/suggest.jhtml">意见反馈</a>
                                </li>
                            </ul>
                        </li>
                        [#break /]
                [/@shiro.hasPermission]
            [/#list]
            </ul>
        </div>
    </nav>
    <!--左侧导航结束-->
    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header"><a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i
                        class="fa fa-bars"></i> </a>
                </div>
            </nav>
        </div>
        <div class="row content-tabs">
            <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
            </button>
            <nav class="page-tabs J_menuTabs">
                <div class="page-tabs-content">
                    <a href="javascript:;" class="active J_menuTab" data-id="index">首页</a>
                </div>
            </nav>
            <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
            </button>
            <div class="btn-group roll-nav roll-right">
                <button class="dropdown J_tabClose" data-toggle="dropdown">关闭操作<span class="caret"></span>

                </button>
                <ul role="menu" class="dropdown-menu dropdown-menu-right">
                    <li class="J_tabShowActive"><a>定位当前选项卡</a>
                    </li>
                    <li class="divider"></li>
                    <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                    </li>
                    <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                    </li>
                </ul>
            </div>
            <a href="${base}/admin/logout.jhtml" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i>
                退出</a>
        </div>
        <div class="row J_mainContent" id="content-main">
            <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="index.jhtml" frameborder="0"
                    data-id="index" seamless></iframe>
        </div>
        <div class="footer">
            <div class="pull-right">&copy; 2014-2017 <a href="${setting.siteUrl}"
                                                        target="_blank">${setting.siteName}</a>
            </div>
        </div>
    </div>
    <!--右侧部分结束-->
</div>
<script src="${base}/static/admin/js/jquery.min.js?v=2.1.4"></script>
<script src="${base}/static/admin/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${base}/static/admin/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${base}/static/admin/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<script src="${base}/static/admin/js/plugins/layer/layer.min.js"></script>
<script src="${base}/static/admin/js/hplus.min.js?v=4.1.0"></script>
<script type="text/javascript" src="${base}/static/admin/js/contabs.min.js"></script>
<script src="${base}/static/admin/js/plugins/pace/pace.min.js"></script>
</body>
</html>
[/#escape]