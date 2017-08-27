[#escape x as x?html]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>文章管理</title>

    <link rel="shortcut icon" href="favicon.ico">
    <link href="${base}/static/admin/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="${base}/static/admin/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="${base}/static/admin/css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
    <link href="${base}/static/admin/css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <link href="${base}/static/admin/css/plugins/bootstrap-table/bootstrap-table.min.css" rel="stylesheet">
    <link href="${base}/static/admin/css/plugins/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css"
          rel="stylesheet">
    <link href="${base}/static/admin/css/plugins/datapicker/datepicker3.css" rel="stylesheet">
    <link href="${base}/static/admin/css/animate.min.css" rel="stylesheet">
    <link href="${base}/static/admin/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <link href="${base}/static/admin/plugins/webuploader-0.1.5/webuploader.css" rel="stylesheet">
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
                    <form method="post" action="${base}/admin/article/${action}.jhtml" class="form-horizontal"
                          id="mainForm">
                        <input id="id" name="id" class="form-control" type="hidden" value="${article.id}">
                        <div class="form-group">
                            <label class="col-sm-3 control-label"><span class="text-danger">*</span>&nbsp;文章标题：</label>
                            <div class="col-sm-8">
                                <input id="title" name="title" class="form-control" type="text" value="${article.title}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label"><span class="text-danger">*</span>&nbsp;上级文章分类：</label>
                            <div class="col-sm-8">
                                <select class="form-control" id="parent" name="parentId">
                                    [#list articleCategoryList as item]
                                        <option [#if article.articleCategory.name==item.name]selected="selected"[/#if]
                                                value="${item.id}">${item.name}
                                        </option>
                                    [/#list]
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">&nbsp;页面标题：</label>
                            <div class="col-sm-8">
                                <input id="pageTitle" name="pageTitle" class="form-control" type="text" value="${article.pageTitle}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">&nbsp;页面关键字：</label>
                            <div class="col-sm-8">
                                <input id="pageKey" name="pageKey" class="form-control" type="text" value="${article.pageKey}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">是否发布：</label>
                            <div class="col-sm-8">
                                <input name="_isPublication" value="false" type="hidden">
                                <div class="checkbox checkbox-success">
                                    <input id="isPublication" name="isPublication" value="true"
                                           type="checkbox" [#if article.isPublication]
                                           checked="checked"[/#if] />
                                    <label for="isPublication">
                                        发布
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">是否置顶：</label>
                            <div class="col-sm-8">
                                <input name="_isTop" value="false" type="hidden">
                                <div class="checkbox checkbox-success">
                                    <input id="isTop" name="isTop" value="true"
                                           type="checkbox" [#if article.isTop]
                                           checked="checked"[/#if] />
                                    <label for="isTop">
                                        置顶
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">&nbsp;标签：</label>
                            <div class="col-sm-8">
                                <div class="checkbox checkbox-success checkbox-inline">
                                    <input type="checkbox" id="rec" name="tags"
                                           value="rec" [#if article.tags != null && article.tags.contains("rec")]
                                           checked="checked"[/#if]>
                                    <label for="rec">
                                        推荐
                                    </label>
                                </div>
                                <div class="checkbox checkbox-success checkbox-inline">
                                    <input type="checkbox" id="hot" name="tags"
                                           value="hot" [#if article.tags != null && article.tags.contains("hot")]
                                           checked="checked"[/#if]>
                                    <label for="hot">
                                        热点
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">&nbsp;作者：</label>
                            <div class="col-sm-8">
                                <input id="author" name="author" class="form-control" type="text" value="${article.author}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">发布时间</label>
                            <div class="col-sm-8">
                                <div id="datepicker" class="input-group date"  data-provide="datepicker-inline" data-date-end-date = "0d" data-date-format="yyyy-mm-dd">
                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                    <input type="text" class="form-control input-sm" name="pubDate" value="${article.pupDate}">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">&nbsp;页面描述：</label>
                            <div class="col-sm-8">
                                <input id="digest" name="digest" class="form-control" type="text" value="${article.digest}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">&nbsp;文章内容：</label>
                            <div class="col-sm-8">
                                <textarea name="content"
                                          style="width: 100%;height:400px;visibility:hidden">${article.content}</textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">&nbsp;图片：</label>
                            <div class="col-sm-4">
                                <input id="pictureUrl" name="pictureUrl" class="form-control" type="text"
                                       value="${article.pictureUrl}">
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
<script src="${base}/static/admin/js/plugins/validate/jquery.validate.min.js"></script>
<script src="${base}/static/admin/js/plugins/validate/messages_zh.min.js"></script>
<script src="${base}/static/admin/js/plugins/datapicker/bootstrap-datepicker.js"></script>
<script charset="utf-8" src="${base}/static/admin/plugins/kindeditor/kindeditor-min.js"></script>
<script charset="utf-8" src="${base}/static/admin/plugins/kindeditor/lang/zh-CN.js"></script>
<script src="${base}/static/admin/plugins/webuploader-0.1.5/webuploader.min.js"></script>
<script type="text/javascript">

    [#--时间插件--]
    $('#datepicker').datepicker({
        autoclose: true,//自动关闭
        clearBtn:true,  //带清除
    });
    [#--默认当前时间--]
    $('#datepicker').datepicker('setDate', 'today');


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
        var e = "<i class='fa fa-times-circle'></i> ";
        $("#mainForm").validate({
            rules: {
                title: {
                    required: true,
                    minlength: 2
                },
                parentId:{
                    required: true
                }
            },
            messages: {
                title: {
                    required: e + "请输入文章标题",
                    minlength: e + "文章标题必须两个字符以上"
                },
                parentId:{
                    required: e + "请输入上级文章分类"
                }
            }
        });
    });
    [#--内容编辑器--]
    KindEditor.ready(function (K) {
        var options = {
            filterMode: true,
            autoHeightMode:true,

            afterBlur: function () {
                editor.sync();
            },
            uploadJson: '${base}/static/admin/plugins/kindeditor/jsp/upload_json.jsp',
            fileManagerJson: '${base}/static/admin/plugins/kindeditor/jsp/file_manager_json.jsp',
            allowFileManager: true
        };
        var editor = K.create('textarea[name="content"]', options);

    });

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
        $('#pictureUrl').val(response.content);
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

</script>
</body>
</html>
[/#escape]