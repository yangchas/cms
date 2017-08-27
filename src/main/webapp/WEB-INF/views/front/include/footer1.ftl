[#escape x as x?html]
<!-- 尾部 -->
<div class="foot section">
    <div class="foot-content">
        <div class="foot-hour">
            <div class="foot-hour-main">
                <p>
                    <img class="lazy" data-original="${base}/static/front/default/images/index_hour.png">
                </p>

                <p class="foot-call">
                    服务热线
                </p>

                <p class="foot-call-number">
                    400-6852-680
                </p>
            </div>
            <div class="foot-tb">
                <img class="lazy" data-original="${base}/static/front/default/images/index-foot-tb.png" width="55" height="50">
            </div>
        </div>
        <div class="foot-detail">
            <div class="foot-detail-category">
                <div class="foot-friend">
                    <img class="lazy" data-original="${base}/static/front/default/images/index-yqlj.png" width="87" height="20">
                </div>
                <div class="foot-friend">
                    <ul style="list-style: none;padding: 0">
                        [@friendLink_list]
                            [#list friendLinks as friendLink]
                                <li style="float: left;margin-right: 30px">
                                    <a class="foot-friend-link" href="${friendLink.url}" target="_blank">${friendLink.name}</a>
                                </li>
                            [/#list]
                        [/@friendLink_list]
                    </ul>
                    <div style="clear: both"></div>
                </div>
                <div style="margin-top: 30px">
                    <img src="${base}/static/front/default/images/index-focus.png" width="87" height="20">
                </div>
                <div class="foot-erweima">
                    <div class="row" style="margin-top: 20px">
                        <div class="col-sm-6">
                            <div>
                                <img class="lazy" data-original="${base}/static/front/default/images/zxx.png" width="135" height="135">
                            </div>
                            <div class="foot-erweima-title">
                                中小学生安全服务在线
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div>
                                <img class="lazy" data-original="${base}/static/front/default/images/zyjy.png" width="135" height="135">
                            </div>
                            <div class="foot-erweima-title">
                                众云教育
                            </div>
                        </div>
                    </div>
                </div>
                <div style="margin-top: 30px">
                    <img src="${base}/static/front/default/images/index-lxdz.png" width="87" height="20">
                </div>
                <div style="margin-top: 30px">
                    <span class="glyphicon glyphicon-map-marker foot-add1"></span>
                    <span class="foot-add2">济南市高新区银荷大厦C座10层</span>
                </div>
            </div>
        </div>
        <div style="clear: both"></div>
    </div>
    <div class="foot-copyright">
        <p class="foot-copyright-company">
            山东众云教育科技有限公司
        </p>
        <p class="foot-copyright-number">© 2014-2017 zhongyunjy.com 版权所有 鲁ICP备16024789号-2</p>
    </div>
</div>
[/#escape]