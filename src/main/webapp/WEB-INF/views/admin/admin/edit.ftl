[#escape x as x?html]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>管理员</title>

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
                    <form method="post" action="${base}/admin/admin/${action}.jhtml" class="form-horizontal"
                          id="mainForm">
                        <input id="id" name="id" class="form-control" type="hidden" value="${admin.id}">
                        <div class="form-group">
                            <label class="col-sm-3 control-label"><span class="text-danger">*</span>&nbsp;用户名：</label>
                            <div class="col-sm-8">
                                <input id="username" name="username" class="form-control" type="text" value="${admin.username}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label"><span class="text-danger">*</span>&nbsp;密码：</label>
                            <div class="col-sm-8">
                                <input id="plainPassword" name="plainPassword" class="form-control" type="password"
                                       placeholder="...不修改保持为空">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label"><span class="text-danger">*</span>&nbsp;E-mail：</label>
                            <div class="col-sm-8">
                                <input id="email" name="email" class="form-control" type="text" value="${admin.email}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label"><span class="text-danger">*</span>&nbsp;手机号：</label>
                            <div class="col-sm-8">
                                <input id="mobile" name="mobile" class="form-control" type="text" value="${admin.mobile}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label">是否启用：</label>
                            <div class="col-sm-8">
                                <input name="_isEnabled" value="false" type="hidden">
                                <div class="checkbox checkbox-success">
                                    <input id="isEnabled" name="isEnabled" value="true"
                                           type="checkbox" [#if admin.isEnabled]
                                           checked="checked"[/#if] />
                                    <label for="isEnabled">
                                        启用
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-3 control-label"><span class="text-danger">*</span>&nbsp;角色：</label>
                            <div class="col-sm-8">
                                <select class="form-control" id="role" name="roleId">
                                    [#list roleList as item]
                                        <option [#if admin.role.id==item.id]selected="selected"[/#if]
                                                value="${item.id}">${item.name}
                                        </option>
                                    [/#list]
                                </select>
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
    // 手机号码验证
    jQuery.validator.addMethod("isMobile", function(value, element) {
        var length = value.length;
        var mobile = /^1(3|4|5|7|8)\d{9}$/;
        return this.optional(element) || (length == 11 && mobile.test(value));
    }, "请正确填写您的手机号码");
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
                username: {
                    required: true,
                    minlength: 2
                },
                password: {
                    required: true,
                    minlength: 4
                },
                [#if action == 'save']
                    plainPassword: {
                        required: true,
                        minlength: 4
                    },
                [/#if]
                email: {
                    required: true,
                    email: true
                },
                mobile: {
                    required: true,
                    isMobile: true
                }
            },
            messages: {
                username: {
                    required: e + "请输入管理员名称",
                    minlength: e + "管理员名称必须两个字符以上"
                }
            }
        });
    });
</script>
</body>
</html>
[/#escape]