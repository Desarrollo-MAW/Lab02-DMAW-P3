
package Controller;

import Model.Encuesta;
import ModelDAO.EncuestaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ServletEncuesta", urlPatterns = {"/ServletEncuesta"})
public class ServletEncuesta extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletEncuesta</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletEncuesta at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Encuesta survey = new Encuesta();
        
        survey.setNombre(request.getParameter("name"));
        survey.setSexo(request.getParameter("sexo"));
        survey.setDeporte_fav(request.getParameter("deporte"));
        survey.setNivel_estudio(request.getParameter("nivelEstudio"));
        survey.setTemas_fav(request.getParameter("favorito"));
        
        EncuestaDAO surveyDAO = new EncuestaDAO();
        surveyDAO.addEncuesta(survey);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
