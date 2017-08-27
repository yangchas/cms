[#escape x as x?html]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    [@seo type = "articleContent"]
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
    <link rel="stylesheet" type="text/css" href="${base}/static/front/default/css/style.css">
    <script type="text/javascript" src="${base}/static/front/default/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="${base}/static/front/default/plugins/bootstrap3/js/bootstrap.js"></script>
</head>
<body>
    [#include "/front/include/header2.ftl" /]
<div class="breadnav">
    <div class="breadnav-content">
        <ol class="breadcrumb breadnav-set">
            <li><a href="${setting.siteUrl}">返回首页</a></li>
            <li class="active"><a href="${base}/article/list/${article.articleCategory.id}.jhtml">${article.articleCategory.name}</a></li>
        </ol>
    </div>
</div>
<div class="detail-content">
    <div class="detail-content-display">
        <div class="detail-content-title">
            <div class="detail-content-topic">
            ${article.title}
            </div>
            <div class="detail-topic-sign">
                <span class="glyphicon glyphicon-time detail-sigh-font1"></span>
                <span class="detail-sigh-font2">发布时间：${article.createDate}</span>
                <span class="glyphicon glyphicon-share-alt  detail-sigh-font1"></span>
                <span class="detail-sigh-font2">来源：${article.author}</span>
                <span class="glyphicon glyphicon-hand-up  detail-sigh-font1"></span>
                <span class="detail-sigh-font2" id="hits"></span>
            </div>
        </div>
        <div class="detail-content-article">
            [#noescape]
                ${article.content}
                <div class="detail-content-article-switch">
                    [#if pre??]
                        <a href="${base}/article/content/${pre.id}.html" class="btn join-button btn-xd active"
                           role="button">上一篇</a>
                    [#else]
                        <a href="#" class="btn join-button btn-xd disabled" role="button">没有上一篇了</a>
                    [/#if]
                    [#if next??]
                        <a href="${base}/article/content/${next.id}.html" class="btn join-button btn-xd active"
                           role="button">下一篇</a>
                    [#else]
                        <a href="#" class="btn join-button btn-xd disabled" role="button">没有下一篇了</a>
                    [/#if]
                </div>
            [/#noescape]
        </div>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        var $hits = $("#hits");
        // 查看点击数
        $.ajax({
            url: "${base}/article/hits/${article.id}.jhtml",
            type: "GET",
            cache: true,
            success: function (data) {
                $hits.text("点击量：" + data);
            }
        });
    });
</script>
    [#include "/front/include/footer2.ftl" /]
</body>
</html>
[/#escape]