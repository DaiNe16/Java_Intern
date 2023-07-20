<%-- 
    Document   : CourseList
    Created on : Jun 10, 2023, 11:55:29 AM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/header.css"/>
        <link rel="stylesheet" href="css/footer.css"/>
        <link rel="stylesheet" href="css/course_list.css"/>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
        <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="path/to/unicons/css/unicons.css">
        <script src="path/to/unicons/js/unicons.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/unicons/css/unicons.css">
        <script src="${pageContext.request.contextPath}/resources/unicons/js/unicons.js"></script>
        <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/unicons/css/unicons.css">
        <script src="<%= request.getContextPath() %>/resources/unicons/js/unicons.js"></script>

        <style>
            .table1, th, td {
                border: 1px solid #dee2e6;
                vertical-align: top;
                text-align: left;
                padding: 8px;
                border-collapse: collapse;
            }

            .mb-0 tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            .mb-0 tr:hover {
                background-color: #ddd;
            }

            thead tr th {
                text-align: center;
            }

            .add_btn {

                width: 183px;
                height: 33px;
                background: #4CAF50;
                font-size: 17px;
                margin-bottom: 10px;
                border-radius: 4px;
                border: none;
                cursor: pointer;
                font-size: 20px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <form action="listRouteCourse" method="post" id="form">
                <div style="display: flex">
                    <div style="margin-left: 10px;margin-top: 30px">
                    <jsp:include page="sidebar.jsp"></jsp:include>
                    </div>
                    <div>
                        <h2 style="color:black;font-size: 30px">KHOA HỌC</h2>
                        <div class="table-responsive shadow rounded m-5">
                            <table id="table" class="  table table-center bg-white mb-0" style="font-size : 18px">
                                <p class="add_btn" style="display: flex; justify-content: center; align-items: center;">
                                    <a onclick="window.location = 'createCourse'" style="color:white;text-decoration:none">Tạo khoa học</a>
                                </p>
                                <thead>
                                    <tr style="background-color:#396cf0; color: #ffffff">
                                        <th class="border-bottom p-3" style="min-width: 120px;">ID</th>
                                        <th class="border-bottom p-3" style="min-width: 120px;">Giá</th>
                                        <th class="border-bottom p-3" style="min-width: ">GIới thiệu khóa học</th>
                                        <th class="border-bottom p-3" style="min-width: 120px;">Mức độ</th>
                                        <th class="border-bottom p-3" style="min-width: 120px;">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
<!--                                <div class="add_btn">
                                    <div >
                                        <div class="filter_instruction">FilterByLevel: </div>
                                        <div class="content_dropdown_lesson">
                                            <select onchange="document.getElementById('f').submit()" id="mySelect2" name="lesson" required>
                                                <option selected value="default">Chọn bài học</option>
                                            <c:forEach items="${listLessons}" var="l">
                                                <option <c:if test="${l.id == lessonID}">selected</c:if> value="${l.id}">${l.name}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>-->
                            <c:forEach items="${listCourse}" var="itemCourse">  
                                <tr>
                                    <td class="p-3" id="${itemCourse.getCourseID()} >${itemCourse.getCourseID()}</td>
                                        <input type="text" name="cid" value="${itemCourse.getCourseID()}" readonly="" style="display: none">
                                    <td class="p-3">${itemCourse.getTitle()}</td>
                                    <td class="p-3">${itemCourse.getPrice()}</td>
                                    <td class="p-3">${itemCourse.getDetailCourseDes()}</td>
                                    <td class="p-3">${itemCourse.getLevel()}</td>

                                    <td style="display: flex
                                        "><button name="btn_edit" onclick="redirectToURL1(${itemCourse.getCourseID()})"  value="${itemCourse.getCourseID()}"  type="button" style="text-decoration: none;color: black; width: 40px; cursor: pointer;font-size: 14px">Edit</button> 
                                        <div name="btn_delete" onclick="redirectToURL2()" value="${i.id}" value="${itemCourse.getCourseID()}" style="text-align: center;justify-content: center;margin-left: 10px; width: 50px; cursor: pointer;height: 25px;border:1px #807171 solid;border-radius: 2px;background-color: #F0F0F0 ;font-size: 14px">Xóa</div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                    </div>
                </div>


            </div>
        </form>


        <div class="footer">
            <jsp:include page="footer.jsp"></jsp:include>
        </div>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js" ></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
        <script>
                                         function activeErrorToast() {
                    toastr.error('${savedBlogStatus}');
                }
                if ('${savedBlogStatus}' === 'Ðã xóa khóa học')
                    activeErrorToast();
                
                function redirectToURL1(n){
                    window.location='editCourseServlet?courseId=' + n;
                }
                function redirectToURL2(n){
                    window.location='editLessonServlet?courseId=' + n;
                }
                
                function redirect(){
                    window.location.href='/g4/home';
                }
        </script>        
    </body>
</html>

<!--

<%-- 
    Document   : CourseList
    Created on : Jun 10, 2023, 11:55:29 AM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/header.css"/>
        <link rel="stylesheet" href="css/footer.css"/>
        <link rel="stylesheet" href="css/course_list.css"/>
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
        <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
        <style>
            .add_btn {
                display: flex;
                justify-content: space-between;
            }
            .content_dropdown_lesson select {
                background-color: #4CAF50;
                border: none;
                border-radius: 6px;
                width: 210px;
                height: 40px;
                margin-left: 20px;
                color: white;
            }
            .filter_instruction {
                font-size: 18px;
                color: white;
                margin-top: 14px;
            }
            .add_btn input {
                width: 60px;
                height: 40px;
                background: #4CAF50;
                color: white;
                margin-bottom: 10px;
                border-radius: 8px;
                border: none;
                cursor: pointer;
            }
        </style>
    </head>
    <body style="background-image: url('image/anhnen.png')">
        <jsp:include page="header.jsp"></jsp:include>
        <form action="course" method="post">
            <h2>DANH SÁCH Khóa Học</h2>

            <div class="table-wrapper">
                <table class="fl-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Title</th>
                            <th>Price</th> Giá
                            <th>Course Description</th> GIới thiệu khóa học
                            <th>Level</th> Mức độ
                            <th>BUTTON</th>
                        </tr>
                    </thead>
                    <div class="add_btn">
                            <input onclick="window.location = 'createCourse'" type="button" value="Add" />
                            <div style="display: flex;">
                                <div class="filter_instruction">FilterByLevel: </div>
                                <div class="content_dropdown_lesson">
                                    <select onchange="document.getElementById('f').submit()" id="mySelect2" name="lesson" required>
                                        <option selected value="default">Chọn bài học</option>
                                    <c:forEach items="${listLessons}" var="l">
                                        <option <c:if test="${l.id == lessonID}">selected</c:if> value="${l.id}">${l.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                    <tbody>           
                    <c:forEach items="${listCourse}" var="itemCourse">  


                        <tr>

                            <td id="${itemCourse.getCourseID()}">${itemCourse.getCourseID()}</td> 
                        <input type="text" name="cid" value="${itemCourse.getCourseID()}" readonly="" style="display: none">
                        <td style="color: blue; cursor: pointer;"  onclick="ectToURL2(${itemCourse.getCourseID()})redir">${itemCourse.getTitle()}</td>
                        <td>${itemCourse.getPrice()}</td>
                        <td style="max-width: 600px;   word-wrap: break-word;">${itemCourse.getDetailCourseDes()}</td>
                        <td>${itemCourse.getLevel()}</td>

                        <td><button name="btn_edit" onclick="redirectToURL1(${itemCourse.getCourseID()})" value="${itemCourse.getCourseID()}" type="button" style="text-decoration: none;color: black; width: 40px; cursor: pointer">Edit</button> 
                            <button name="btn_delete" onclick="redirectToURL2()" value="${itemCourse.getCourseID()}" type="submit" style="margin-left: 10px; width: 20px; cursor: pointer" class="btn_delete"><ion-icon name="trash-outline"></ion-icon></button>
                        </td>
                        <c:choose>
                            <c:when test="${btn_delete != null}">
                                <div class="message_popup_show">
                                    <p style="font-size: 18px; margin-top: 20px; font-style: italic ">Bạn có chắc chắn muốn xóa <b> ${course.getTitle()} </b> không?</p>
                                    <a class="btn_yes" href="course?cid=${course.getId()}&mod=1&btn_find=&actor="><i class='bx bx-check'></i> Đồng ý</a>
                                    <button  class="btn_no"><i class='bx bx-x'></i>Hủy</button>
                                </div>
                            </c:when>
                        </c:choose>
                        </tr>
                </c:forEach>
                <tbody>
            </table> LỘ TRÌNH HỌC
        </div>
        </form>
            

        <div class="footer">
            <jsp:include page="footer.jsp"></jsp:include>
            </div>
            <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js" ></script>
            <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
            <script>
                function activeErrorToast() {
                    toastr.error('${savedBlogStatus}');
                }
                if ('${savedBlogStatus}' === 'Ðã xóa khóa học')
                    activeErrorToast();
                
                function redirectToURL1(n){
                    window.location='editCourseServlet?courseId=' + n;
                }
                function redirectToURL2(n){
                    window.location='editLessonServlet?courseId=' + n;
                }
                
                function redirect(){
                    window.location.href='/g4/home';
                }
        </script>        
    </body>
</html>-->
