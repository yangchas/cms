[#escape x as x?html]
<!-- 尾部 -->
<div class="bottom">
    <div class="bottom-content">
        <div class="row">
            <div class="col-sm-8">
                <table class="bottom-link">
                    <tr>
                        <td class="bottom-link-title">
                            友情链接：
                        </td>
                        <td class="bottom-link-content">
                            [@friendLink_list]
                                [#list friendLinks[0..5] as friendLink]
                                    <a class="bottom-table-link" href="${friendLink.url}"
                                       target="_blank">${friendLink.name}</a>
                                [/#list]
                            [/@friendLink_list]
                        </td>
                    </tr>
                    <tr>
                        <td class="bottom-link-title">
                        </td>
                        <td class="bottom-link-content">
                            [@friendLink_list]
                                [#list friendLinks[6..] as friendLink]
                                    <a class="bottom-table-link" href="${friendLink.url}"
                                       target="_blank">${friendLink.name}</a>
                                [/#list]
                            [/@friendLink_list]
                        </td>
                    </tr>
                </table>
                <div style="margin-top: 10px">
                    <table class="bottom-table2">
                        <tr>
                            <td class="bottom-table-font common-font">服务热线：</td>
                            <td class="bottom-table-font common-font" style="font-size: 16px">400-6852-680</td>
                        </tr>
                    </table>
                </div>
                <div style="margin-top: 10px">
                    <table class="bottom-table3">
                        <tr>
                            <td class="bottom-table-font common-font">联系地址：</td>
                            <td class="bottom-table-font common-font">济南市高新区银荷大厦C座10层</td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="row">
                    <div class="col-sm-6">
                        <div>
                            <img src="${base}/static/front/default/images/zxx.png" width="120" height="120">
                        </div>
                        <div style="width: 120px;color: #656565;text-align: center;font-size: 12px" class="common-font">
                            中小学生安全服务在线
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div>
                            <img src="${base}/static/front/default/images/zyjy.png" width="120" height="120">
                        </div>
                        <div style="width: 120px;color: #656565;text-align: center;font-size: 12px" class="common-font">
                            众云教育
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
[/#escape]