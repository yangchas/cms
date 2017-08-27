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
            <li class="active">运营综合服务</li>
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
                    <img src="${base}/static/front/default/images/service/yyzhpt.jpg" width="705" height="88">
                    <button class="right-content-ad-enter">
                        <a href="#">点击进入</a>
                    </button>
                </div>
                <div class="right-content">
                    <div class="right-problem">
                        <p class="right-problem-title common-font">
                            数据分析&nbsp;提前防范
                        </p>
                        <p class="right-problem-article common-font">
                            为用户（教育主管部门、公安机关、学校、老师、家长、学生）提供数据分析以及相关服务，为主管单位
                            作出管理决策及家长做出预防提供依据。
                        </p>
                    </div>
                    <div class="right-line">
                        <img src="${base}/static/front/default/images/service/line.jpg">
                    </div>
                    <div class="right-operation">
                        <table>
                            <tr>
                                <td class="right-operation-font1 common-font">★运营服务：</td>
                                <td class="right-equipment-font2">呼叫中心、服务流程、业务监控</td>
                            </tr>
                            <tr>
                                <td class="right-operation-font1 common-font">★信息发布：</td>
                                <td class="right-equipment-font2">大数据分析，多级、快速、准确</td>
                            </tr>
                            <tr>
                                <td class="right-operation-font1 common-font">★在线培训：</td>
                                <td class="right-equipment-font2">安全训练、安全活动、安全教育</td>
                            </tr>
                            <tr>
                                <td class="right-operation-font1 common-font">★应急调度：</td>
                                <td class="right-equipment-font2">快速响应、社会联动</td>
                            </tr>
                            <tr>
                                <td class="right-operation-font1 common-font">★更多服务：</td>
                                <td class="right-equipment-font2">学生接送、安全消费……</td>
                            </tr>
                        </table>
                    </div>
                    <div class="right-operation-img">
                        <img src="${base}/static/front/default/images/service/yyzhfw.jpg" width="580" height="429">
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