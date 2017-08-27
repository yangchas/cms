[#escape x as x?html]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>静态化管理</title>

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
                    <form method="post" action="${base}/admin/static/generate.jhtml" class="form-horizontal"
                          id="mainForm">
                        <div class="form-group">
                            <label class="col-sm-3 control-label"><span class="text-danger">*</span>&nbsp;生成类型：</label>
                            <div class="col-sm-8">
                                <select class="form-control" id="generateType" name="generateType">
                                    [#list generateTypes as generateType]
                                        <option value="${generateType.name()}">${generateType}</option>
                                    [/#list]
                                </select>
                            </div>
                        </div>
                        <div class="hr-line-dashed"></div>
                        <div class="form-group hidden">
                            <label class="col-sm-3 control-label"><span class="text-danger">*</span>&nbsp;文章分类：</label>

                            <div class="col-sm-8">
                                <select class="form-control" id="parent" name="articleCategoryId">
                                    [#list articleCategoryTree as item]
                                        <option [#if article.articleCategory.name==item.name]selected="selected"[/#if]
                                                value="${item.id}">${item.name}
                                        </option>
                                    [/#list]
                                </select>
                            </div>
                        </div>
                        <div class="input-group input-medium date-picker input-daterange hidden" id="date"
                             style="width: 100%" data-date-format="yyyy-mm-dd">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">开始时间</label>

                                <div class="col-sm-8">
                                    <input name="beginDate"
                                           class="col-sm-4 form-control help-block m-b-none"
                                           style="width: 280px;" type="text" value="${defaultBeginDate?date}">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">结束时间</label>

                                <div class="col-sm-8">
                                    <input name="endDate" class="col-sm-4 form-control help-block m-b-none"
                                           style="width: 280px;" type="text" value="${defaultEndDate?date}">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-4 col-sm-offset-2">
                                <button class="btn btn-primary" id="generate" type="button">确定</button>
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
<div id="spinner" class="sk-spinner sk-spinner-wave" style="display: none">
    <div class="sk-rect1"></div>
    <div class="sk-rect2"></div>
    <div class="sk-rect3"></div>
    <div class="sk-rect4"></div>
    <div class="sk-rect5"></div>
</div>
<script src="${base}/static/admin/js/jquery.min.js?v=2.1.4"></script>
<script src="${base}/static/admin/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${base}/static/admin/js/content.min.js?v=1.0.0"></script>

<script src="${base}/static/admin/js/jquery.form.js" type="text/javascript"></script>
<script src="${base}/static/admin/js/plugins/validate/jquery.validate.min.js"></script>
<script src="${base}/static/admin/js/plugins/validate/messages_zh.min.js"></script>
<script src="${base}/static/admin/js/plugins/toastr/toastr.min.js"></script>
<script src="${base}/static/admin/js/plugins/datapicker/bootstrap-datepicker.js"></script>

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

        $(".date-picker").datepicker({
            language: "zh-CN",
            autoclose: true
        });
        var $mainForm = $("#mainForm");
        var $spinner = $("#spinner");
        var $generateType = $("#generateType");
        var $date = $("#date");
        var $parent = $("#parent");

        var e = "<i class='fa fa-times-circle'></i> ";

        $mainForm.validate();

        $generateType.change(function () {
            if ($(this).val() == "index") {
                $date.addClass("hidden");
                $parent.closest("div .form-group").addClass("hidden");
            } else {
                $date.removeClass("hidden");
                $parent.closest("div .form-group").removeClass("hidden");
            }
        });

        $("#generate").on('click', function () {
            if ($mainForm.valid()) {
                $spinner.show();
                $mainForm.ajaxSubmit({
                    success: function (result) {
                        $spinner.hide();
                        toastr[result.type](result.message);
                    }
                });
            }
        });
    });
</script>
</body>
</html>
[/#escape]