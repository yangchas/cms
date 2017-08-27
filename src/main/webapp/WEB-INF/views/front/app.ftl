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
            <li class="active">APP客户端</li>
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
                    <img src="${base}/static/front/default/images/service/app.jpg" width="705" height="88">
                    <div class="right-content-ad-enter">
                        <a href="#">点击进入</a>
                    </div>
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
                    <div class="right-schooldoor">
                        <p class="right-schooldoor-title common-font">
                            安全考勤
                        </p>
                        <p class="right-problem-article common-font">
                            家长和老师可以即时得到学生的到校、离校情况，并及时通知家长。
                        </p>
                    </div>
                    <div class="right-schooldoor">
                        <p class="right-schooldoor-title common-font">
                            安全监控
                        </p>
                        <p class="right-problem-article common-font">
                            家长和老师可以即时得到学生的到校、离校情况，并及时通知家长。
                        </p>
                    </div>
                    <div class="right-schooldoor">
                        <p class="right-schooldoor-title common-font">
                            警情预报
                        </p>
                        <p class="right-problem-article common-font">
                            发现学校周边的可疑情况和隐患，及时通知公安民警到现场排查险情，防患于未然。也可实时接收警方发
                            送的警情通报，让学校和家长都能提前预知，提前注意防范可能的危险。
                        </p>
                    </div>
                    <div class="right-main">
                        <p class="right-schooldoor-title common-font">
                            校外安全
                        </p>
                        <p class="right-problem-article common-font">
                            通过可穿戴物品，结合GPS、北斗、LBS、WIFI等定位技术，实时掌控学生在校外的动态轨迹，有效提高学
                            生的人身安全。
                        </p>
                    </div>
                    <div class="right-main">
                        <p class="right-schooldoor-title common-font">
                            孩子安全不放松
                        </p>
                        <p class="right-problem-article common-font">
                            通过学生携带的校园卡，记录孩子上学放学情况，同时还可查看视频，让家长掌握孩子动向。豌豆苗一键
                            告警，可以将任何可疑信息一键推送到公安机关，排除学校周边安全隐患。
                        </p>
                    </div>
                    <div class="right-main">
                        <p class="right-schooldoor-title common-font">
                            任何消息不遗漏
                        </p>
                        <p class="right-problem-article common-font">
                            学校下发通知、家长请假、系统功能还是好友消息，通过置顶的形式自动推送，确保任何消息都不会遗漏。
                        </p>
                    </div>
                    <div class="right-main">
                        <p class="right-schooldoor-title common-font">
                            使用便捷知我心
                        </p>
                        <p class="right-problem-article common-font">
                            课程表、历史信息保留，自动导入、常用事务备份功能，家长使用更加便捷贴心。
                        </p>
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