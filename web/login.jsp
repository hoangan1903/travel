<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	String redirectUrl = (String) request.getAttribute("refererUrl");
%>
<!DOCTYPE html>
<html lang="en">

<head>
	<jsp:include page="components/globalHeadTags.jsp" />
	<link rel="stylesheet" type="text/css" href="assets/css/login.css">
	<title>Đăng nhập</title>
</head>

<body>
<div class="super_container">
	<!-- Header -->
	<jsp:include page="components/header.jsp" />

	<section class="login-form-section">
		<div class="container">
			<div class="row">
				<div class="col-md-3 col-xl-4"></div>
				<div class="col-md-6 col-xl-4">
					<form
						action="/login"
						class="login"
						method="post"
						data-request-error="Request to server unexpectedly failed">
						<div class="form-group required">
							<label class="form-control-label" for="loginUsername">Tên đăng nhập</label>
							<input
									type="text"
									id="loginUsername"
									class="form-control"
									name="user"
									required minlength="6"
									data-missing-error="Vui lòng nhập tên đăng nhập"
									data-range-error="Tên đăng nhập phải dài tối thiểu 6 ký tự">
							<div class="invalid-msg"></div>
						</div>
						<div class="form-group required">
							<label class="form-control-label" for="loginPassword">Mật khẩu</label>
							<input
									type="password"
									id="loginPassword"
									class="form-control"
									name="pwd"
									required
									data-missing-error="Vui lòng nhập mật khẩu">
							<div class="invalid-msg"></div>
						</div>
						<div class="form-group text-center mb-0">
							<button type="submit" name="login" class="btn btn-danger">Đăng nhập</button>
						</div>
						<input type="hidden" id="loginRedirectUrl" name="rurl"
							   value="<%=redirectUrl%>">
					</form>
				</div>
				<div class="col-md-3 col-xl-4"></div>
			</div>
		</div>
	</section>

	<!-- Menu -->
	<jsp:include page="components/menu.jsp" />

	<!-- Footer -->
	<jsp:include page="components/footer.jsp" />
</div>

<jsp:include page="components/globalScripts.jsp" />
<script src="assets/js/login.js"></script>

</body>

</html>
