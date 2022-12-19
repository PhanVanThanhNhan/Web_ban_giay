<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sửa Giày</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css">
<link rel="stylesheet" type="text/css"
	href="fontawesome-free/css/all.min.css">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
.navbar-nav .dropdown-menu {
	position: absolute;
}

.bg-primary {
	background: var(- -primary-color);
}

.bg-success {
	background: var(- -success-color);
}

.bg-warning {
	background: var(- -warning-color);
}

.bg-danger {
	background: var(- -danger-color);
}

* {
	box-sizing: border-box;
}

body {
	font-family: 'Roboto', sans-serif;
	background: var(- -main-bg-color);
	color: var(- -main-color);
	margin: 0;
}

.navbar {
	display: flex;
	flex-direction: row;
	background: var(- -main-bg-color);
	color: var(- -main-color);
	position: fixed;
	top: 0;
	right: 0;
	left: 0;
	z-index: 101;
	box-shadow: rgba(0, 0, 0, 0.12) 0px 1px 4px 1px;
}

.navbar-nav {
	list-style: none;
	display: flex;
	flex-direction: row;
	padding-left: 0;
	margin-bottom: 0;
	margin-top: 0;
}

.nav-link {
	float: left;
	text-align: center;
	padding: 21px 10px;
	text-decoration: none;
	font-size: 17px;
	color: var(- -second-color);
	position: relative;
}

.nav-link:hover {
	cursor: pointer;
}

.navbar-nav i {
	font-size: 1.4rem;
}

.nav-right {
	margin-left: auto;
}

.navbar-search {
	position: relative;
	margin: auto;
	width: 50%;
}

.navbar-search input {
	background: var(- -second-bg-color);
	border: none;
	padding: 12px 50px 12px 50px;
	width: 100%;
	outline: none;
	color: var(- -main-color);
	border-radius: 20px;
}

.navbar-search i {
	position: absolute;
	top: 50%;
	right: 20px;
	transform: translateY(-50%);
	color: var(- -second-color);
	cursor: pointer;
}

.avt {
	padding: 20px;
}

.dropdown {
	position: relative;
}

.dropdown:hover {
	cursor: pointer;
}

.dropdown-menu {
	list-style: none;
	display: none;
	flex-direction: column;
	position: absolute;
	right: 20%;
	top: 90%;
	background: var(- -main-bg-color);
	max-width: 300px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
	padding: unset;
	border-radius: 10px;
	border: 0.125px solid var(- -second-bg-color);
}

.dropdown-expand {
	display: flex;
}

.dropdown-menu-content {
	max-height: 500px;
	overflow-y: auto;
}

.dropdown-menu-item {
	width: 100%;
}

.dropdown-menu-item:hover {
	background-color: rgb(248, 248, 248);
}

.dropdown-menu-link {
	display: flex;
	flex-direction: row;
	align-items: center;
	text-decoration: none;
	color: var(- -main-color);
}

.dropdown-menu-link div {
	min-width: 82px;
	height: 50px;
	position: relative;
}

.dropdown-menu-link i {
	font-size: 1.25rem;
	color: var(- -second-color);
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
}

.dropdown-menu-link span {
	font-size: 15px;
	width: 298px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.dropdown-menu-link span>span {
	font-size: 10px;
}

.dropdown-menu-link:hover {
	cursor: pointer;
	background: var(- -second-bg-color);
}

.dropdown-menu-header {
	padding: 20px;
	text-align: center;
	border-bottom: 1px solid var(- -second-bg-color);
}

.dropdown-menu-footer {
	padding: 20px;
	text-align: center;
	border-top: 1px solid var(- -second-bg-color);
}

.overlay-scrollbar::-webkit-scrollbar {
	width: 9px;
	height: 9px;
}

.scrollbar-hover::-webkit-scrollbar {
	display: none;
}

.scrollbar-hover:hover::-webkit-scrollbar {
	display: block;
}

.overlay-scrollbar::-webkit-scrollbar-thumb {
	background-color: rgba(0, 0, 0, 0.4);
	border-radius: 10rem;
	border: 1px solid var(- -main-bg-color);
}

.overlay-scrollbar::-webkit-scrollbar-track-piece:start {
	background: transparent;
}

.overlay-scrollbar::-webkit-scrollbar-track-piece:end {
	background: transparent;
}

.wrapper {
	padding: 10px;
	margin-left: 82px;
	padding-top: 75px;
	background: var(- -second-bg-color);
	transition: margin-left .5s;
}

.sidebar {
	width: 82px;
	height: 100vh;
	position: fixed;
	margin-top: 85px;
	background: var(- -main-bg-color);
	box-shadow: rgba(0, 0, 0, 0.12) 0px 1px 4px 1px;
	overflow: hidden;
	z-index: 100;
	transition: width .5s;
}

.sidebar:hover {
	width: 250px;
}

.sidebar-nav {
	list-style: none;
	padding: 0;
	margin: 0;
	display: flex;
	flex-direction: column;
	align-items: center;
	height: 100vh;
}

.sidebar-nav-item {
	width: 100%;
}

.sidebar-nav-item:hover {
	background-color: rgb(248, 248, 248);
}

.sidebar-nav-link {
	display: flex;
	align-items: center;
	color: var(- -main-color);
	text-decoration: none;
}

.sidebar-nav-link i {
	font-size: 1.5rem;
	color: var(- -second-color);
	position: absolute;
	left: 50%;
	top: 50%;
	transform: translate(-50%, -50%);
}

.sidebar-nav-link div {
	min-width: 82px;
	height: 50px;
	position: relative;
}

.sidebar-nav-link:hover {
	background: var(- -second-bg-color);
}

a:hover {
	text-decoration: none;
}

.sidebar-nav-link.active {
	background: var(- -second-bg-color);
	color: var(- -danger-color);
}

.sidebar-nav-link.active div {
	border-left: 5px solid var(- -danger-color);
}

.sidebar-nav-link.active i {
	color: var(- -danger-color);
	margin-left: -5px;
}

.sidebar-expand .sidebar {
	width: 250px;
}

.sidebar-expand .wrapper {
	margin-left: 250px;
}

.row {
	display: flex;
	flex-wrap: wrap;
	flex-direction: row;
}

.row:after, .row:before {
	box-sizing: border-box;
}

[class*="col-"] {
	padding: 10px;
}

/* .. */
button.btn_login, button.btn_signin {
	background-color: transparent;
	border: none;
	text-transform: uppercase;
	font-weight: 600;
	font-size: 16px;
	cursor: pointer;
}

button.btn_login:hover, button.btn_signin:hover {
	color: #55ad39;
	font-weight: 700;
	transition: .35s;
}

.center {
	position: fixed;
	width: 100%;
	height: 100%;
	top: 0;
	right: 0;
	left: 0;
	bottom: 0;
	background-color: rgba(0, 0, 0, 0.4);
	display: none;
	justify-content: center;
	align-items: center;
	z-index: 1000;
}

.open {
	display: flex;
}

.ctn {
	width: 380px;
	background: white;
	box-shadow: 10px 10px 15px rgba(0, 0, 0, 0.05);
	animation: modelFadeIn ease 0.4s;
	height: 400px;
}

.ctn h1 {
	text-align: center;
	padding: 20px 0;
	border-bottom: 1px solid silver;
}

.ctn form {
	padding: 0 40px;
	box-sizing: border-box;
}

.ctn form .txt_field {
	position: relative;
	border-bottom: 2px solid #adadad;
	margin: 30px 30px 30px 0;
}

.ctn .txt_field input {
	width: 70%;
	padding: 0 5px;
	height: 40px;
	font-size: 16px;
	border: none;
	background: none;
	outline: none;
}

.ctn .txt_field label {
	position: absolute;
	top: 50%;
	left: 5px;
	color: #adadad;
	transform: translateY(-50%);
	font-size: 16px;
	pointer-events: none;
	transition: .5s;
}

.ctn .txt_field span::before {
	content: '';
	position: absolute;
	top: 40px;
	left: 0;
	width: 0%;
	height: 2px;
	background: #55ad39;
	transition: .5s;
}

.ctn .txt_field input:focus ~ label, .txt_field input:valid ~ label {
	top: -4px;
	color: #55ad39;
}

.ctn .txt_field input:focus ~ span::before, .txt_field input:valid ~
	span::before {
	width: 100%;
}

.ctn .pass {
	margin: -5px 0 20px 5px;
	color: #a6a6a6;
	cursor: pointer;
}

.ctn .pass:hover {
	text-decoration: underline;
}

.ctn input[type="submit"] {
	width: 100%;
	height: 50px;
	border: 1px solid;
	background: #55ad39;
	border-radius: 25px;
	font-size: 18px;
	color: #e9f4fb;
	font-weight: 700;
	cursor: pointer;
	outline: none;
}

.ctn input[type="submit"]:hover {
	border-color: #55ad39;
	transform: scale(1.1);
	transition: .5s;
}

.signup_link, .login_link {
	margin: 30px 0;
	text-align: center;
	font-size: 16px;
	color: #666666;
}

.signup_link a, .login_link a {
	color: #2691d9;
	text-decoration: none;
}

.signup_link a:hover, . login_link a:hover {
	text-decoration: underline;
}

button.btn_login, button.btn_signin {
	background-color: transparent;
	border: none;
	text-transform: uppercase;
	font-weight: 600;
	font-size: 16px;
	cursor: pointer;
}

button.btn_login:hover, button.btn_signin:hover {
	color: #55ad39;
	font-weight: 700;
	transition: .35s;
}

th {
	border-bottom: 1px solid #909eff;
}

tr:nth-child(even) {
	background-color: #dddddd;
}

@
keyframes modelFadeIn {from { opacity:0;
	transform: translateY(-140px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

to {
	opacity: 1;
	transform: translateY(0);
}

to {
	opacity: 1;
	transform: translateY(0);
}

to {
	opacity: 1;
	transform: translateY(0);
}

to {
	opacity: 1;
	transform: translateY(0);
}

to {
	opacity: 1;
	transform: translateY(0);
}

/*****************/
.add-form {
	position: absolute;
	top: 5em;
	right: 50%;
}

.button-add {
	margin-left: 72px;
	margin-right: 20px;
}

.modal-dialog {
	
}
</style>
</head>
<body class="overlay-scrollbar">
	<input type="hidden" id="status" value="${status}">
	<!-- navbar -->
	<div class="navbar">
		<!-- nav left -->
		<ul class="navbar-nav">
			<li class="nav-item"><a class="nav-link"> <i
					class="fa fa-bars" onclick="collapseSidebar()"></i>
			</a></li>
		</ul>
		<!-- end nav left -->
		<!-- form -->
		<form class="navbar-search">
			<input type="text" name="Search" class="navbar-search-input"
				placeholder="What you looking for..."> <i
				class="fa fa-search"></i>
		</form>
		<!-- end form -->
		<!-- nav right -->
		<c:if test="${admin==null }">
			<div class="navbar-nav nav-right">
				<a href="#" class="btn_login"
					style="margin: 20px 20px 0 0; text-decoration: none">Đăng nhập</a>
			</div>
		</c:if>
		<c:if test="${admin!=null }">
			<ul class="navbar-nav nav-right">
				<li class="nav-item avt-wrapper">
					<div class="avt dropdown">
						<b class="dropdown-toggle " data-toggle="user-menu">Xin chào <c:out
								value="${admin.getTenDangNhap() }"></c:out></b>
						<ul id="user-menu" class="dropdown-menu">
							<li class="dropdown-menu-item"><a class="dropdown-menu-link">
									<div>
										<i class="fa fa-user-circle"></i>
									</div> <span>Profile</span>
							</a></li>
							<li class="dropdown-menu-item"><a href="adminlogout"
								class="dropdown-menu-link">
									<div>
										<i class="fa fa-sign-out"></i>
									</div> <span>Logout</span>
							</a></li>
						</ul>
					</div>
				</li>
			</ul>
		</c:if>
		<!-- end nav right -->
	</div>
	<!-- end navbar -->
	<!-- sidebar -->
	<div class="sidebar">
		<ul class="sidebar-nav">
			<li class="sidebar-nav-item" style="margin-top: 30px;"><a
				href="adminController" class="sidebar-nav-link">
					<div>
						<i class=""></i>
					</div> <span> Trang chủ </span>
			</a></li>
			<li class="sidebar-nav-item"><a href="adminXacNhanController"
				class="sidebar-nav-link">
					<div>
						<i class=""></i>
					</div> <span>Duyệt đơn</span>
			</a></li>
			<li class="sidebar-nav-item"><a href="adminDondaDuyetController"
				class="sidebar-nav-link">
					<div>
						<i class=""></i>
					</div> <span>Đơn đã duyệt</span>
			</a></li>
			<li class="sidebar-nav-item"><a href="adminLoaiController"
				class="sidebar-nav-link">
					<div>
						<i class="adminLoaiController"></i>
					</div> <span>Quản lý loại giày</span>
			</a></li>
			<li class="sidebar-nav-item"><a href="adminGiayController"
				class="sidebar-nav-link">
					<div>
						<i class="adminGiayController"></i>
					</div> <span>Quản lý giày</span>
			</a></li>
		</ul>
	</div>
	<!-- end sidebar -->
	<!-- main content -->
	<c:if test="${admin!=null }">
		<h2
			style="top: 5em; position: relative; left: 12em; border-bottom: 1px solid #ff0000;">Sửa
			giày</h2>
		<c:forEach items="${listGiay }" var="h">
			<div id="editSach">
				<div class="modal-dialog" style="top: 10em; right: 4em;">
					<div class="modal-content">
						<form action="editGiayController" method="post"
							enctype="multipart/form-data">
							<div class="modal-body">
								<div class="form-group">
									<label>Mã giày</label> <input value="${h.magiay }"
										name="ma-giay" type="text" class="form-control" required>
								</div>
								<div class="form-group">
									<label>Loại</label> <select name="loai-giay"
										class="form-select" aria-label="Default select example">

										<c:forEach items="${listLoai }" var="o">

											<option ${h.maloai == o.maloai?"selected":"" }
												value="${o.maloai }">${o.tenloai }</option>
										</c:forEach>
									</select>
								</div>
								<div class="form-group">
									<label>Ảnh</label> <input name="san-pham" value="${anhcu }"
										type="file" size="60" class="form-control" required>
								</div>
								<div class="form-group">
									<label>Tên giày</label> <input value="${h.tengiay }"
										name="ten-giay" type="text" class="form-control" required>
								</div>
								<div class="form-group">
									<label>Đơn giá</label> <input value="${h.gia }" name="don-gia"
										type="number" class="form-control" required>
								</div>
								<div class="form-group">
									<label>Số lượng</label> <input value="${h.soluong }"
										name="so-luong" type="number" class="form-control" required>
								</div>
								<div class="form-group">
									<label>Ngày nhập</label> <input value="${h.ngayNhap }"
										name="ngay-nhap" type="date" class="form-control" required>
								</div>


							</div>
							<div class="modal-footer">
								<input type="submit" class="btn btn-default"
									data-dismiss="modal" value="Cancel" name="Huy"
									onclick="location.href='adminGiayController'"> <input
									type="submit" class="btn btn-success" value="Thay đổi">
							</div>
						</form>
					</div>
				</div>
			</div>
		</c:forEach>
	</c:if>

	<!-- end main content -->
	<!----------------- MODAL ĐĂNG NHẬP ----------------->
	<div class="center js_login">
		<div class="ctn js_model_login">
			<h1 style="color: #55ad39; user-select: none;">LOGIN</h1>
			<form action="adminktdnController" method="post">
				<div class="txt_field">
					<input type="text" name="txtun" value="" required> <span></span>
					<label>Username</label>
				</div>
				<div class="txt_field">
					<input type="password" name="txtpass" value="" required> <span></span>
					<label>Password</label>
				</div>
				<div class="pass" style="user-select: none;">Forgot Password?</div>
				<input type="submit" value="Login">

			</form>
		</div>
	</div>
	<!-- import script -->
	<script>
		const body = document.getElementsByTagName('body')[0]

		function collapseSidebar() {
			body.classList.toggle('sidebar-expand')
		}

		window.onclick = function(event) {
			openCloseDropdown(event)
		}

		function closeAllDropdown() {
			var dropdowns = document.getElementsByClassName('dropdown-expand')
			for (var i = 0; i < dropdowns.length; i++) {
				dropdowns[i].classList.remove('dropdown-expand')
			}
		}

		function openCloseDropdown(event) {
			if (!event.target.matches('.dropdown-toggle')) {
				// 
				// Close dropdown when click out of dropdown menu
				// 
				closeAllDropdown()
			} else {
				var toggle = event.target.dataset.toggle
				var content = document.getElementById(toggle)
				if (content.classList.contains('dropdown-expand')) {
					closeAllDropdown()
				} else {
					closeAllDropdown()
					content.classList.add('dropdown-expand')
				}
			}
		}

		const btnlogin = document.querySelector('.btn_login')
		const centers = document.querySelector('.js_login')
		const centerCtn = document.querySelector('.js_model_login')
		function showLogin() {
			centers.classList.add('open')
		}
		function hideLogin() {
			centers.classList.remove('open')
		}
		btnlogin.addEventListener('click', showLogin)
		centers.addEventListener('click', hideLogin)
		centerCtn.addEventListener('click', function(event) {
			event.stopPropagation()
		})

		var status = document.getElementById("status").value;
		if (status == "failed") {
			swal("Lỗi", "Sai Tên Đăng Nhập Hoặc Mật Khẩu", "error");
			centers.classList.add('open')
		}
	</script>
	<!-- end import script -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		
	</script>
</body>
</html>