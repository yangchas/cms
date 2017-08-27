[#escape x as x?html]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    [@seo type = "index"]
        <title>[#if seo.title??][@seo.title?interpret /][#else]在职研资讯官网[/#if]</title>
        <meta name="author" content="rongtai"/>
        <meta name="copyright" content="rongtai"/>
        [#if seo.keywords??]
            <meta name="keywords" content="[@seo.keywords?interpret /]"/>
        [/#if]
        [#if seo.description??]
            <meta name="description" content="[@seo.description?interpret /]"/>
        [/#if]
    [/@seo]
    <title>众云教育</title>
    <link href="${base}/static/favicon.ico" rel="icon" type="image/x-icon"/>
    <link rel="stylesheet" type="text/css" href="${base}/static/front/default/plugins/bootstrap3/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="${base}/static/front/default/css/style2.css">
    <script type="text/javascript" src="${base}/static/front/default/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="${base}/static/front/default/plugins/bootstrap3/js/bootstrap.js"></script>
</head>
<body>
<header>
    <div class="eco_header">
        <div class="container">
            <div class="pull-left header-logo">
                <a href="">
                    <img src="${base}/static/front/default/images/index-logo.png">
                </a>

            </div>
            <div class="pull-left header-font">做您身边的在职硕士博士教育专家</div>
            <div class="pull-right header-phone">
                <span><img src="${base}/static/front/default/images/index-phone.png"></span>
                <span class="header-phone-number">电话：010-56081463</span>
            </div>
        </div>
    </div>
</header>
<div class="section-ad"></div>
<div class="section-news">
    <div class="container news-information">
        <div class="news-information-title">
            <div class="pull-left">
                <div class="pull-left" style="margin-right: 10px">
                    <img src="${base}/static/front/default/images/index-k.png">
                </div>
                <div class="pull-left">
                    <p class="pubmednewsletter-chinese">考研资讯</p>
                    <p class="pubmednewsletter-english">PubMed Newsletter</p>
                </div>
            </div>
            <div class="pull-right">
                <a class="moreinformation" href="${base}/listAll.jhtml">查看更多+</a>
            </div>
        </div>
        <div class="index-line"></div>
        <div class="news-information-content">
            <div class="row">
                <div class="col-xs-3">
                    <a href="${base}/listAll.jhtml" class="news-information-content-display-a">
                        <div class="news-information-content-display">
                            5月份资讯
                        </div>
                    </a>
                </div>
                <div class="col-xs-3">
                    <a href="${base}/listAll.jhtml" class="news-information-content-display-a">
                        <div class="news-information-content-display">
                            6月份资讯
                        </div>
                    </a>
                </div>
                <div class="col-xs-3">
                    <a href="${base}/listAll.jhtml" class="news-information-content-display-a">
                        <div class="news-information-content-display">
                            7月份资讯
                        </div>
                    </a>
                </div>
                <div class="col-xs-3">
                    <a href="${base}/listAll.jhtml" class="news-information-content-display-a">
                        <div class="news-information-content-display">
                            8月份资讯
                        </div>
                    </a>
                </div>
            </div>
            <div class="row" style="margin-top: 10px">
                <div class="col-xs-3">
                    <a href="${base}/listAll.jhtml" class="news-information-content-display-a">
                        <div class="news-information-content-display">
                            9月份资讯
                        </div>
                    </a>
                </div>
                <div class="col-xs-3">
                    <a href="${base}/listAll.jhtml" class="news-information-content-display-a">
                        <div class="news-information-content-display">
                            10月份资讯
                        </div>
                    </a>
                </div>
                <div class="col-xs-3">
                    <a href="${base}/listAll.jhtml" class="news-information-content-display-a">
                        <div class="news-information-content-display">
                            11月份资讯
                        </div>
                    </a>
                </div>
                <div class="col-xs-3">
                    <a href="${base}/listAll.jhtml" class="news-information-content-display-a">
                        <div class="news-information-content-display">
                            12月份资讯
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="section-guide">
    <div class="container news-information">
        <div class="news-information-title">
            <div class="pull-left">
                <div class="pull-left" style="margin-right: 10px">
                    <img src="${base}/static/front/default/images/index-b.png">
                </div>
                <div class="pull-left">
                    <p class="pubmednewsletter-chinese">报考指南</p>
                    <p class="pubmednewsletter-english">Admsission Guide</p>
                </div>
            </div>
            <div class="pull-right">
                <a class="moreinformation" href="${base}/listAll.jhtml">查看更多+</a>
            </div>
        </div>
        <div class="index-line"></div>
        <div class="news-information-content">
            <div class="row">
                <div class="col-xs-3">
                    <div class="guide-content-display">
                        <a href="${base}/listAll.jhtml">
                            <img src="${base}/static/front/default/images/index-zn01.png" class="index-zn">
                        </a>
                    </div>
                    <div class="guide-content-display-name">金融学</div>
                </div>
                <div class="col-xs-3">
                    <div class="guide-content-display">
                        <a href="${base}/listAll.jhtml">
                            <img src="${base}/static/front/default/images/index-zn02.png" class="index-zn">
                        </a>
                    </div>
                    <div class="guide-content-display-name">企业管理</div>
                </div>
                <div class="col-xs-3">
                    <div class="guide-content-display">
                        <a href="${base}/listAll.jhtml">
                            <img src="${base}/static/front/default/images/index-zn03.png" class="index-zn">
                        </a>
                    </div>
                    <div class="guide-content-display-name">社会学</div>
                </div>
                <div class="col-xs-3">
                    <div class="guide-content-display">
                        <a href="${base}/listAll.jhtml">
                            <img src="${base}/static/front/default/images/index-zn04.png" class="index-zn">
                        </a>
                    </div>
                    <div class="guide-content-display-name">心理学</div>
                </div>
            </div>
            <div class="row" style="margin-top: 15px">
                <div class="col-xs-3">
                    <div class="guide-content-display">
                        <a href="${base}/listAll.jhtml">
                            <img src="${base}/static/front/default/images/index-zn05.png" class="index-zn">
                        </a>
                    </div>
                    <div class="guide-content-display-name">民商法学</div>
                </div>
                <div class="col-xs-3">
                    <div class="guide-content-display">
                        <a href="${base}/listAll.jhtml">
                            <img src="${base}/static/front/default/images/index-zn06.png" class="index-zn">
                        </a>
                    </div>
                    <div class="guide-content-display-name">刑法学</div>
                </div>
                <div class="col-xs-3">
                    <div class="guide-content-display">
                        <a href="${base}/listAll.jhtml">
                            <img src="${base}/static/front/default/images/index-zn07.png" class="index-zn">
                        </a>
                    </div>
                    <div class="guide-content-display-name">工商管理</div>
                </div>
                <div class="col-xs-3">
                    <div class="guide-content-display">
                        <a href="${base}/listAll.jhtml">
                            <img src="${base}/static/front/default/images/index-zn08.png" class="index-zn">
                        </a>
                    </div>
                    <div class="guide-content-display-name">公共管理</div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="section-analysis">
    <div class="container news-information">
        <div class="news-information-title">
            <div class="pull-left">
                <div class="pull-left" style="margin-right: 10px">
                    <img src="${base}/static/front/default/images/index-b.png">
                </div>
                <div class="pull-left">
                    <p class="pubmednewsletter-chinese">报考细节分析</p>
                    <p class="pubmednewsletter-english">Examination details analysis</p>
                </div>
            </div>
            <div class="pull-right">
                <a class="moreinformation" href="${base}/listAll.jhtml">查看更多+</a>
            </div>
        </div>
        <div class="index-line"></div>
        <div class="news-information-content">
            <div class="row">
                <div class="col-xs-3">
                    <div class="guide-content-display">
                        <a href="${base}/listAll.jhtml">
                            <img src="${base}/static/front/default/images/index-zn01.png" class="index-zn">
                        </a>
                    </div>
                    <div class="guide-content-display-name">金融学</div>
                </div>
                <div class="col-xs-3">
                    <div class="guide-content-display">
                        <a href="${base}/listAll.jhtml">
                            <img src="${base}/static/front/default/images/index-zn02.png" class="index-zn">
                        </a>
                    </div>
                    <div class="guide-content-display-name">企业管理</div>
                </div>
                <div class="col-xs-3">
                    <div class="guide-content-display">
                        <a href="${base}/listAll.jhtml">
                            <img src="${base}/static/front/default/images/index-zn03.png" class="index-zn">
                        </a>
                    </div>
                    <div class="guide-content-display-name">社会学</div>
                </div>
                <div class="col-xs-3">
                    <div class="guide-content-display">
                        <a href="${base}/listAll.jhtml">
                            <img src="${base}/static/front/default/images/index-zn04.png" class="index-zn">
                        </a>
                    </div>
                    <div class="guide-content-display-name">心理学</div>
                </div>
            </div>
            <div class="row" style="margin-top: 15px">
                <div class="col-xs-3">
                    <div class="guide-content-display">
                        <a href="${base}/listAll.jhtml">
                            <img src="${base}/static/front/default/images/index-zn05.png" class="index-zn">
                        </a>
                    </div>
                    <div class="guide-content-display-name">民商法学</div>
                </div>
                <div class="col-xs-3">
                    <div class="guide-content-display">
                        <a href="${base}/listAll.jhtml">
                            <img src="${base}/static/front/default/images/index-zn06.png" class="index-zn">
                        </a>
                    </div>
                    <div class="guide-content-display-name">刑法学</div>
                </div>
                <div class="col-xs-3">
                    <div class="guide-content-display">
                        <a href="${base}/listAll.jhtml">
                            <img src="${base}/static/front/default/images/index-zn07.png" class="index-zn">
                        </a>
                    </div>
                    <div class="guide-content-display-name">工商管理</div>
                </div>
                <div class="col-xs-3">
                    <div class="guide-content-display">
                        <a href="${base}/listAll.jhtml">
                            <img src="${base}/static/front/default/images/index-zn08.png" class="index-zn">
                        </a>
                    </div>
                    <div class="guide-content-display-name">公共管理</div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="section-textbook">
    <div class="container news-information" style="border-bottom: 2px solid #3482C2">
        <div class="news-information-title">
            <div class="pull-left">
                <div class="pull-left" style="margin-right: 10px">
                    <img src="${base}/static/front/default/images/index-j.png">
                </div>
                <div class="pull-left">
                    <p class="pubmednewsletter-chinese">教材-真题一站通</p>
                    <p class="pubmednewsletter-english">A textbook-through Zhenti</p>
                </div>
            </div>
            <div class="pull-right">
                <a class="moreinformation" href="${base}/listAll.jhtml">查看更多+</a>
            </div>
        </div>
        <div class="index-line"></div>
        <div class="news-information-content">
            <div id="example" class="carousel slide" data-ride="carousel" style="margin-bottom: 20px">
                <div class="carousel-inner">
                    <ul class="row item active">
                        <li class="col-xs-2">
                            <a href="${base}/listAll.jhtml#">
                                <img src="${base}/static/front/default/images/index-nk.png" srcset="${base}/static/front/default/images/index-nk.png" class="img-responsive">
                            </a>
                        </li>
                        <li class="col-xs-2">
                            <a href="${base}/listAll.jhtml#">
                                <img src="${base}/static/front/default/images/index-rd.png" srcset="${base}/static/front/default/images/index-rd.png" class="img-responsive">
                            </a>
                        </li>
                        <li class="col-xs-2">
                            <a href="${base}/listAll.jhtml#">
                                <img src="${base}/static/front/default/images/index-qh.png" srcset="${base}/static/front/default/images/index-qh.png" class="img-responsive">
                            </a>
                        </li>
                        <li class="col-xs-2">
                            <a href="${base}/listAll.jhtml#">
                                <img src="${base}/static/front/default/images/index-xd.png" srcset="${base}/static/front/default/images/index-xd.png" class="img-responsive">
                            </a>
                        </li>
                        <li class="col-xs-2">
                            <a href="${base}/listAll.jhtml#">
                                <img src="${base}/static/front/default/images/index-zd.png" srcset="${base}/static/front/default/images/index-zd.png" class="img-responsive">
                            </a>
                        </li>
                        <li class="col-xs-2">
                            <a href="${base}/listAll.jhtml#">
                                <img src="${base}/static/front/default/images/index-nk.png" srcset="${base}/static/front/default/images/index-nk.png" class="img-responsive">
                            </a>
                        </li>
                    </ul>
                    <ul class="row item">
                        <li class="col-xs-2">
                            <a href="${base}/listAll.jhtml#">
                                <img src="${base}/static/front/default/images/index-rd.png" srcset="${base}/static/front/default/images/index-rd.png" class="img-responsive">
                            </a>
                        </li>
                        <li class="col-xs-2">
                            <a href="${base}/listAll.jhtml#">
                                <img src="${base}/static/front/default/images/index-qh.png" srcset="${base}/static/front/default/images/index-qh.png" class="img-responsive">
                            </a>
                        </li>
                        <li class="col-xs-2">
                            <a href="${base}/listAll.jhtml#">
                                <img src="${base}/static/front/default/images/index-xd.png" srcset="${base}/static/front/default/images/index-xd.png" class="img-responsive">
                            </a>
                        </li>
                        <li class="col-xs-2">
                            <a href="${base}/listAll.jhtml#">
                                <img src="${base}/static/front/default/images/index-zd.png" srcset="${base}/static/front/default/images/index-zd.png" class="img-responsive">
                            </a>

                        </li>
                        <li class="col-xs-2">
                            <a href="${base}/listAll.jhtml#">
                                <img src="${base}/static/front/default/images/index-nk.png" srcset="${base}/static/front/default/images/index-nk.png" class="img-responsive">
                            </a>
                        </li>
                        <li class="col-xs-2">
                            <a href="${base}/listAll.jhtml">
                                <img src="${base}/static/front/default/images/index-nk.png" srcset="${base}/static/front/default/images/index-nk.png" class="img-responsive">
                            </a>
                        </li>
                    </ul>
                </div>
                <a class="carousel-control left" href="#example" data-slide="prev">Previous</a>
                <a class="carousel-control right" href="#example" data-slide="next">Next</a>
            </div>


        </div>
    </div>
</div>
<footer class="foot"></footer>
<script type="text/javascript">
    var carousels = $('.carousel');
    carousels.each(function() {
        var $obj = $(this);
        var $inner = $obj.find('.carousel-inner');

        var id = 'uuid' + new Date().getTime();
        $obj.addClass(id);

        if ($obj.data('shift') === 1) {
            var items = $obj.find('.item > [class*="col-"]'),
                    visibleCnt = $obj.find('.item:first [class*="col-"]').length,
                    wrapper = "";

            // 内置CSS样式
            var rule_base = '.carousel.' + id + ' .carousel-inner > .item',
                    styles = $('<style></style>'),
                    rules = [];
            rules[0] = rule_base + '.next {left: ' + (100 / visibleCnt) + '%; transform: none;}';
            rules[1] = rule_base + '.active {left: 0;}';
            rules[2] = rule_base + '.active.left {left: -' + (100 / visibleCnt) + '%; transform: none;}';
            rules[3] = rule_base + '.next.left {left: 0;}';
            rules[4] = rule_base + '.active.right {left: ' + (100 / visibleCnt) + '%; transform: none;}';
            rules[5] = rule_base + '.prev.right {left: 0;}';
            rules[6] = rule_base + '.prev {left: -' + (100 / visibleCnt) + '%; transform: none;}';
            for (var i = 0; i < rules.length; i++) {
                styles.append(rules[i]);
            }
            $obj.prepend(styles);

            // 重构旋转木马的HTML结构
            for (var i = 0; i < $(items).length; i++) {
                var $item = $(items[i]);
                var parent = $item.parent();
                if (parent.hasClass('item')) {
                    if (!wrapper.length) {
                        wrapper = parent.clone().removeClass('active').html('');
                    }
                    $item.unwrap();
                }

                var itemGroup = [$item];
                for (var x = 1; x < visibleCnt; x++) {
                    var a = i + x;
                    var next = $(items[a]);
                    if (!next.length) {
                        next = $(items[(a - $(items).length)]);
                    }
                    itemGroup[x] = next.clone();
                }
                var newSet = wrapper.clone().html(itemGroup);
                if (i == 0) {
                    newSet.addClass('active');
                }
                newSet.appendTo($inner);
            }
        }
    });
</script>
</body>
</html>
[/#escape]