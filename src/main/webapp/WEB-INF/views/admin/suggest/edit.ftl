[#escape x as x?html]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>建议反馈</title>

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
                    <form class="form-horizontal" id="mainForm">
                        <input id="id" name="id" class="form-control" type="hidden" value="${suggest.id}">

                        <div class="form-group">
                            <label class="col-sm-3 control-label">申请概述：</label>

                            <div class="col-sm-8">
                            ${suggest.title}
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">建议内容：</label>

                            <div class="col-sm-8">
                            ${suggest.content}
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">建议类型：</label>

                            <div class="col-sm-8">
                            ${suggest.type}
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">联系方式：</label>

                            <div class="col-sm-8">
                            ${suggest.contact}
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">照片：</label>

                            <div class="col-sm-8">
                                <a class="fa fa-tag" style="font-size: 15px; line-height: 30px"
                                   href="${suggest.picture}" target="_blank">照片查看</a>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
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
</body>
</html>
[/#escape]