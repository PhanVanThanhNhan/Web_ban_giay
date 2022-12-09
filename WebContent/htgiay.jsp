<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="bo.giaybo"%>
<%@page import="bo.loaibo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.giaybean"%>
<%@page import="dao.giaydao"%>
<%@page import="bean.loaibean"%>
<%@page import="dao.loaidao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link type="image/png" sizes="16x16" rel="icon"
	href="image_sach/icons8-book-16.png">
<title>Trang chủ</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://kit.fontawesome.com/yourcode.js"
	crossorigin="anonymous"></script>

<link rel="stylesheet" href="style.css">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

html {
	font-family: sans-serif;
}

body {
	width: 100%;
	background-color: #fff;
}

.log {
	color: rgb(220, 220, 220);
	display: flex;
}

.header {
	display: flex;
	width: 100%;
	height: 80px;
	background-color: rgba(0, 0, 0, 0.9);;
	position: fixed;
	z-index: 30;
	top: 0;
	color: #fff;
	width: 100%;
}

.left {
	float: left;
}

.right {
	float: right;
}

.header_ctn {
	display: flex;
	height: 100%;
}

.list-items {
	margin: 10px auto;
	text-align: center;
	list-style-type: none;
	text-decoration: none;
}

.navlist {
	text-align: center;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.img {
	max-width: 200px;
	max-height: 200px;
}

li {
	font: 14px;
	list-style: none;
	margin: 10px;
}

.content {
	display: flex;
}

.cate_container {
	width: 20%;
	margin: 80px 2%;
	min-height: 172vh;
	text-align: center;
}

.main_content {
	width: 80%;
	margin: 60px auto;
	display: flex;
}

a:hover {
	text-decoration: none;
}

.search-icon:hover .form_search {
	display: flex;
	z-index: 30;
}

.search-icon {
	margin: 3em 0px 2em 10em;
	cursor: pointer;
}

.search-icon:hover {
	color: #337ab7;
}

.search-icon-drop {
	border: none;
	background-color: red;
	color: #fff;
	margin: 0 2px;
	padding: 1px 5px;
}

.input-form {
	padding: 2px 0;
}

.form_search {
	font-family: sans-serif;
	top: 3em;
	right: 20em;
	position: absolute;
	padding: 14px 3px;
	background-color: rgb(251, 251, 251);
	border: 1px solid #000;
	border-radius: 6px;
	display: none;
}

.list {
	display: flex;
	flex-wrap: wrap;
}

.list_nav {
	text-transform: uppercase;
	text-decoration: none;
	font-weight: 700;
	transition: .35s;
	color: #fff;
}

.list_nav:hover {
	color: #337ab7;
}

.cate-container>li {
	box-shadow: 10px 10px 15px rgb(0 0 0/ 5%);
}

.giay-name {
	height: 99px;
	padding: 2px;
}

.active {
	color: #337ab7;
}

li.list_book.ls {
	margin: 0;
	padding: 2px 0 0 15px;
	height: 30px;
}

.loai {
	text-decoration: none;
	font-size: 13px;
	color: #000;
	display: block;
}

.ctn {
	position: relative;
	max-width: 200px;
	background: white;
	box-shadow: 10px 10px 15px rgba(0, 0, 0, 0.05);
	margin: 20px;
	padding-top: 0.7em;
	padding-bottom: 1.4em;
}

a {
	text-decoration: none;
}

.ctn:hover .buy-btn {
	display: inline-block;
}

.buy-btn {
	transform: scale(1);
	-webkit-transition: .3s ease;
	transition: .3s ease;
	cursor: pointer;
	display: none;
	top: 5.5em;
	left: 2.2em;
	position: absolute;
	border-radius: 5px;
	/* width: 100px; */
	text-align: center;
	align-items: center;
	background-color: red;
	color: #fff;
	transition: .3s ease;
}

.ctn .img .giay-img {
	display: block;
	width: 200px;
	height: 100%;
}

.price {
	color: #c30005;
}

footer .footer-title {
	display: flex;
	color: red;
}

footer .footer-title .footer-intro {
	margin-left: 22em;
	margin-right: 34em;
	border-bottom: 2px solid red;
}

footer .footer-title .footer-social {
	margin-right: 32em;
	border-bottom: 2px solid red;
}

.footer {
	background-color: rgb(23, 23, 23);
	color: #fff;
	align-items: center;
	text-align: center;
}

.footer-content {
	display: flex;
	text-align: center;
	align-items: center;
	justify-content: space-between;
	padding-top: 2em;
}

footer .footer-content .intro {
	max-width: 20%;
	margin-left: 15em;
}

footer .footer-content .social {
	display: block;
	margin-right: 30em;
}

footer .footer-content .social .social-icon {
	margin-right: 5px;
}

footer .license {
	font-family: sans-serif;
	padding: 2em 0;
}

/* ********************MODAL  LOGIN**************************** */
.Loginbtn {
	background-color: #337ab7 !important;
	width: 7.5em;
	border-radius: 6px;
	border: none;
	padding: 0.1em 0;
	margin-bottom: 0.5em;
	border-color: rgba(0, 0, 0, 0.05);
	height: 2.5em;
}

.to-signup-btn {
	background-color: none;
}

p:hover {
	text-decoration: underline;
}

.model {
	font-family: "Roboto", sans-serif;
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background: rgba(189, 173, 172, 0.4);
	display: none;
	align-items: center;
	justify-content: center;
}

.model.open {
	display: flex;
}

.model-container {
	background: #fff;
	width: 29em;
	text-align: center;
	height: 22em;
	max-width: calc(100% - 32px);
	position: relative;
	border-radius: 5px;
	animation: modelFadeIn ease 0.4s;
}

.model .model-container h1 {
	margin-top: 0.5em;
}

.model-header {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100px;
}

.model .model-container .inp {
	width: 17em;
	margin: 1em 0;
	height: 2.5em;
	border: 2px solid #ddd;
	position: relative;
}

.model-header h1 {
	color: white;
}

.model-close i {
	color: white;
	top: 0;
	right: 0px;
	padding: 10px;
	position: absolute;
	cursor: pointer;
	opacity: 0.9;
}

.model-label {
	color: white;
	display: block;
	font-size: 15px;
	margin: 5px 0px;
}

.show-pass-icon {
	position: absolute;
	z-index: 2;
	top: 11em;
	right: 6.5em;
	cursor: pointer;
}

.model-btn {
	display: block;
	width: 100%;
	color: #fff;
	font-size: 15px;
	padding: 8px 0px;
	background-color: #059669;
	border: none;
	border-radius: 5px;
	margin: 50px 0 10px 0;
}

@keyframes modelFadeIn {from { opacity:0;
	transform: translateY(-140px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
/* MODAL SIGN UP */
.model-signup {
	font-family: "Roboto", sans-serif;
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background: rgba(189, 173, 172, 0.4);
	display: none;
	align-items: center;
	justify-content: center;
}
.show-pass-icon-signup{
	position: absolute;
	z-index: 2;
	top: 15.5em;
	right: 5em;
	cursor: pointer;
}
.model-signup.open {
	display: flex;
}

.model-container-signup {
	background: #fff;
	width: 26em;
	text-align: center;
	height: 36em;
	max-width: calc(100% - 32px);
	position: relative;
	border-radius: 5px;
	animation: modelFadeIn ease 0.4s;
}

.model-signup .model-container-signup h1 {
	margin-top: 0.5em;
}

.model-header-signup {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100px;
}

.model-signup .model-container-signup .inp {
	width: 17em;
	margin: 1em 0;
	height: 2.5em;
	border: 2px solid #ddd;
	position: relative;
}
</style>
</head>
<body>

	<!----------------------------- HEADER ----------------------------->
	<div class="header">
		<div class="header_ctn">
			<ul class="navlist">
				<c:if test="${DangNhap==null }">
					<li><a class="list_nav log js-login" style="margin-left: 50px"
						href="#">ĐĂNG NHẬP</a></li> /
				<li><a class="list_nav log js-signup" href="#">ĐĂNG KÝ</a></li>
				</c:if>

				<c:if test="${DangNhap != null }">

					<div class="log">
						<li class="login" style="cursor: pointer;"><a
							style="color: #fff; user-select: none; cursor: default;">Xin
								chào, <c:out value="${DangNhap}" />!
						</a></li>
						<li class="signin"><a href="logoutController"
							class="list_nav">Đăng xuất</a></li>
					</div>
				</c:if>
				<li><a class="list_nav active" style="margin-left: 15em;"
					href="htgiayController">Trang chủ</a></li>

				<li><a class="list_nav " style="margin: 2em"
					href="lichsucontroller?mkh=${makh }">Lịch sử mua hàng</a></li>

				<li><a class="list_nav " href="lichsucontroller?mkh=${makh }">Thanh
						toán</a></li>

				<ul class="fa fa-search search-icon">
					<li class="search_dropdown"><form class="form_search"
							action="htgiayController">
							<input class="input-form" type="text" name="txttk"
								placeholder="Tìm kiếm...">
							<button type="submit" class="fa fa-search search-icon-drop"></button>
						</form></li>
				</ul>
				<li><a class="list_nav right" style="margin-left: 1em;"
					href="htgioController">Giỏ hàng</a></li>
			</ul>

		</div>


	</div>

	<!----------------------------- CATEGORIES ----------------------------->
	<div class="content">
		<div valign="top" class="cate_container">
			<h2 class="text-center" style="color: #337ab7; margin: 10px auto">Categories</h2>
			<%
			if (request.getAttribute("dsloai") != null) {
				ArrayList<loaibean> dsloai = (ArrayList<loaibean>) request.getAttribute("dsloai");
				for (loaibean l : dsloai) {
			%>
			<li><a class="list-items"
				href="htgiayController?ml=<%=l.getMaloai()%>"> <%=l.getHanggiay()%></a></li>
			<%
			}
			}
			%>
		</div>

		<!-- ---------------------------HIỂN THỊ GIÀY--------------------------- -->
		<div class="main_content" align="center">

			<div class="list">
				<%
				if (request.getAttribute("dsgiay") != null) {
					ArrayList<giaybean> dsgiay = (ArrayList<giaybean>) request.getAttribute("dsgiay");
					for (giaybean s : dsgiay) {
				%>
				<div class="ctn">
					<div class="img">
						<img src="<%=s.getAnh()%>" alt="avatar" class="giay-img" />
					</div>
					<h3 class="giay-name"><%=s.getTengiay()%></h3>
					<br>
					<div class="price-buy">
						price:
						<div class=" price"><%=s.getGia() / 25000%>$
						</div>
						<a
							href="giohangController?hd=add&ms=<%=s.getMagiay()%>&ts=<%=s.getTengiay()%>&gia=<%=s.getGia()%>&anh=<%=s.getAnh()%>">
							<div class="btn btn-primary buy-btn">Thêm vào giỏ</div>
						</a>
					</div>
				</div>

				<%
				}
				}
				%>
			</div>
		</div>
	</div>


	<footer class="footer">
		<ul class="footer-title">
			<li class="footer-intro">INTRO</li>
			<li class="footer-social">SOCIAL</li>
		</ul>
		<div class="footer-content" style="display: flex">
			<div class="intro" style="display: block">‘Hãy mang những giấc
				mơ của bạn lên đôi chân để dẫn lối giấc mơ đó thành hiện thực.’ –
				Roger Vivier</div>
			<div class="social">
				<a class="social-icon fa-brands fa-facebook-f"
					href="https://www.facebook.com/PhanVanThanhNhan"></a> <a
					class="social-icon fa-brands fa fa-twitter"></a> <a
					class="social-icon fa-brands fa fa-instagram"
					href="https://www.instagram.com/thanh_nhan_1609/"></a> <a
					class="social-icon fa-brands fa fa-github"
					href="https://github.com/PhanVanThanhNhan"></a>
			</div>
		</div>
		<div class="license">Phan Văn Thành Nhân - Mã sinh
			viên:19T1021157</div>
	</footer>

	<!----------------------------- MODEL ĐĂNG NHẬP ----------------------------->
	<input type="text" id="status" value="${status}">   
	<div class="model js-model">
		<div class="model-container js-model-container">
			<form action="dangnhapController" method="post">
				<div class="box__Login">
					<div class="box__Login--Container">
						<div>
							<h1 style="color: #337ab7">ĐĂNG NHẬP</h1>
							<input class="inp" name="txtun" type="text" value=""
								placeholder="Tài khoản"> <br> <input class="inp"
								name="txtpass" type="password" value="" placeholder="Mật khẩu"
								id="password"> <span class="fa fa-eye show-pass-icon"
								id="show_pass"></span> <br> <input class="Loginbtn"
								name="butdn" type="submit" value="Đăng nhập">
							<p>Quên mật khẩu?</p>
							<%
							if (request.getParameter("kt") != null) {
								out.print("Dang nhap sai");
							}
							%>
							Bạn chưa có tài khoản <a href=""
								class="to-signup-btn js-to-signup">đăng ký</a>

						</div>
					</div>
				</div>

			</form>
		</div>
	</div>

	<!----------------------------- MODAL ĐĂNG KÝ ----------------------------->
	<div class="model-signup js-model-signup">
		<div class="model-container-signup js-model-container-signup">
			<form action="khachhangController" method="post">
				<div class="box__Login-signup">
					<div class="box__Login--Container-signup">
						<div>
							<h1 style="color: #337ab7">ĐĂNG KÝ</h1>
							<input class="inp" name="uname" type="text" value=""
								placeholder="Họ và tên"> <br> <input class="inp"
								name="txtun" type="text" value="" placeholder="Tài khoản">
							<br> <input class="inp" name="txtpass" type="password"
								value="" placeholder="Mật khẩu" id="password_signup"> <span
								class="fa fa-eye show-pass-icon-signup" id="show_pass_signup"></span> <br>
							<input class="inp" name="phone" type="text" value=""
								placeholder="Sodt"> <br> <input class="inp"
								name="email" type="email" value="" placeholder="Email">
							<br> <input class="Loginbtn" name="butdn" type="submit"
								value="Đăng ký"><br> Bạn đã có tài khoản <a
								href="" class="to-login-btn">đăng nhập</a>

						</div>
					</div>
				</div>

			</form>
		</div>
	</div>

	<!----------------------------- SCRIPT MODAL ĐĂNG NHẬP ----------------------------->
	<script>
    const login = document.querySelector('.js-login')
    const model = document.querySelector('.js-model')
    const modelContainer = document.querySelector('.js-model-container')
    const tosignup = document.querySelector('.js-to-signup')
    
    document.getElementById('show_pass').onclick = function () {
        let password = document.getElementById('password');
        password.type = password.type == 'password' ? 'text' : 'password';
    }

    function showLogin() {
        model.classList.add('open')
    }
    function hideLogin() {
        model.classList.remove('open')
    }
    function showSignUPInLogin() {
        modelSignUp.classList.add('open')
        model.classList.remove('open')
    }
    tosignup.addEventListener('click', (event)=> {
        event.preventDefault();
        showSignUPInLogin();
    })
    login.addEventListener('click', showLogin)
    model.addEventListener('click', hideLogin)
    modelContainer.addEventListener('click', function (event) {
        event.stopPropagation()
    })
	</script>
	<script>
		/* SCRIPT MODAL ĐĂNG KÝ */
	const signup = document.querySelector('.js-signup')
    const modelSignUp = document.querySelector('.js-model-signup')
    const modelSignUpContainer = document.querySelector('.js-model-container-signup')
    const changetologin = document.querySelector('.to-login-btn')

	 document.getElementById('show_pass_signup').onclick = function () {
        let password = document.getElementById('password_signup');
        password.type = password.type == 'password' ? 'text' : 'password';
    }
    function showSignUp() {
        modelSignUp.classList.add('open')
    }
    function hideSignUp() {
        modelSignUp.classList.remove('open')
    }
    function showLoginInRegister() {
        showLogin()
        hideSignUp()
    }

    changetologin.addEventListener('click', (event)=> {
        event.preventDefault();
        showLoginInRegister();
    })
    signup.addEventListener('click', showSignUp)
    modelSignUp.addEventListener('click', hideSignUp)
    
    modelSignUpContainer.addEventListener('click', function (event) {
        event.stopPropagation()
    })
</script>

		 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>   
		 <script type="text/javascript">
		    	var status = document.getElementById("status").value;
		    	if(status=="failed") {
		    		swal("Lỗi","Sai Tên Đăng Nhập Hoặc Mật Khẩu","error");
		    	}
		    </script>
</body>
</html>