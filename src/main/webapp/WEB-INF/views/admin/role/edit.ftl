[#escape x as x?html]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>角色管理</title>

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
                    <form method="post" action="${base}/admin/role/${action}.jhtml" class="form-horizontal"
                          id="mainForm">
                        <input id="id" name="id" class="form-control" type="hidden" value="${role.id}">
                        <div class="form-group">
                            <label class="col-sm-3 control-label"><span class="text-danger">*</span>&nbsp;角色名称：</label>
                            <div class="col-sm-8">
                                <input id="name" name="name" class="form-control" type="text" value="${role.name}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label"><span class="text-danger">*</span>&nbsp;系统管理：</label>
                            <div class="col-sm-2">
                                <input id="setting" name="authorities" type="checkbox" value="admin:setting"
                                    [#if role.authorities != null && role.authorities.contains("admin:setting")]
                                       checked="checked"[/#if]><label for="setting">系统设置</label>
                            </div>
                            <div class="col-sm-2">
                                <input id="role" name="authorities" type="checkbox" value="admin:role"
                                    [#if role.authorities != null && role.authorities.contains("admin:role")]
                                       checked="checked"[/#if]><label for="role">角色管理</label>
                            </div>
                            <div class="col-sm-4">
                                <input id="admin" name="authorities" type="checkbox" value="admin:admin"
                                    [#if role.authorities != null && role.authorities.contains("admin:admin")]
                                       checked="checked"[/#if]><label for="admin">管理员</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label"><span class="text-danger">*</span>&nbsp;内容管理：</label>
                            <div class="col-sm-2">
                                <input id="nav" name="authorities" type="checkbox" value="admin:nav"
                                    [#if role.authorities != null && role.authorities.contains("admin:nav")]
                                       checked="checked"[/#if]><label for="nav">导航管理</label>
                            </div>
                            <div class="col-sm-2">
                                <input id="article" name="authorities" type="checkbox" value="admin:article"
                                    [#if role.authorities != null && role.authorities.contains("admin:article")]
                                       checked="checked"[/#if]><label for="article">文章管理</label>
                            </div>
                            <div class="col-sm-2">
                                <input id="articleClassify" name="authorities" type="checkbox" value="admin:articleClassify"
                                    [#if role.authorities != null && role.authorities.contains("admin:articleClassify")]
                                       checked="checked"[/#if]><label for="articleClassify">文章分类</label>
                            </div>
                            <div class="col-sm-2">
                                <input id="friendLink" name="authorities" type="checkbox" value="admin:friendLink"
                                    [#if role.authorities != null && role.authorities.contains("admin:friendLink")]
                                       checked="checked"[/#if]><label for="friendLink">友情链接</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label"><span class="text-danger"></span></label>
                            <div class="col-sm-2">
                                <input id="adPosition" name="authorities" type="checkbox" value="admin:adPosition"
                                    [#if role.authorities != null && role.authorities.contains("admin:adPosition")]
                                       checked="checked"[/#if]><label for="adPosition">广告位</label>
                            </div>
                            <div class="col-sm-2">
                                <input id="ad" name="authorities" type="checkbox" value="admin:ad"
                                    [#if role.authorities != null && role.authorities.contains("admin:ad")]
                                       checked="checked"[/#if]><label for="ad">广告管理</label>
                            </div>
                            <div class="col-sm-4">
                                <input id="static" name="authorities" type="checkbox" value="admin:static"
                                    [#if role.authorities != null && role.authorities.contains("admin:static")]
                                       checked="checked"[/#if]><label for="static">静态化管理</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label"><span class="text-danger">*</span>&nbsp;运营管理：</label>
                            <div class="col-sm-2">
                                <input id="hotStatistic" name="authorities" type="checkbox" value="admin:hotStatistic"
                                    [#if role.authorities != null && role.authorities.contains("admin:hotStatistic")]
                                       checked="checked"[/#if]><label for="hotStatistic">文章热度统计</label>
                            </div>
                            <div class="col-sm-2">
                                <input id="SEOSetting" name="authorities" type="checkbox" value="admin:SEOSetting"
                                    [#if role.authorities != null && role.authorities.contains("admin:SEOSetting")]
                                       checked="checked"[/#if]><label for="SEOSetting">SEO设置</label>
                            </div>
                            <div class="col-sm-2">
                                <input id="joinUs" name="authorities" type="checkbox" value="admin:joinUs"
                                    [#if role.authorities != null && role.authorities.contains("admin:joinUs")]
                                       checked="checked"[/#if]><label for="joinUs">职位申请</label>
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
        var e = "<i class='fa fa-times-circle'></i> ";
        $("#mainForm").validate({
            rules: {
                name: {
                    required: true,
                    minlength: 2
                }
            },
            messages: {
                name: {
                    required: e + "请输入角色名称",
                    minlength: e + "角色名称必须两个字符以上"
                }
            }
        });
    });
</script>
</body>
</html>
[/#escape]