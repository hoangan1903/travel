<%@ page import="com.travel.bean.FeedbackBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<FeedbackBean> listFeedback = (ArrayList<FeedbackBean>) request.getAttribute("listFeedback");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <jsp:include page="/components/admin/adminHeadTags.jsp"/>
</head>

<body class="fix-header fix-sidebar card-no-border">
<div class="preloader">
    <svg class="circular" viewBox="25 25 50 50">
        <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10"/>
    </svg>
</div>
<div id="main-wrapper">

    <jsp:include page="../components/admin/adminHeader.jsp"/>
    <jsp:include page="../components/admin/slideBar.jsp"/>

    <!-- Page wrapper  -->
    <!-- ============================================================== -->
    <div class="page-wrapper">
        <!-- ============================================================== -->
        <!-- Container fluid  -->
        <!-- ============================================================== -->
        <div class="container-fluid">
            <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="row page-titles">
                <div class="col-md-5 col-8 align-self-center">
                    <h3 class="text-themecolor m-b-0 m-t-0">Table</h3>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item active">Feedback</li>
                    </ol>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Start Page Content -->
            <!-- ============================================================== -->
            <div class="row">
                <!-- column -->
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-block">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <th>STT</th>
                                        <th>Feedback</th>
                                        <th>Title</th>
                                        <th>Customer</th>
                                        <th>Email</th>
                                        <th>Status</th>
                                    </tr>

                                    </thead>
                                    <tbody>
                                    <c:forEach items="${listFeedback}" var="feedback" varStatus="status">
                                        <c:url var="feedbackUrl" value="/admin/Feedback">
                                            <c:param name="id" value="${feedback.getId()}"/>
                                        </c:url>
                                            <tr>
                                                <td>${status.index + 1}</td>
                                                <td>${feedback.getContent()}</td>
                                                <td>${feedback.getTitle()}</td>
                                                <td>${feedback.getUsername()}</td>
                                                <td>${feedback.getEmail()}</td>
                                                <td>${feedback.getStatus() == 1 ? "Read" : "New"}</td>
                                                <td>
                                                    <form action="/admin/Feedback" method="post">
                                                        <button class="btn waves-effect waves-green btn-facebook hidden-md-down"
                                                                type="submit"
                                                                name="id_feedback_new"
                                                                value="${feedback.getId()}">
                                                            Mark as read
                                                        </button>
                                                    </form>
                                                </td>
                                            </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End PAge Content -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Container fluid  -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- footer -->
        <!-- ============================================================== -->
        <footer class="footer">
            © 2020 UIT Travel Admin
        </footer>
        <!-- ============================================================== -->
        <!-- End footer -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Page wrapper  -->
    <!-- ============================================================== -->


</div>
<jsp:include page="../components/admin/adminScipts.jsp"/>

</body>

</html>
