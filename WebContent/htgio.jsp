<%@page import="bean.giohangbean"%>
<%@page import="bo.giohangbo"%>
<%@page import="bo.loaibo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.loaibean"%>
<%@page import="dao.loaidao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Giỏ Hàng</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	transition: all .2s linear;
	font-family: sans-serif;
	box-sizing: border-box;
}

.navbar {
	background: rgba(0, 0, 0, 0.9);
	height: 80px;
	position: fixed;
	z-index: 1000;
	top: 0;
	left: 0;
	right: 0;
	border-radius: 0;
	border: 0;
	margin: 0;
	alight-items: center;
	justify-content: space-between;
	text-align: center;
}

.container-fluid {
	display: flex;
	align-items: center;
	text-align: center;
}

.navbar-inverse .container-fluid>.navbar-brand>.active>a {
	color: #fff;
	background-color: #10E8E8;
}

.container-fluid a {
	color: #9d9d9d !important;
}

.container-fluid a:hover {
	color: #337ab7 !important;
	background: #000 !important;
}

.form-control {
	width: 180px;
	margin: 10px auto 0;
	margin-left: 9em !important;
}
.navbar-inverse .navbar-nav>li>a{
	margin-left:2em;
}
.navbar-header {
	margin-left: 12em !important;
	nargin-right: 12em !important;
}

.search-button {
	background-color: red !important;
	margin-left: 10px !important;
	width: 80px !important;
}

input[type=submit] {
	background-color: orangered;
	color: white;
	margin: 11px auto;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit]:hover {
	opacity: 0.8;
}

table {
	margin-top: 50px;
}

.btn-primary {
	border: none;
	background-color: red;
	padding: 6px 8px;
	margin: auto;
	border-radius: 5px;
	width: 130px;
}

.book {
	display: inherit;
	background-color: #cbcbcb;
	border-radius: 20px;
	padding: 20px;
	cursor: pointer;
}

.book-img {
	width: 234px;
	height: 264px;
	border-radius: 10px;
	transform: scale(1.1);
}

.list-items {
	display: block;
	width: 100%;
	height: 40px;
	padding: 8px 10px;
	border: 1px solid #ccc;
	color: #000;
}

.list-items:hover {
	text-decoration: none;
	background-color: #10E8E8;
	color: #fff;
	font-weight: 600;
}

.image:hover {
	transform: scale(1.1);
}
</style>

</head>
<body>

	<!----------------------------- NAV BAR ----------------------------->
	<nav class="navbar navbar-inverse"
		style="display: flex; color: #10E8E8; position: absolute;">
		<div class="container-fluid">
			<ul class="nav navbar-nav navbar-left">
				<%
				if (session.getAttribute("DangNhap") == null) {
				%>
				<ul class="nav navbar-nav ">
					<li><a href="dangnhap.jsp"><span class=""></span>ĐĂNG NHẬP</a></li>
					<li class="js-login"><a href="#"><span></span>ĐĂNG
							KÝ</a></li>
				</ul>
				<%
				} else {
				%>
				<ul style="margin-left: 130px;" class="nav navbar-nav navbar-right">
					<li><a href="logoutController"><span
							class=""></span> ĐĂNG XUẤT</a></li>
					<li><a><span>Xin chào, <%=session.getAttribute("DangNhap")%>!
						</span></a></li>
				</ul>
				<%
				}
				%>
			</ul>

			<div class="navbar-header">
				<a class="navbar-brand homepage" href="htgiayController">Trang
					chủ</a>
			</div>
			<ul class="nav navbar-nav">
				<li><a href="#">Thanh toán</a></li>
				<li><a href="#">Lịch sử mua hàng</a></li>
				<form
					style="display: flex; text-align: center; justify-content: space-between;"
					action="htgiayController" method="get">
					<input class="form-control" type="text" name="txttk"
						placeholder="Tìm kiếm..."> <input
						class="btn-primary search-button" type="submit" value="Tìm kiếm">
				</form>
			</ul>


		</div>
	</nav>

	<table align="center" class="table">
		<td valign="top" width="60%">
			<form action="giohangController" method="GET" id="my_form"></form>
			<table class="table table-hover">
				<thead>
					<tr>
						<th style="width: 5%">STT</th>
						<th style="width: 15%">Sản phẩm</th>
						<th style="width: 24%">Tên giày</th>
						<th style="width: 10%">Đơn giá</th>
						<th style="width: 10%">Số lượng</th>
						<th style="width: 10%">Số tiền</th>
						<th style="width: 20%">Thao tác</th>
						<th style="width: 5%"><input type="submit" form="my_form"
							class="btn" value="xoá" name="btn-cb-del"></th>
					</tr>
				</thead>

				<tbody>
					<%
					int i = 0;
					giohangbo gh = (giohangbo) session.getAttribute("gio");
					if (gh != null)
						for (giohangbean h : gh.ds) {
							i = i + 1;
					%>
					<tr>

						<td data-th="STT">
							<h4><%=i%></h4>
						</td>
						<td data-th="Sản phẩm">
							<div class="row">
								<img src="<%=h.getAnh()%>" alt=""
									class="img-fluid image d-md-block rounded mb-2 shadow "
									style="width: 90px; margin-left: 15px">
							</div>
						</td>
						<td data-th="Tên sách">
							<h4 style="margin-top: 30px"><%=h.getTengiay()%></h4>
						</td>
						<td data-th="Đơn giá">
							<h4 style="margin-top: 30px"><%=h.getGia()%>€
							</h4>
						</td>

						<td data-th="Số lượng"><input type="number"
							class="form-control form-control-lg text-center"
							style="margin-top: 20px" id=<%=h.getMagiay()%>
							value=<%=h.getSoluong()%>></td>
						<td data-th="Đơn giá">
							<h4 style="color: #ee4d2d;"><%=(h.getGia() * h.getSoluong()) / 25000%>$
							</h4>
						</td>
						<td class="actions" data-th="Thao tác">
							<div style="">
								<a href="#"
									onclick="location.href='giohangController?hd=update&soluong='+document.getElementById('<%=h.getMagiay()%>').value+'&ms=<%=h.getMagiay()%>'"
									style="padding-right: 10px"> Cập nhật</a> | <a
									href="giohangController?hd=remove&ms=<%=h.getMagiay()%>"
									style="padding-left: 5px"> Trả lại</a>

							</div>
						</td>
						<td><input type="checkbox" form="my_form"
							style="margin-top: 30px" class="Check-box" name="cb-del"
							value=<%=h.getMagiay()%>></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<div class="float-right text-right">
				<%
				if (gh != null) {
				%>
				<h4>
					<b>(Sản phẩm: </b><b style="color: #ee4d2d"><%=i%></b><b> )</b>
				</h4>
				<h2>
					<b>Tổng tiền:</b> <b style="color: #ee4d2d"><%=gh.TongTien() / 25000%>$<b>
				</h2>
				<%
				}
				%>
			</div>
			<div class="row mt-4 d-flex align-items-center">
				<div style="display: flex; padding: 10px 50px 10px 250px;">
					<a class="btn btn-primary" href="htgiayController"> Tiếp tục
						mua hàng</a>
					<%
					if (gh != null) {
					%>
					<a class="btn btn-primary" href="giohangController?hd=removeAll">
						Trả lại tất cả</a> <a class="btn btn-primary" href="dathangcontroller">Xác
						nhận đặt hàng</a>
					<%
					}
					%>
				</div>
			</div>
		</td>
	</table>

</body>
</html>