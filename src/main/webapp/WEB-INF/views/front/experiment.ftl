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
            <li class="active">实验实训</li>
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
                <div class="right-experiment">
                    <div class="right-computer-programme">
                        <div class="right-computer-function-title">
                            方案介绍
                        </div>
                    </div>
                    <div class="right-experiment-programme">
                        <div class="right-experiment-programme-title">
                            <div class="experiment-training">
                                <div class="cloud-circle-bot">
                                </div>
                                <div class="cloud-circle-mid">
                                </div>
                                <div class="cloud-circle-top">
                                </div>
                            </div>
                            <span class="experiment-programme-font common-font">当前教育信息化发展遇到的问题</span>
                        </div>
                        <div class="right-experiment-programme-content">
                            <div class="experiment-programme-content-left">
                                <p style="font-size: 14px;color: #016858;padding-left: 20px;margin-top: 15px"
                                   class="common-font">
                                    <span style="font-size: 23px; font-weight: 100" class="common-font">1. </span>
                                    机房实验室设备管理
                                </p>
                                <ul style="list-style: none">
                                    <li style="font-size: 13px;line-height: 21px" class="common-font">
                                        机房管理老师的日常维护工作量很大。
                                    </li>
                                    <li style="font-size: 13px;line-height: 21px" class="common-font">
                                        计算机实验室的机器品牌复杂、管理困难。
                                    </li>
                                    <li style="font-size: 13px;line-height: 21px" class="common-font">
                                        不易杀查病毒，系统、软件升级困难。
                                    </li>
                                </ul>
                            </div>
                            <div class="experiment-programme-content-right">
                                <p style="font-size: 14px;color: #016858;padding-left: 20px;margin-top: 15px"
                                   class="common-font">
                                    <span style="font-size: 23px; font-weight: 100" class="common-font">2. </span>
                                    机房实验室设备管理
                                </p>
                                <ul style="list-style: none;padding-left: 30px">
                                    <li style="font-size: 13px;line-height: 21px" class="common-font">软件增加和更新耗时费力不方便。
                                    </li>
                                    <li style="font-size: 13px;line-height: 21px" class="common-font">
                                        计算机硬件损坏更新后，很多机器还原卡不兼容。
                                    </li>
                                    <li style="font-size: 13px;line-height: 21px" class="common-font">无法提供个性化服务与管理。</li>
                                    <li style="font-size: 13px;line-height: 21px" class="common-font">无法快速便捷提供多种考试环境。
                                    </li>
                                    <li style="font-size: 13px;line-height: 21px" class="common-font">系统更新出错无法恢复。</li>
                            </div>
                            <div style="clear: both"></div>
                        </div>
                    </div>
                    <div class="right-experiment-classroom">
                        <div class="right-experiment-programme-title">
                            <div class="experiment-training">
                                <div class="cloud-circle-bot">
                                </div>
                                <div class="cloud-circle-mid">
                                </div>
                                <div class="cloud-circle-top">
                                </div>
                            </div>
                            <span class="experiment-programme-font common-font">什么是乾云云教室/云实训室？</span>
                        </div>
                        <div class="right-experiment-classroom-introduce common-font">
                            乾云云教室/云实训室包括教师管理机、乾云分布式云主机、云终端和软件，其中软件分为云教室软件和云实训室软件。
                        </div>
                        <div class="right-experiment-classroom-img">
                            <img src="${base}/static/front/default/images/service/cloud-process.jpg">
                        </div>
                    </div>
                    <div class="right-experiment-teach">
                        <div class="right-experiment-programme-title">
                            <div class="experiment-training">
                                <div class="cloud-circle-bot">
                                </div>
                                <div class="cloud-circle-mid">
                                </div>
                                <div class="cloud-circle-top">
                                </div>
                            </div>
                            <span class="experiment-programme-font common-font">什么是乾云云教室/云实训室？</span>
                        </div>
                        <div class="right-experiment-teach-content">
                            <div class="experiment-teach-module" style="margin-right: 15px">
                                <div class="experiment-teach-module-img">
                                    <img src="${base}/static/front/default/images/service/desktop-cloud.jpg" width="150"
                                         height="150">
                                </div>
                                <div class="experiment-teach-module-introduce">
                                    <p class="common-font">桌面云主机</p>
                                    <p class="common-font"> 集群化部署及管理</p>
                                </div>
                            </div>
                            <div class="experiment-teach-module" style="margin-right: 15px">
                                <div class="experiment-teach-module-img">
                                    <img src="${base}/static/front/default/images/service/every-virtual-machine.jpg"
                                         width="150" height="150">
                                </div>
                                <div class="experiment-teach-module-introduce">
                                    <p class="common-font">每个虚拟机独享</p>
                                    <p class="common-font">显卡及存储空间</p>
                                </div>
                            </div>
                            <div class="experiment-teach-module" style="margin-right: 15px">
                                <div class="experiment-teach-module-img">
                                    <img src="${base}/static/front/default/images/service/support-local-network.jpg"
                                         width="150" height="150">
                                </div>
                                <div class="experiment-teach-module-introduce">
                                    <p class="common-font">支持本地网络</p>
                                    <p class="common-font">双系统启动</p>
                                </div>
                            </div>
                            <div class="experiment-teach-module">
                                <div class="experiment-teach-module-img">
                                    <img src="${base}/static/front/default/images/service/curriculum-switching.jpg"
                                         width="150" height="150">
                                </div>
                                <div class="experiment-teach-module-introduce">
                                    <p class="common-font">支持课程切换,</p>
                                    <p class="common-font">具备教学管理功能</p>
                                </div>
                            </div>
                            <div style="clear: both"></div>
                        </div>
                    </div>
                    <div class="right-computer-programme">
                        <div class="right-computer-function-title common-font">
                            方案特点
                        </div>
                    </div>
                    <div class="ringht-experiment-efficiency">
                        <div class="ringht-experiment-efficiency-title common-font">
                            部署效率提升数十倍
                        </div>
                        <div class="ringht-experiment-efficiency-content">
                            <p class="common-font">软硬一体设计，降低虚拟化部署管理难度，提升界面管理体验。</p>
                            <p class="common-font">快速部署，批量创建，实时生效，轻松两步完成云实训室环境搭建。</p>
                        </div>
                        <div class="ringht-experiment-efficiency-img">
                            <img src="${base}/static/front/default/images/service/cloud-change.jpg">
                        </div>
                    </div>
                    <div class="right-experiment-manage">
                        <div class="ringht-experiment-efficiency-title common-font">
                            部署效率提升数十倍
                        </div>
                        <div class="ringht-experiment-efficiency-content">
                            <p class="common-font">采用集中管理方式，将课程内容更新、软件环境升级、机房日常维护等时间缩短了90%。</p>
                        </div>
                    </div>
                    <div class="right-experiment-environmental">
                        <div class="ringht-experiment-efficiency-title common-font">
                            节能环保&nbsp;省钱才是王道
                        </div>
                        <div class="ringht-experiment-efficiency-content">
                            <p class="common-font">云终端体积轻巧、电源<=20W，静音、辐射小。以每天运行10小时为例，60座教室每年可节约1.5万元电费。</p>
                        </div>
                        <div class="ringht-experiment-efficiency-img">
                            <img src="${base}/static/front/default/images/service/jd-hb.jpg">
                        </div>
                    </div>
                    <div class="right-experiment-bound">
                        <div class="ringht-experiment-efficiency-title common-font">
                            真正的云化&nbsp;让教师摆脱教师机的束缚
                        </div>
                        <div class="ringht-experiment-efficiency-content">
                            <p class="common-font">个人网盘为用户提供了对个人文件的存储和管理服务，任何格式的文件都可以上传到个人网盘，并且可以通过网盘将有价值的教学资源发布到素</p>
                        </div>
                        <div class="right-experiment-environmental-img">
                            <div class="experiment-teach-module" style="margin-right: 15px">
                                <div class="experiment-teach-module-img">
                                    <img src="${base}/static/front/default/images/service/td-outdoor.jpg" width="150"
                                         height="150">
                                </div>
                                <div class="experiment-environmental-introduce common-font">
                                    室外
                                </div>
                            </div>
                            <div class="experiment-teach-module" style="margin-right: 15px">
                                <div class="experiment-teach-module-img">
                                    <img src="${base}/static/front/default/images/service/td-travel.jpg" width="150"
                                         height="150">
                                </div>
                                <div class="experiment-environmental-introduce common-font">
                                    旅行
                                </div>
                            </div>
                            <div class="experiment-teach-module" style="margin-right: 15px">
                                <div class="experiment-teach-module-img">
                                    <img src="${base}/static/front/default/images/service/td-home.jpg" width="150"
                                         height="150">
                                </div>
                                <div class="experiment-environmental-introduce common-font">
                                    家中
                                </div>
                            </div>
                            <div class="experiment-teach-module">
                                <div class="experiment-teach-module-img">
                                    <img src="${base}/static/front/default/images/service/td-office.jpg" width="150"
                                         height="150">
                                </div>
                                <div class="experiment-environmental-introduce common-font">
                                    办公室
                                </div>
                            </div>
                            <div style="clear: both"></div>
                        </div>
                    </div>
                    <div class="right-experiment-exam">
                        <div class="ringht-experiment-efficiency-title common-font">
                            轻松搞定考试场景
                        </div>
                        <div class="ringht-experiment-efficiency-content common-font">
                            <p>能够同时安装部署多种模板，学校针对实际情况可以在模板中快速切换。不同考试环境可以灵活、简单、即时创建部署和切换，90秒上课、2分钟完成切换，只需动一动鼠标。</p>
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