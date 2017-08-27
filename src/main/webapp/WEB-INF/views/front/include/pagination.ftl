[#escape x as x?html]
<div class="articleList-module-paging">
    [#if totalPages > 1]
        <nav aria-label="Page navigation">
            <ul class="pagination">
                [#if isFirst]
                    <li class="disabled">
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">首页</span>
                        </a>
                    </li>
                [#else]
                    <li>
                        <a href="?pageNumber=${firstPageNumber}" aria-label="Previous">
                            <span aria-hidden="true">首页</span>
                        </a>
                    </li>
                [/#if]
                [#if hasPrevious]
                    <li><a href="?pageNumber=${previousPageNumber}">上一页</a></li>
                [#else]
                    <li class="disabled"><a href="#">上一页</a></li>
                [/#if]
                [#list segment as segmentPageNumber]
                    [#if segmentPageNumber_index == 0 && segmentPageNumber > firstPageNumber + 1]
                        <span class="pageBreak">...</span>
                    [/#if]
                    [#if segmentPageNumber != pageNumber]
                        <li><a href="?pageNumber=${segmentPageNumber}">${segmentPageNumber}</a></li>
                    [#else]
                        <li class="active"><span>${segmentPageNumber} <span class="sr-only">(current)</span></span></li>
                    [/#if]
                    [#if !segmentPageNumber_has_next && segmentPageNumber < lastPageNumber - 1]
                        <span class="pageBreak">...</span>
                    [/#if]
                [/#list]
                [#if hasNext]
                    <li><a href="?pageNumber=${nextPageNumber}">下一页</a></li>
                [#else]
                    <li class="disabled"><a href="#">下一页</a></li>
                [/#if]
                [#if isLast]
                    <li class="disabled">
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">末页</span>
                        </a>
                    </li>
                [#else]
                    <li>
                        <a href="?pageNumber=${lastPageNumber}" aria-label="Next">
                            <span aria-hidden="true">末页</span>
                        </a>
                    </li>
                [/#if]
            </ul>
        </nav>
    [/#if]
</div>
[/#escape]