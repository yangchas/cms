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
            <li class="active">便捷办公</li>
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
                <div class="right-multioffice">
                    <div class="right-office">
                        <div class="right-computer-function-title common-font">
                            方案场景
                        </div>
                        <div class="right-office-scene">
                            <div class="right-office-scene-img">
                                <img src="${base}/static/front/default/images/service/office-qbbg.jpg" alt=""/>
                                <div class="right-office-scene-title common-font">
                                    轻便节能办公
                                </div>
                            </div>
                            <div class="right-office-scene-img">
                                <img src="${base}/static/front/default/images/service/office-ydsw.jpg" alt=""/>
                                <div class="right-office-scene-title common-font">
                                    便携移动商务
                                </div>
                            </div>
                            <div class="right-office-scene-img">
                                <img src="${base}/static/front/default/images/service/office-4k.jpg" alt=""/>
                                <div class="right-office-scene-title common-font">
                                    3D专业设计
                                </div>
                            </div>
                            <div class="right-office-scene-img">
                                <img src="${base}/static/front/default/images/service/office-3d.jpg" alt=""/>
                                <div class="right-office-scene-title common-font">
                                    4K高清体验
                                </div>
                            </div>
                            <div style="clear: both"></div>
                        </div>
                        <div class="right-office-scene-content">
                            <div class="right-office-scene-content-head">
                                <img src="${base}/static/front/default/images/service/office-left.jpg"
                                     class="right-office-scene-content-left"/>
                                <img src="${base}/static/front/default/images/service/office-right.jpg"
                                     class="right-office-scene-content-right"/>
                                <span class="common-font">远程统一管理</span>
                            </div>
                            <div class="right-office-scene-content-body common-font">
                                能够极大的降低用户的维护成本、减少故障率、支持多镜像的批量统一管理、支持镜像切
                                换、镜像还原、快照备份和恢复、增量同传、网络访问权限控制、虚拟机IP/主机名/用户名批量配置等多项功能。
                            </div>
                        </div>
                        <div class="right-office-scene-content">
                            <div class="right-office-scene-content-head">
                                <img src="${base}/static/front/default/images/service/office-left.jpg"
                                     class="right-office-scene-content-left"/>
                                <img src="${base}/static/front/default/images/service/office-right.jpg"
                                     class="right-office-scene-content-right"/>
                                <span style="letter-spacing: normal" class="common-font">USB控制器透传</span>
                            </div>
                            <div class="right-office-scene-content-body common-font"> 全面支持各种USB设备，USB传输速度与物理机一致，无响应延迟。
                            </div>
                        </div>
                        <div class="right-office-scene-content">
                            <div class="right-office-scene-content-head">
                                <img src="${base}/static/front/default/images/service/office-left.jpg"
                                     class="right-office-scene-content-left"/>
                                <img src="${base}/static/front/default/images/service/office-right.jpg"
                                     class="right-office-scene-content-right"/>
                                <span class="common-font">物理显卡透传</span>
                            </div>
                            <div class="right-office-scene-content-body common-font">
                                全面支持包括3D游戏和3D设计在内的各种软件，充分发挥显卡硬件加速能力，实现高性能零延迟的用户体验。
                            </div>
                        </div>
                        <div class="right-office-value">
                            <div class="right-computer-function-title">
                                方案价值
                            </div>
                        </div>
                        <div class="right-office-value-content">
                            <div class="right-office-value-left">
                                <div class="right-office-value-left-head">
                                    <div></div>
                                    <p class="common-font">集中管理&nbsp&nbsp高效运维</p>
                                    <div style="clear: both"></div>
                                </div>
                                <div class="right-office-value-left-body common-font">
                                    将用户的办公桌面和数据全部集中到数据中心，提供集中式、单一化的运维模式，实现对桌面的可视化集中安装和部
                                    署，用户终端的系统实现了批量安排、批量升级，极大的降低了安装和部署的复杂度。同时，云交付平台提供的资源
                                    监控功能，能够帮助管理人员及时准确的定位故障，Web式的管理界面能够满足随时随地的访问，使管理工作更加高效。
                                </div>
                            </div>
                            <img class="right-office-value-right"
                                 src="${base}/static/front/default/images/service/office5.jpg" width="336"
                                 height="292"/>
                            <div style="clear: both"></div>
                        </div>
                        <div class="right-office-value-content">
                            <div class="right-office-value-left">
                                <div class="right-office-value-left-head">
                                    <div></div>
                                    <p class="common-font">极致用户体验</p>
                                    <div style="clear: both"></div>
                                </div>
                                <div class="right-office-value-left-body common-font">
                                    采用显卡透传技术，个人桌面拥有独享显卡，完美支持大型3D网游、4K/1080P高清视频以及office办公应
                                    用，同时个人用户桌面支持移动办公，无论何时何地只要有网络即可连接个人办公桌面。
                                </div>
                            </div>
                            <img class="right-office-value-right"
                                 src="${base}/static/front/default/images/service/office6.jpg" width="366"
                                 height="207"/>
                            <div style="clear: both"></div>
                        </div>
                        <div class="right-office-value-content">
                            <div class="right-office-value-left">
                                <div class="right-office-value-left-head">
                                    <div></div>
                                    <p class="common-font">优化办公环境</p>
                                    <div style="clear: both"></div>
                                </div>
                                <div class="right-office-value-left-body common-font">
                                    云终端体积小，外形时尚，能耗低，通常只有10W，噪音只有10分贝，且散热更少，绿色环保。
                                    通过使用云终端来替代传统PC机，节省办公空间，绿色环保，令办公环境更加整洁优雅。
                                </div>
                            </div>
                            <img class="right-office-value-right"
                                 src="${base}/static/front/default/images/service/office7.jpg" width="347"
                                 height="198"/>
                            <div style="clear: both"></div>
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