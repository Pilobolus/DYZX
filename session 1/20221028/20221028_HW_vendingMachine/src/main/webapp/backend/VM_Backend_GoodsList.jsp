<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Language" content="zh-tw">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>販賣機-後臺</title>
	<script src="../js/jquery.min.js"></script>
	
	<script type="text/javascript">
		$(document).ready(startup);

		function startup(){
			$("#searchBtn").click(searchBtnClicked);
		}

		function searchBtnClicked(){
			if($("#nameKey").val() == ''){
				alert("請輸入搜尋條件");
				return false;
			}
			return true;
		}
	</script>
</head>
<body>
	
	<h1>Vending Machine Backend Service</h1><br/>		
	<table border="1" style="border-collapse:collapse;margin-left:25px;">
		<tr>
			<td width="200" height="50" align="center">
				<a href="../nav?destination=goods_list">商品列表</a>
			</td>
			<td width="200" height="50" align="center">
				<a href="../nav?destination=modify">商品維護作業</a>
			</td>
			<td width="200" height="50" align="center">
				<a href="../nav?destination=create">商品新增上架</a>
			</td>
			<td width="200" height="50" align="center">
				<a href="../nav?destination=order">銷售報表</a>
			</td>
			<td width="200" height="50" align="center">
				<a href="../nav?destination=frontend">前台販賣機</a>
			</td>
		</tr>
	</table>
	<br/><br/><HR>

	
	<h2>商品列表</h2><br/>
	<div style="margin-left:25px;">
		<table>
			<tr>
				<td colspan="2">
					<form action="searchDrink">
						名稱搜尋&nbsp;<input type="text" size="10" name="nameKey" id="nameKey" />
						<button type="submit" style="margin-left:25px; width:50px;height:32px" id="searchBtn">搜尋</button>
					</form>
					<br/>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<table border="1">
						<thead>
							<tr height="50">
								<th width="70">商品編號</th>
								<th width="150">商品名稱</th> 
								<th width="100">商品價格</th>
								<th width="100">現有庫存</th>
								<th width="100">商品狀態</th>
							</tr>
						</thead>
						<tbody align="center">

				
							<c:forEach var="drink" items="${drinkList }">
								<tr height="30">
									<td>${drink.id }</td>
									<td>${drink.name }</td> 
									<td>${drink.price }</td>
									<td>${drink.quantity }</td>

									<td>
										<c:choose>
											<c:when test="${drink.status == \"1\" }">上架</c:when>
											<c:otherwise>下架</c:otherwise>
										</c:choose>
									</td>
						
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<br/>
					<c:if test="${pageId>1 }">
						<a href="goodsList?pageId=${pageId-1 }">上一頁</a>
					</c:if>
		
		
					<c:forEach var="i" begin="${basePage+1 }" end="${((basePage+3)<groupSize) ? (basePage+3) : groupSize }">
						<a href="goodsList?pageId=${i }">${i }</a>
					</c:forEach>
		

					<c:if test="${pageId<groupSize }">
						<a href="goodsList?pageId=${pageId+1 }">下一頁</a>
					</c:if>
				
				</td>
				<td align="right">
					<br/>
					<button type="submit" onclick="return location.replace('../nav?destination=goods_list');">All Drinks</button>
				</td>
			</tr>
		</table>

		

	</div>
</body>
</html>