<%-- 
    Document   : courseEdit
    Created on : Jun 18, 2023, 4:04:37 PM
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
        <link rel="stylesheet" href="css/courseEdit.css"/>
        <script src="js/courseEdit.js"></script>

        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
        <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />
    </head>
    <body style="background-image: url('image/anhnen.png')">
        <jsp:include page="/header.jsp"></jsp:include>
         
        
        <form action="editCourseServlet" method="post">
            <input name="cid" value="${listCourse.get(0).id}" type="hidden">
        
        <div class="wrap">
            
                               
                
            <div class="container content" >
                <button type="button"  class="btn_back" onclick="window.location.href='course'">Back</button> 
                <h1 style="padding-top: 20px; padding-bottom: 30px">Chỉnh sửa khóa học: ${listCourse.get(0).title}</h1>
                <div class="content_bot_des">
                            <h2 style="text-align: left; padding-left: 80px">Description: </h2>
                            <c:if test="${listCourseDes.isEmpty()}">
                                <textarea name="description" required></textarea>
                            </c:if>
                            <c:if test="${!listCourseDes.isEmpty()}">
                                <textarea name="description" required>${listCourseDes.get(0).detailCourseDes}</textarea>
                            </c:if>
                        </div><br>
                
                <div class="content_bot_target">
                    <h2 style="text-align: left; padding-left: 80px">Target: </h2>
                <c:if test="${ListTarget.isEmpty()}">
                    <input type="text" name="target" required class="target"/><br>
                </c:if>
                <c:if test="${!ListTarget.isEmpty()}">
                    <c:forEach items="${ListTarget}" var="a">
                        <input type="text" name="target" value="${a.content}" required class="target"/><br>
                    </c:forEach>
                </c:if>
                </div>
                <div class="add_remove_btn">
                    <img onclick="add1()" style="width: 30px; cursor: pointer;" src="./image/plus.png" alt="alt"/>
                    <img onclick="remove1()" style="width: 29px; cursor: pointer; margin-left: 10px;" src="./image/minus.png" alt="alt"/><br>
                </div>
                

                <div class="content_bot_chapter">
                    
                    <h2 style="text-align: left; padding-left: 80px">Chapter: </h2>
                <c:if test="${listChapter.isEmpty()}">
                    <input type="text" name="chapter" required class="chapter"/><br>
                </c:if>
                <c:if test="${!listChapter.isEmpty()}">
                    <c:forEach items="${listChapter}" var="a">
                        <input type="text" name="chapter" value="${a.name}" required class="chapter"/>
                        <button type="button" onclick="redirectToURL1(${listCourseDes.get(0).courseID},${a.id})">Edit Chapter</button>
                        <br>
                    </c:forEach>
                </c:if>
                </div>
                <div class="add_remove_btn">
                    <img onclick="add2()" style="width: 30px; cursor: pointer;" src="./image/plus.png" alt="alt"/>
                    <img onclick="remove2()" style="width: 29px; cursor: pointer; margin-left: 10px;" src="./image/minus.png" alt="alt"/><br>
                </div>
                
                <div class="content_bot_requiment">
                    <h2 style="text-align: left; padding-left: 80px">Requirement: </h2><!-- comment -->
                    <c:if test="${ListRequirement.isEmpty()}">
                    <input type="text" name="requiment" required class="requiment"/><br>
                </c:if>
                <c:if test="${!ListRequirement.isEmpty()}">
                    <c:forEach items="${ListRequirement}" var="a">
                        <input type="text" name="requiment" value="${a.content}" required class="requiment"/><br>
                    </c:forEach>
                </c:if>
                </div>
                <div class="add_remove_btn">
                    <img onclick="add3()" style="width: 30px; cursor: pointer;" src="./image/plus.png" alt="alt"/>
                    <img onclick="remove3()" style="width: 29px; cursor: pointer; margin-left: 10px;" src="./image/minus.png" alt="alt"/><br>
                </div>

                        
                        <input  type="submit" value="Edit" class="submit_btn"/>
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
                function activeSuccessToast() {
                    toastr.success('${savedBlogStatus}');
                }
                if ('${savedBlogStatus}' === 'Chinh sua thanh cong')
                    activeSuccessToast();
                if ('${savedBlogStatus}' === 'Xóa khỏi mục đã lưu')
                    activeErrorToast();
            function redirectToURL1(n,p){
                    window.location='editChapterServlet?cid=' + n+'&chapterID='+p;
                }
                
                
        </script>
    </body>
</html>
