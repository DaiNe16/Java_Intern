<%-- 
    Document   : lessonEdit
    Created on : Jun 18, 2023, 7:20:30 PM
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
        <link rel="stylesheet" href="css/lessonEdit.css"/>
        <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet" />

        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
        <!--link bootstrap-->
        <link href="./CommonLib/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <style>
            .toast-success {
                background-color: green;
            }
        </style>

    </head>
    <body style="background-image: url('image/anhnen.png')">
        <jsp:include page="header.jsp"></jsp:include>


            <div class="table-wrapper">
                <div id="courseContent">
                    <h2 style="color: white">Chỉnh sửa bài học: ${listCourse.get(0).title}</h2>
                <button type="button"  class="btn_back" onclick="window.location.href = 'course'">Back</button> 
                <h3 style="color: white">Các chương và bài học:</h3>
                <c:forEach var="chapter" items="${listChapter}">

                    <h4 style="color: white">Chương ${chapter.name}</h4>

                    <table class="fl-table">
                        <thead>
                            <tr>
                                <th>Tên Bài Học</th>
                                <th>Type</th>
                                <th>Link</th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach var="lesson" items="${listLesson}">
                                <c:if test="${lesson.chapterID == chapter.id}">

                                    <tr>
                                        <td style="max-width: 600px">${lesson.name}</td>
                                        <td><select id="type_${lesson.id}" name="type_${lesson.id}" onchange="showExtraFields(${lesson.id})">
                                                <option value="default" <c:if test="${lesson.type =='video'}&&${lesson.type!='feedback'}&&${lesson.type !='practice'}"> selected  </c:if>>Default</option>
                                                <option value="video" <c:if test="${lesson.type=='video'}">selected</c:if>>Video</option>
                                                <option value="feedback" <c:if test="${lesson.type=='feedback'}">selected</c:if>>Feedback</option>
                                                <option value="practice" <c:if test="${lesson.type=='practice'}">selected</c:if>>Quiz</option>
                                            </select> <button onclick="saveType(${listCourse.get(0).id},${lesson.id})">Save</button></td>
                                        <td><div class="extraFields" id="url-input_${lesson.id}" name="url-input_${lesson.id}" style="display: none;">
                                                <label>URL:</label>                                     
                                                <input type="text" id="lessonURL_${lesson.id}" name="lessonURL_${lesson.id}" <c:if test="${lesson.link!=null}">value="${lesson.link}"</c:if>>
                                                <button name="save_${chapter.id}_${lesson.id}" onclick="saveUrl(${listCourse.get(0).id},${lesson.id})">Save</button>
                                            </div></td>
                                    </tr>
                                </c:if>
                            <script>
                                var type = document.getElementById("type_${lesson.id}");
                                var urlInput = document.getElementById("url-input_${lesson.id}");
                                if (type.value === "video" || type.value === "feedback") {
                                    urlInput.style.display = "block";
                                }
                            </script>

                        </c:forEach>
                        </tbody>
                    </table><br><br>

                </c:forEach>
            </div>
        </div>
    </div>

    <div class="footer">
        <jsp:include page="footer.jsp"></jsp:include>
        </div>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js" ></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
        <script>
                                function activeSuccessToast() {
                                    toastr.success('${savedBlogStatus}', '', {
                                        "toastClass": "toast-success"
                                    });
                                }

                                if ('${savedBlogStatus}' === 'Chinh sua thanh cong') {
                                    activeSuccessToast();
                                }
                                function showExtraFields(n) {
                                    var type = document.getElementById("type_" + n);
                                    var urlInput = document.getElementById("url-input_" + n);

                                    if (type.value === "video" || type.value === "feedback") {
                                        urlInput.style.display = "block";
                                    } else {
                                        urlInput.style.display = "none";
                                    }
                                }
                                function saveUrl(c, l) {
                                    var url = document.getElementById("lessonURL_" + l).value;
                                    window.location = "editLessonServlet?courseId=" + c + "&lessonId=" + l + "&url=" + url + "&mod=1";
                                }
                                function saveType(c, l) {
                                    var type = document.getElementById("type_" + l).value;
                                    window.location = "editLessonServlet?courseId=" + c + "&lessonId=" + l + "&type=" + type + "&mod=2";
                                }

    </script>
</body>
</html>
