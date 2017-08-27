[#escape x as x?html]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>众云教育</title>
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
            <li class="active">中小学安全保障</li>
        </ol>
    </div>
</div>
<div class="list-page">
    <div class="list-content">
        <div class="row">
            <div class="col-sm-3">
                [#include "/front/include/left_nav.ftl" /]
            </div>
            <div class="col-sm-9">
                <div class="right-content-ad">
                    <img src="${base}/static/front/default/images/service/zxxab.jpg" width="705" height="88">
                    <div class="right-content-ad-enter">
                        <a href="#">点击进入</a>
                    </div>
                </div>
                <div class="right-content">
                    <div class="right-problem">
                        <p class="right-problem-title common-font">
                            警民联动&nbsp;及时预警
                        </p>
                        <p class="right-problem-article common-font">
                            中小学安保平台是通过学生安全基础数据采集、预处理，多维度数据关联，数据挖掘与分析，数据比对分
                            析应用，为公安机关围绕校园安全、学生安全提供一系列的数据分析、预警、检索的大数据分析平台，从
                            而为公安机关围绕校园环境安全、学生人身安全、教育社会安全提供数据和决策依据。
                        </p>
                    </div>
                    <div class="right-line">
                        <img src="${base}/static/front/default/images/service/line.jpg">
                    </div>
                    <div class="right-student">
                        <img src="${base}/static/front/default/images/service/zxxaqbz.jpg" width="580" height="375">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
    [#include "/front/include/footer2.ftl" /]
</body>
</html>
[/#escape]