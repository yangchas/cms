[#escape x as x?html]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>文章热度统计</title>

    <link rel="shortcut icon" href="favicon.ico">
    <link href="${base}/static/admin/css/bootstrap.min14ed.css?v=3.3.6" rel="stylesheet">
    <link href="${base}/static/admin/css/font-awesome.min93e3.css?v=4.4.0" rel="stylesheet">
    <!-- Sweet Alert -->
    <link href="${base}/static/admin/css/animate.min.css" rel="stylesheet">
    <link href="${base}/static/admin/css/style.min862f.css?v=4.1.0" rel="stylesheet">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html"/>
    <![endif]-->
</head>
<body class="gray-bg">
<div class="echarts" id="echarts"></div>
<div style="width: 300px; margin: 0 auto">
    [@pagination pageNumber = page.getNumber() + 1 totalPages = page.getTotalPages()]
        [#include "/admin/include/pagination.ftl"]
    [/@pagination]
</div>
<script src="${base}/static/admin/js/jquery.min.js?v=2.1.4"></script>
<script src="${base}/static/admin/js/bootstrap.min.js?v=3.3.6"></script>
<script src="${base}/static/admin/js/content.min.js?v=1.0.0"></script>
<script src="${base}/static/admin/js/plugins/echarts/echarts-all.js"></script>
<script type="text/javascript">
    var chart = echarts.init(document.getElementById("echarts"));
    chart.setOption({
        tooltip: {
            trigger: "axis",
            formatter: function (params) {
                return params[0][1].name + "<br \/>" + params[0][0] + ": " + params[0][2];
            }
        },
        grid: {
            x: 300
        },
        xAxis: [
            {
                type: "value"
            }
        ],
        yAxis: [
            {
                type: "category",
                data: [
                    [#list page.content?reverse as article]
                        {
                            name: "[#noescape]${article.title?js_string}[/#noescape]"
                        }
                        [#if article_has_next],[/#if]
                    [/#list]
                ],
                axisLabel: {
                    formatter: function (value) {
                        return value.name;
                    }
                }
            }
        ],
        series: [
            {
                name: "热度",
                type: "bar",
                data: [
                    [#list page.content?reverse as article]
                    ${article.hit}
                        [#if article_has_next],[/#if]
                    [/#list]
                ]
            }
        ]
    });
</script>
</body>
</html>
[/#escape]