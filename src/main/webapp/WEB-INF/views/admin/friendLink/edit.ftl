[#escape x as x?html]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>系统设置</title>

    <link rel="shortcut icon" href="favicon.ico">
    <link href="${base}/static/admin/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="${base}/static/admin/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <link href="${base}/static/admin/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
          rel="stylesheet">
    <link href="${base}/static/admin/plugins/webuploader-0.1.5/webuploader.css" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="${base}/static/admin/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="${base}/static/admin/css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <link href="${base}/static/admin/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="${base}/static/admin/css/animate.min.css" rel="stylesheet">
    <link href="${base}/static/admin/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html"/>
    <![endif]-->
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-content">
                    <form method="post" action="${base}/admin/friendLink/${action}.jhtml" class="form-horizontal"
                          id="mainForm">
                        <input id="id" name="id" class="form-control" type="hidden" value="${friendLink.id}">
                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" href="#tab-1" aria-expanded="true"> 基本设置</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div id="tab-1" class="tab-pane active">
                                <div class="panel-body">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label"><span class="text-danger">*</span>&nbsp;名称：</label>
                                        <div class="col-sm-8">
                                            <input id="name" name="name" class="form-control" type="text"
                                                   value="${friendLink.name}">
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label"><span class="text-danger">*</span>&nbsp;url：</label>
                                        <div class="col-sm-8">
                                            <input id="url" name="url" class="form-control" type="text"
                                                   value="${friendLink.url}">
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label"><span class="text-danger">*</span>&nbsp;logo：</label>

                                        <div class="col-sm-4">
                                            <input id="logo" name="logo" class="form-control" type="text"
                                                   value="${friendLink.logo}">
                                        </div>
                                        <div class="col-sm-4">
                                            <div id="uploader">
                                                <!--用来存放item-->
                                                <div id="fileList" class="uploader-list"></div>
                                                <div id="filePicker">选择图片</div>
                                            </div>
                                            <span class="help-block m-b-none"><i class="fa fa-info-circle"></i> 支持格式：*.jpg、*.jpeg、*.png</span>
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">排序：</label>
                                        <div class="col-sm-8">
                                            <input id="sort" name="sort" class="form-control" type="text"
                                                   value="${friendLink.sort}">
                                        </div>
                                    </div>
                                    <div class="hr-line-dashed"></div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
                                <button class="btn btn-primary" type="submit">保存内容</button>
                                <button class="btn btn-white" type="button" onclick="javascript:history.back(-1);">返回
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${base}/static/admin/js/jquery.min.js?v=2.1.4"></script>
<script src="${base}/static/admin/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${base}/static/admin/js/content.min.js?v=1.0.0"></script>
<script src="${base}/static/admin/js/plugins/switchery/switchery.js"></script>
<script src="${base}/static/admin/plugins/webuploader-0.1.5/webuploader.min.js"></script>
<script src="${base}/static/admin/js/plugins/validate/jquery.validate.min.js"></script>
<script src="${base}/static/admin/js/plugins/validate/messages_zh.min.js"></script>
<script src="${base}/static/admin/js/plugins/toastr/toastr.min.js"></script>
<script type="text/javascript">
    $.validator.setDefaults({
        highlight: function (e) {
            $(e).closest(".form-group").removeClass("has-success").addClass("has-error")
        },
        success: function (e) {
            e.closest(".form-group").removeClass("has-error").addClass("has-success")
        },
        errorElement: "span",
        errorPlacement: function (e, r) {
            e.appendTo(r.is(":radio") || r.is(":checkbox") ? r.parent().parent().parent() : r.parent())
        },
        errorClass: "help-block m-b-none",
        validClass: "help-block m-b-none"
    });
    $(document).ready(function () {

        /*toastr通知*/
        toastr.options = {
            "closeButton": true,
            "debug": false,
            "progressBar": false,
            "positionClass": "toast-bottom-right",
            "onclick": null,
            "showDuration": "400",
            "hideDuration": "1000",
            "timeOut": "1000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        };

        //初始化滑动开关
        var elem = document.querySelector('.js-switch');

        // 初始化Web Uploader
        var $list = $("#fileList");
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
            var $li = $('<div id="' + file.id + '" class="file-item thumbnail">' + '<input type="hidden" name="adImageUrl" id="adImageUrl' + file.id + '"/>' + '<img>' + '<div class="info">' + file.name + '</div>' + '<div class="remove-this">×</div>' + '</div>');
            $img = $li.find('img');
            // $list为容器jQuery实例
            $list.append($li);

            // 创建缩略图
            // 如果为非图片文件，可以不用调用此方法。
            // thumbnailWidth x thumbnailHeight 为 100 x 100
            uploader.makeThumb(file, function (error, src) {
                if (error) {
                    $img.replaceWith('<span>不能预览</span>');
                    return;
                }

                $img.attr('src', src);
            }, 100, 100);
            // 删除图片
            $list.off("click.removeFile");
            $list.on("click.removeFile", '.remove-this', function (ev) {
                ev.preventDefault();
                uploader.removeFile(file);
                $(this).parent().remove();
            });
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
            $('#' + file.id).addClass('upload-state-done');
            if (response.type != 'success') {
                toastr[response.type](response.message);
                return false;
            }
            $('#logo').val(response.content);
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

        //表单验证
        var init = new Switchery(elem);
        var e = "<i class='fa fa-times-circle'></i> ";
        $("#mainForm").validate({
            rules: {
                name: {
                    required: true
                },
                url: {
                    required: true,
                    pattern: /^(http:\/\/|https:\/\/).*$/i
                },
                logo: {
                    required: true
                },
                sort: {
                    pattern: /^\+?[0-9]\d*$/
                },
            },
            messages: {
                name: {
                    required: e + "请输入名称"
                },
                url: {
                    required: e + "请输入url",
                    pattern: e + "url格式不合法"
                },
                logo: {
                    required: e + "请上传logo",
                    pattern: e + "logo格式不合法",
                },
                sort: {
                    pattern: e + "格式不合法",
                }
            }
        });
        [#if message ??]
            toastr["${message.type}"]("${message.message}")
        [/#if]
    });
</script>
</body>
</html>
[/#escape]