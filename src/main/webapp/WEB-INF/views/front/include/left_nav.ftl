[#escape x as x?html]
<div class="left-nav">
    <ul>
        <li class="left-nav-title nav-title">
            教育安全服务
            <span style="float: right;margin-right: 10px;margin-top: 15px" class="arrow">
               <img src="${base}/static/front/default/images/service/sq.png">
            </span>
            <span style="display: none;float: right;margin-right: 10px;margin-top: 15px" class="arrow">
                <img src="${base}/static/front/default/images/service/zk.png">
            </span>
        </li>
        <div class="nav-detail">
            <li class="left-nav-list">
                <a class="left-nav-list-font" data-id="safe" href="${base}/safe.jhtml#safe">教育安全综合治理</a>
            </li>
            <li class="left-nav-list">
                <a class="left-nav-list-font" data-id="student" href="${base}/student.jhtml#student">中小学安全保障</a>
            </li>
            <li class="left-nav-list">
                <a class="left-nav-list-font" data-id="operation" href="${base}/operation.jhtml#operation">运营综合服务</a>
            </li>
            <li class="left-nav-list">
                <a class="left-nav-list-font" data-id="app" href="${base}/app.jhtml#app">APP客户端</a>
            </li>
        </div>
    </ul>
    <ul>
        <li class="left-nav-title nav-title">
            教育信息化服务
            <span style="float: right;margin-right: 10px;margin-top: 15px" class="arrow">
               <img src="${base}/static/front/default/images/service/sq.png">
            </span>
            <span style="display: none;float: right;margin-right: 10px;margin-top: 15px" class="arrow">
                <img src="${base}/static/front/default/images/service/zk.png">
            </span>
        </li>
        <div class="nav-detail">
            <li class="left-nav-list">
                <a class="left-nav-list-font" data-id="computer" href="${base}/computer.jhtml#computer">机房建设</a>
            </li>
            <li class="left-nav-list">
                <a class="left-nav-list-font" data-id="office" href="${base}/office.jhtml#office">便捷办公</a>
            </li>
            <li class="left-nav-list">
                <a class="left-nav-list-font" data-id="experiment" href="${base}/experiment.jhtml#experiment">实训实验</a>
            </li>
            <li class="left-nav-list">
                <a class="left-nav-list-font" data-id="media" href="${base}/media.jhtml#media">多媒体教学</a>
            </li>
        </div>
    </ul>
</div>
[/#escape]
<script type="text/javascript">
    $(document).ready(function () {
        var url = window.location.hash.substring(1);
        var e = $("a[data-id=" + url + "]");
        e.parent().addClass("left-nav-active");
        e.closest('ul').siblings().find('.nav-detail').hide();
        $(".nav-title").click(function () {
            $(".nav-detail").slideToggle("slow");
            $(".arrow").toggle("slow");
        });
    });
</script>