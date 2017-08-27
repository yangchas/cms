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
            <li class="active">机房建设</li>
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
                <div class="right-computer">
                    <div class="right-computer-programme">
                        <div class="right-computer-programme-title">
                            方案介绍
                        </div>
                    </div>
                    <div class="right-computer-programme-img">
                        <img src="${base}/static/front/default/images/service/fasyt.jpg" width="550" height="304">
                    </div>
                    <div class="right-computer-programme-content common-font">
                        在学校数据中心的建设过程中，随着各种业务系统的建设和更新换代，每个业务系统都占用了大量的新旧服务
                        器，其硬件利用率低下、管理复杂、运行成本居高不下等问题正逐渐显现，虚拟化技术的出现，使得操作系统
                        不再直接安装在硬件上，业务服务器成为逻辑服务器概念，形成了逻辑层和物理层分离的横向结构，不仅可以
                        方便地复用硬件资源，管理效率也大大提高。
                    </div>
                    <div class="right-computer-function">
                        <div class="right-computer-function-title">
                            方案功能
                        </div>
                    </div>
                    <div class="right-computer-function-img">
                        <img src="${base}/static/front/default/images/service/jf-jz.jpg">
                    </div>
                    <div class="right-computer-function">
                        <div class="right-computer-function-title">
                            方案价值
                        </div>
                    </div>
                    <div class="right-computer-tb">
                        <img src="${base}/static/front/default/images/service/jf-tb.jpg">
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