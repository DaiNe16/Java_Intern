/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.LearnDAO;
import Model.Account;
import Model.Chapter;
import Model.Course;
import Model.CourseDetail;
import Model.CourseLearnWhat;
import Model.CourseRequirement;
import Model.Lesson;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author DELL
 */
@WebServlet(name = "editCourseServlet", urlPatterns = {"/editCourseServlet"})
public class editCourseServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet editCourseServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet editCourseServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        /* Check if user is logged in or not */
        if (session.getAttribute("account") == null) {
            request.getRequestDispatcher("login").forward(request, response);
        } else if (!"1".equals(account.getRoleID())) {
            /* If the user is not an administrator */
            request.getRequestDispatcher("home").forward(request, response);
        }

        String courseId = request.getParameter("courseId");

        LearnDAO la = new LearnDAO();

        ArrayList<Course> listCourse1 = la.getCourse(courseId);
        ArrayList<CourseDetail> listCourseDes = la.getCourseDes(courseId);
        ArrayList<CourseLearnWhat> ListTarget = la.getAllTarget(courseId);
        ArrayList<CourseRequirement> ListRequirement = la.getAllRequirement(courseId);
        ArrayList<Chapter> listChapter = la.getAllChapter(courseId);

        request.setAttribute("listCourse", listCourse1);
        request.setAttribute("listCourseDes", listCourseDes);
        request.setAttribute("ListTarget", ListTarget);
        request.setAttribute("ListRequirement", ListRequirement);
        request.setAttribute("listChapter", listChapter);
        request.getRequestDispatcher("courseEdit.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        /* Check if user is logged in or not */
        if (session.getAttribute("account") == null) {
            request.getRequestDispatcher("login").forward(request, response);
        } else if (!"1".equals(account.getRoleID())) {
            /* If the user is not an administrator */
            request.getRequestDispatcher("home").forward(request, response);
        }
        String cid = request.getParameter("cid");
        String description = request.getParameter("description");
        String target[] = request.getParameterValues("target");
        String[] chapter = request.getParameterValues("chapter");
        String requirement[] = request.getParameterValues("requiment");

        LearnDAO la = new LearnDAO();

        la.updateDes(description, cid);

        la.deleteAllTargetFromCID(cid);
        la.deleteAllRequirementFromCID(cid);
        la.addTargetByCID(target, cid);
        la.addRequimentByCID(requirement, cid);

        ArrayList<String> listChapterName1 = la.getAllChapterName(cid);
        if (chapter != null) {
            for (String chap : chapter) {
                if (listChapterName1.contains(chap)) {
                    System.out.println("Có trong ArrayList");
                } else {
                    la.addChapter(chap, cid);
                    System.out.println("add");
                }
            }
        }

        ArrayList<String> listChapterName = la.getAllChapterName(cid);
        for (String chap : listChapterName) {
            if (contains(chapter, chap)) {
                
                System.out.println("ke");
            }else{
                la.deleteChapterByName(chap, cid);
            }
        }

        ArrayList<Course> listCourse1 = la.getCourse(cid);
        ArrayList<CourseDetail> listCourseDes = la.getCourseDes(cid);
        ArrayList<CourseLearnWhat> ListTarget = la.getAllTarget(cid);
        ArrayList<CourseRequirement> ListRequirement = la.getAllRequirement(cid);
        ArrayList<Chapter> listChapter1 = la.getAllChapter(cid);
        System.out.println(listChapter1);
        request.setAttribute("savedBlogStatus", "Chinh sua thanh cong");
        request.setAttribute("listCourse", listCourse1);
        request.setAttribute("listCourseDes", listCourseDes);
        request.setAttribute("ListTarget", ListTarget);
        request.setAttribute("ListRequirement", ListRequirement);
        request.setAttribute("listChapter", listChapter1);
        request.getRequestDispatcher("courseEdit.jsp").forward(request, response);

    }

    public static boolean contains(String[] array, String element) {
        for (String num : array) {
            if (num.equals(element)) {
                return true;
            }
        }
        return false;
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
