[#escape x as x?html]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>管理员列表</title>

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
    <div class="ibox-content">
        <div class="row row-lg">
            <div class="panel panel-default">
                <div class="panel-heading">
                    查询条件
                </div>
                <div class="panel-body form-group">
                    <label class="col-sm-2 control-label">管理员名称：</label>

                    <div class="col-sm-2">
                        <input type="text" class="form-control" id="search_name"/>
                    </div>
                    <div class="col-sm-1">
                        <button class="btn btn-primary" id="btn_search">查询</button>
                    </div>
                </div>
            </div>
            <div id="toolbar" class="btn-group">
                <a id="btn_add" type="button" class="btn btn-white" href="${base}/admin/admin/add.jhtml">
                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
                </a>
                <a id="btn_edit" type="button" class="btn btn-white">
                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
                </a>
                <a id="btn_delete" type="button" class="btn btn-danger">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                </a>
            </div>
            <table id="table"></table>
        </div>
    </div>
</div>
<script src="${base}/static/admin/js/jquery.min.js?v=2.1.4"></script>
<script src="${base}/static/admin/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${base}/static/admin/js/content.min.js?v=1.0.0"></script>
<script src="${base}/static/admin/js/plugins/bootstrap-table/bootstrap-table.min.js"></script>
<script src="${base}/static/admin/js/plugins/bootstrap-table/bootstrap-table-mobile.min.js"></script>
<script src="${base}/static/admin/js/plugins/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="${base}/static/admin/js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="${base}/static/admin/js/plugins/toastr/toastr.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {

        var $table = $('#table');
        var $searchName = $('#search_name');
        var $btnSearch = $('#btn_search');
        var $btnEdit = $('#btn_edit');
        var $btnDelete = $('#btn_delete');

        var selectId = "";

        /*bootstrap table*/
        $table.bootstrapTable({
            url: "${base}/admin/admin/getPage.jhtml",//请求数据url
            queryParams: function (params) {
                return {
                    pageNumber: params.pageNumber,  //页码
                    pageSize: params.pageSize,   //页面大小
                    search_LIKE_username: $searchName.val(), //搜索名称
                    sortName: params.sortName, //排序
                    sortOrder: params.sortOrder, //排序
                };
            },
            toolbar: "#toolbar",
            striped: true,
            cache: false,
            toolbarAlign: "right",
            showHeader: true,
            sortable: true,
            pagination: true,//分页
            sidePagination: 'server',//服务器端分页
            pageNumber: 1,
            pageList: [5, 10, 20, 50],//分页步进值
            queryParamsType: '',//默认值为 'limit' ,在默认情况下 传给服务端的参数为：offset,limit,sort // 设置为 '' 在这种情况下传给服务器的参数为：pageSize,pageNumber
            //表格的列
            columns: [
                {
                    field: 'username',//域值
                    title: '管理员名称',//标题
                    visible: true,//false表示不显示
                    sortable: true,//启用排序
                    width: '25%',
                }
                ,{
                    field: 'email',//域值
                    title: 'E-mail',//标题
                    visible: true,//false表示不显示
                    sortable: false,//启用排序
                    width: '25%',
                }
                ,{
                    field: 'mobile',//域值
                    title: '手机号',//标题
                    visible: true,//false表示不显示
                    sortable: false,//启用排序
                    width: '25%',
                }
                , {
                    field: 'createDate',//域值
                    title: '创建时间',//标题
                    visible: true,//false表示不显示
                    sortable: false,//启用排序
                    width: '25%'
                }
            ]
            , onClickRow: function (row, $element) {
                $(".danger").removeClass("danger");
                $element.addClass("danger");
                selectId = row.id;
            }
        });

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

        /*搜索按钮*/
        $btnSearch.click(function () {
            $table.bootstrapTable('refresh');
        });

        /*修改按钮*/
        $btnEdit.click(function () {
            if (selectId == "") {
                swal("操作错误！", "请选择一行修改!", "warning");
                return;
            }
            window.location.href = "${base}/admin/admin/edit/" + selectId + ".jhtml";
        });

        /*删除按钮*/
        $btnDelete.click(function () {
            if (selectId == "") {
                swal("操作错误！", "请选择一行删除!", "warning");
                return;
            }
            swal({
                title: "您确定要删除这条信息吗",
                text: "删除后将无法恢复，请谨慎操作！",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "删除",
                closeOnConfirm: true
            }, function () {
                $.ajax({
                    type: "post",
                    dataType: "json",
                    url: '${base}/admin/admin/delete/' + selectId + '.jhtml',
                    success: function (result) {
                        $table.bootstrapTable('remove', {
                            field: 'id',
                            values: [result.content]
                        });
                        toastr[result.type](result.message)
                    }
                });
            });
        });
        [#if message ??]
            toastr["${message.type}"]("${message.message}");
        [/#if]
    });
</script>
</body>
</html>
[/#escape]