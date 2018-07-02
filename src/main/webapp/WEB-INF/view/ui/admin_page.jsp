<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:if test="${pageInfo.getPages() > 1}">
    <ul class="pagination pagination-sm no-margin pull-right">
        <li><a href="?pageNum=1">首页</a></li>

        <c:choose>
            <c:when test="${pageInfo.isHasPreviousPage() == true}">
                <li><a href="?pageNum=${pageInfo.getPrePage()}">上一页</a></li>
            </c:when>
            <c:otherwise>
                <li class="disabled"><a href="#">上一页</a></li>
            </c:otherwise>
        </c:choose>

        <c:forEach var="page" begin="1" end="${pageInfo.getPages()}" step="1">
            <c:choose>
                <c:when test="${pageInfo.getPageNum() == page}">
                    <li class="active"><a href="#">${page}</a></li>
                </c:when>
                <c:otherwise>
                    <li><a href="?pageNum=${page}">${page}</a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:choose>
            <c:when test="${pageInfo.isHasNextPage() == true}">
                <li><a href="?pageNum=${pageInfo.getNextPage()}">下一页</a></li>
            </c:when>
            <c:otherwise>
                <li class="disabled"><a href="#">下一页</a></li>
            </c:otherwise>
        </c:choose>

        <li><a href="?pageNum=${pageInfo.getPages()}">尾页</a></li>
    </ul>
</c:if>