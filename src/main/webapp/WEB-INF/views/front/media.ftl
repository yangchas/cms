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
            <li class="active">多媒体教学</li>
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
                <div class="right-media">
                    <div class="right-media-programe">
                        <div class="right-computer-function-title">
                            方案介绍
                        </div>
                    </div>
                    <div class="right-computer-programme-img">
                        <img src="${base}/static/front/default/images/service/jszmmy.jpg" width="550" height="304">
                    </div>
                    <div class="right-media-programme-content common-font">
                        课件存入云数据中心，上课时远程调用。<br/>
                        通过云终端漫游个人办公桌面，避免来回携带U盘。<br/>
                        云数据中心负责计算需求和数据存储，本地远程统一管理。<br/>
                    </div>
                    <div class="right-media-function">
                        <div class="right-computer-function-title">
                            方案价值
                        </div>
                    </div>
                    <div class="right-media-value">
                        <div class="right-media-value-content" style="border: none">
                            <div class="right-media-value-content-head">
                                <img src="${base}/static/front/default/images/service/fajz-ll.jpg" width="12"
                                     height="31"/>
                                <span class="common-font">成本更低</span>
                                <div style="clear: both"></div>
                            </div>
                            <div class="right-media-value-content-body">
                                <img src="${base}/static/front/default/images/service/cbgd.jpg" width="48" height="42"/>
                                <div class="common-font">云终端的成本一般只有PC的50%，而且功率只有传统PC的1/40，一次采购成本和使用成本以及升级维护成本都更低。</div>
                            </div>
                        </div>
                        <div class="right-media-value-content">
                            <div class="right-media-value-content-head">
                                <img src="${base}/static/front/default/images/service/fajz-ll.jpg" width="12"
                                     height="31"/>
                                <span class="common-font">资源利用率更高</span>
                                <div style="clear: both"></div>
                            </div>
                            <div class="right-media-value-content-body">
                                <img src="${base}/static/front/default/images/service/zylylgg.jpg" width="48"
                                     height="42"/>
                                <div class="common-font">传统PC在不用的时候，资源极大闲置，而云终端使用云中心的计算机资源，不用的时候关掉即可，不会造成资源浪费。</div>
                            </div>
                        </div>
                        <div class="right-media-value-content">
                            <div class="right-media-value-content-head">
                                <img src="${base}/static/front/default/images/service/fajz-ll.jpg" width="12"
                                     height="31"/>
                                <span class="common-font">管理维护更容易</span>
                                <div style="clear: both"></div>
                            </div>
                            <div class="right-media-value-content-body">
                                <img src="${base}/static/front/default/images/service/glwhgry.jpg" width="48"
                                     height="42"/>
                                <div class="common-font">
                                    传统PC需要单台维护，维护量很大，而云终端可以通过服务端的管理软件集中维护，同时也避免了使用环境不统一，系统瘫痪、病毒传播等风险。
                                </div>
                            </div>
                        </div>
                        <div class="right-media-value-content">
                            <div class="right-media-value-content-head">
                                <img src="${base}/static/front/default/images/service/fajz-ll.jpg" width="12"
                                     height="31"/>
                                <span class="common-font">使用更方便</span>
                                <div style="clear: both"></div>
                            </div>
                            <div class="right-media-value-content-body">
                                <img src="${base}/static/front/default/images/service/cbgd.jpg" width="48" height="42"/>
                                <div class="common-font">老师可将课件存入云数据中心，在上课的时候通过云终端直接调用即可，也可以通过云终端直接漫游自己办公电脑的桌面，避免了来回携带U
                                    盘的麻烦。
                                </div>
                            </div>
                        </div>
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