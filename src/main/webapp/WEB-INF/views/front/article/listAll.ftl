[#escape x as x?html]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    [@seo type = "articleList"]
        <title>[#if seo.title??][@seo.title?interpret /][/#if]</title>
        <meta name="author" content="rongtai"/>
        <meta name="copyright" content="rongtai"/>
        [#if seo.keywords??]
            <meta name="keywords" content="[@seo.keywords?interpret /]"/>
        [/#if]
        [#if seo.description??]
            <meta name="description" content="[@seo.description?interpret /]"/>
        [/#if]
    [/@seo]
    <link rel="stylesheet" type="text/css" href="${base}/static/front/default/css/animate.min.css">
    <link rel="stylesheet" type="text/css" href="${base}/static/front/default/plugins/bootstrap3/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${base}/static/front/default/css/style2.css">
    <script type="text/javascript" src="${base}/static/front/default/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="${base}/static/front/default/plugins/bootstrap3/js/bootstrap.js"></script>
</head>
<body>
    [#include "/front/include/header2.ftl" /]
<div class="breadnav">
    <div class="breadnav-content">
        <ol class="breadcrumb breadnav-set">
            <li><a href="${setting.siteUrl}">返回首页</a></li>
            <li class="active">文章列表</li>
        </ol>
    </div>
</div>
<div class="articleList-content">
    <div class="mostnew">
        <div class="row">
            <div class="col-sm-3">
                <ul class="mostnew-list">
                    [#list articleCategorys as articleCategory]
                        <li class="mostnew-list-content">
                            <a href="${base}/article/list/${articleCategory.id}.jhtml">${articleCategory.name}</a>
                        </li>
                    [/#list]
                </ul>
            </div>
            <div class="col-sm-9">
                <div class="articleList-content-title">
                ${articleCategory.name}
                </div>
                <div class="articleList-content-display">
                    [#list page.content as article]
                        <div class="articleList-module">
                            <div class="articleList-module-title">
                                <a class="articleList-module-title-font"
                                   href="${base}/article/content/${article.id}.html"
                                   title="${article.title}">${abbreviate(article.title, 50, "...")}</a>
                                <span class="articleList-module-title-time">发布时间：${article.createDate}</span>
                            </div>
                            <div class="articleList-module-display">
                            ${abbreviate(article.text, 220, "...")}
                            </div>
                        </div>
                    [/#list]
                    [@pagination pageNumber = page.getNumber() + 1 totalPages = page.getTotalPages()]
                        [#include "/front/include/pagination.ftl"]
                    [/@pagination]
                </div>
            </div>
        </div>
    </div>

</div>
    [#include "/front/include/footer2.ftl" /]
</body>
</html>
[/#escape]