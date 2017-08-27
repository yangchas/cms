[#escape x as x?html]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>SEO</title>

    <link rel="shortcut icon" href="favicon.ico">
    <link href="${base}/static/admin/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="${base}/static/admin/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
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
                    <form method="post" action="${base}/admin/seo/${action}.jhtml" class="form-horizontal"
                          id="mainForm">
                        <input id="id" name="id" class="form-control" type="hidden" value="${seo.id}">
                        <div class="form-group">
                            <label class="col-sm-3 control-label"><span class="text-danger">*</span>&nbsp;类型名称：</label>
                            <div class="col-sm-8">
                                <label class="control-label">${seo.type}</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">页面标题：</label>
                            <div class="col-sm-8">
                                <input id="name" name="title" class="form-control" type="text" value="${seo.title}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">页面关键字：</label>
                            <div class="col-sm-8">
                                <input id="name" name="keywords" class="form-control" type="text" value="${seo.keywords}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">页面描述：</label>
                            <div class="col-sm-8">
                                <input id="name" name="description" class="form-control" type="text" value="${seo.description}">
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
</body>
</html>
[/#escape]