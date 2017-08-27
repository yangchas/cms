[#escape x as x?html]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>职位申请</title>

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
                    <form class="form-horizontal"
                          id="mainForm">
                        <input id="id" name="id" class="form-control" type="hidden" value="${joinUs.id}">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">职位：</label>
                            <div class="col-sm-8">
                                <input id="position" name="position" class="form-control" type="text" value="${joinUs.position}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">地区：</label>
                            <div class="col-sm-8">
                                <input id="region" name="region" class="form-control" type="text" value="${joinUs.region}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">类型：</label>
                            <div class="col-sm-8">
                                <input id="type" name="type" class="form-control" type="text" value="${joinUs.type}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">姓名：</label>
                            <div class="col-sm-8">
                                <input id="name" name="name" class="form-control" type="text" value="${joinUs.name}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">性别：</label>
                            <div class="col-sm-8">
                                <input id="name" name="name" class="form-control" type="text" [#if joinUs.sex == false]
                                      value="女"[/#if][#if joinUs.sex == true]
                                       value="男"[/#if]>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">电话：</label>
                            <div class="col-sm-8">
                                <input id="phone" name="phone" class="form-control" type="text" value="${joinUs.phone}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">QQ：</label>
                            <div class="col-sm-8">
                                <input id="qq" name="qq" class="form-control" type="text" value="${joinUs.qq}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">E-mail：</label>
                            <div class="col-sm-8">
                                <input id="mail" name="mail" class="form-control" type="text" value="${joinUs.mail}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">备注：</label>
                            <div class="col-sm-8">
                                <input id="remark" name="remark" class="form-control" type="text" value="${joinUs.remark}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">附件：</label>
                            <div class="col-sm-8">
                                <a class="fa fa-tag" style="font-size: 15px; line-height: 30px" href="${joinUs.annexe}">申请表</a>
                                [#--<input id="remark" name="remark" class="form-control" type="text" value="${joinUs.annexe}">--]
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