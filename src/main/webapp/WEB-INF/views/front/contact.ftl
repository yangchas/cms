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
    <link rel="stylesheet" type="text/css"
          href="${base}/static/front/default/plugins/webuploader-0.1.5/webuploader.css">
    <script type="text/javascript" src="${base}/static/front/default/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="${base}/static/front/default/plugins/bootstrap3/js/bootstrap.js"></script>
    <script type="text/javascript"
            src="${base}/static/front/default/plugins/webuploader-0.1.5/webuploader.min.js"></script>
</head>
<body>
    [#include "/front/include/header2.ftl" /]
<div class="breadnav">
    <div class="breadnav-content">
        <ol class="breadcrumb breadnav-set">
            <li><a href="${setting.siteUrl}">返回首页</a></li>
            <li class="active">联系我们</li>
        </ol>
    </div>
</div>
<div class="article-content">
    <div class="article-content-main">
        <div class="article-content-phone">
            <div class="article-phone-title">服务电话:</div>
            <div class="article-phone-number">400-6852-680</div>
        </div>
        <div class="article-company">
            <p style="color: #000000;font-weight: bold;font-size: 20px" class="common-font">山东众云教育科技有限公司</p>

            <p style="font-size: 15px" class="common-font">地址：济南市高新区银荷大厦C座10层</p>

            <p style="font-size: 15px" class="common-font">电话：0531-88818523</p>
        </div>
        <div class="article-content-focus">
            <div class="article-focus-main">
                <div class="row" style="margin-top: 20px">
                    <div class="col-sm-6">
                        <div>
                            <img src="${base}/static/front/default/images/zxx.png" width="135" height="135">
                        </div>
                        <div class="foot-erweima-title2">
                            中小学生安全服务在线
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div>
                            <img src="${base}/static/front/default/images/zyjy.png" width="135" height="135">
                        </div>
                        <div class="foot-erweima-title2">
                            众云教育
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="jion-aplay">
            <button type="button" class="btn btn-xd join-button" data-toggle="modal" data-target="#myModal">
                意见反馈
            </button>
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <form method="post" action="${base}/suggest/save.jhtml">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">请填写您的宝贵意见</h4>
                            </div>
                            <div class="modal-body">
                                <div class="aplay-basic-information">
                                    <table class="aplay-information-table1">
                                        <tr class="aplay-information-tr1">
                                            <td class="aplay-information-td2">建议概要：</td>
                                            <td class="aplay-information-uadate">
                                                <input class="aplay-information-suggest" id="title" name="title"
                                                       type="text" value=""/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="aplay-information-td2">建议详述：</td>
                                            <td class="aplay-information-uadate">
                                                <textarea class="aplay-information-remark" rows="" cols=""
                                                          name="content"
                                                          style="margin-top: 10px"></textarea>
                                            </td>
                                        </tr>
                                        <tr class="aplay-information-tr1">
                                            <td class="aplay-information-td2">建议类型：</td>
                                            <td class="aplay-information-uadate">
                                                [#list types as type]
                                                    <input name="type" type="radio" value="${type.name()}"/>${type}
                                                [/#list]
                                            </td>
                                        </tr>
                                        <tr class="aplay-information-tr1">
                                            <td class="aplay-information-td2">联系方式：</td>
                                            <td class="aplay-information-uadate">
                                                <input class="aplay-information-suggest" id="contact" name="contact"
                                                       type="text" value=""/>
                                            </td>
                                        </tr>
                                        <tr class="aplay-information-tr1">
                                            <td class="aplay-information-td1">照片上传：</td>
                                            <td class="aplay-information-uadate">
                                                <div style="display: inline">
                                                    <input id="picture" name="picture" type="hidden">

                                                    <div id="fileList" class="uploader-list"
                                                         style="display: inline"></div>
                                                    <div id="filePicker">选择文件
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">关闭</button>
                                <button type="submit" class="btn btn-primary btn-sm">提交意见</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="article-content-map">
            <div style="width:850px;height:300px;border:#ccc solid 1px;" id="allmap"></div>
        </div>
    </div>
</div>
    [#include "/front/include/footer2.ftl" /]
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=Ut7L6D5eCrrigO3jOSbpt0q54bfCTheM"></script>
<script type="text/javascript">
    //控件
    var map = new BMap.Map("allmap");
    map.centerAndZoom(new BMap.Point(117.13545, 36.679209), 15);
    map.addControl(new BMap.NavigationControl());
    map.addControl(new BMap.NavigationControl());
    map.addControl(new BMap.ScaleControl());
    map.addControl(new BMap.OverviewMapControl());
    map.addControl(new BMap.MapTypeControl());
    map.setCurrentCity("济南"); // 仅当设置城市信息时，MapTypeControl的切换功能才能可用
    // 百度地图API功能
    map = new BMap.Map("allmap");
    map.centerAndZoom(new BMap.Point(117.13545, 36.679209), 15);
    var data_info = [[117.13545, 36.679209, "地址：济南市高新区银荷大厦C座10层"]
    ];
    var opts = {
        width: 156,     // 信息窗口宽度
        height: 80,     // 信息窗口高度
        title: "山东众云教育科技有限公司", // 信息窗口标题
        enableMessage: true//设置允许信息窗发送短息
    };
    for (var i = 0; i < data_info.length; i++) {
        var marker = new BMap.Marker(new BMap.Point(data_info[i][0], data_info[i][1]));  // 创建标注
        var content = data_info[i][2];
        map.addOverlay(marker);               // 将标注添加到地图中
        addClickHandler(content, marker);
    }
    function addClickHandler(content, marker) {
        marker.addEventListener("click", function (e) {
                    openInfo(content, e)
                }
        );
    }
    function openInfo(content, e) {
        var p = e.target;
        var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
        var infoWindow = new BMap.InfoWindow(content, opts);  // 创建信息窗口对象
        map.openInfoWindow(infoWindow, point); //开启信息窗口
    }

    // 初始化Web Uploader
    var $list = $("#fileList");
    var $myModal = $("#myModal");

    var uploader = WebUploader.create({

        // 选完文件后，是否自动上传。
        auto: true,
        //重复上传
        duplicate: true,

        // swf文件路径
        swf: '${base}/static/admin/plugins/webuploader-0.1.5/Uploader.swf',

        // 文件接收服务端。
        server: '${base}/admin/file/upload.jhtml',

        // 选择文件的按钮。可选。
        // 内部根据当前运行是创建，可能是input元素，也可能是flash.
        pick: {
            id: '#filePicker',
            multiple: false
        },
        // 只允许选择图片文件。
        accept: {
            title: 'Images',
            extensions: 'jpg,jpeg,png',
            mimeTypes: 'image/jpg,image/jpeg,image/png'
        },

        fileNumLimit: 1
    });
    // 当有文件添加进来的时候
    uploader.on('fileQueued', function (file) {
        var $li = $('<div id="' + file.id + '" class="file-item1">' + '<input type="hidden" name="adImageUrl" id="adImageUrl' + file.id + '"/>' + '<div class="info">' + file.name + '</div>' + '</div>');
        $img = $li.find('img');
        // $list为容器jQuery实例
        $list.append($li);
    });
    // 文件上传过程中创建进度条实时显示。
    uploader.on('uploadProgress', function (file, percentage) {
        var $li = $('#' + file.id),
                $percent = $li.find('.progress span');

        // 避免重复创建
        if (!$percent.length) {
            $percent = $('<p class="progress"><span></span></p>')
                    .appendTo($li)
                    .find('span');
        }

        $percent.css('width', percentage * 100 + '%');
    });

    // 文件上传成功，给item添加成功class, 用样式标记上传成功。
    uploader.on('uploadSuccess', function (file, response) {
//        $('#' + file.id).addClass('upload-state-done');
        $('#picture').val(response.content);
    });

    // 文件上传失败，显示上传出错。
    uploader.on('uploadError', function (file) {
        var $li = $('#' + file.id),
                $error = $li.find('div.error');

        // 避免重复创建
        if (!$error.length) {
            $error = $('<div class="error"></div>').appendTo($li);
        }

        $error.text('上传失败');
    });

    // 完成上传完了，成功或者失败，先删除进度条。
    uploader.on('uploadComplete', function (file) {
        $('#' + file.id).find('.progress').remove();
        uploader.refresh();
    });
    //执行删除方法
    $list.on("click", ".remove-this", function () {
        $(this).parent().remove();
    });
    $myModal.on("shown.bs.modal", function () {
        uploader.refresh();
    });
</script>
</body>
</html>
[/#escape]