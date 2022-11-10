package Controller;

import Model.Encuesta;
import ModelDAO.EncuestaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "EncuestaController", urlPatterns = {"/EncuestaController"})
public class EncuestaController extends HttpServlet {
    
    String home = "views/";
    String encuestas = "views/encuestas.jsp";
    Encuesta survey = new Encuesta();
    EncuestaDAO surveyDAO = new EncuestaDAO();
    

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
        HttpSession session = request.getSession();
        Date now = new Date();
        String fecha = new SimpleDateFormat("yyyy-MM-dd").format(now);
        String nombre, sexo, deporte, nivelEstudio, favorito;
        String access = "";
        String action = request.getParameter("action");
        switch(action.toLowerCase()) {
            case "enviar":
                nombre = request.getParameter("name");
                sexo = request.getParameter("sexo");
                deporte = request.getParameter("deporte");
                nivelEstudio = request.getParameter("nivelEstudio");
                favorito = request.getParameter("favorito");
                
                survey.setId_usuario(Integer.parseInt(session.getAttribute("id_usuario").toString()));
                survey.setFecha(now);
                survey.setNombre(nombre);
                survey.setSexo(sexo);
                survey.setDeporte_fav(deporte);
                survey.setNivel_estudio(nivelEstudio);
                survey.setTemas_fav(favorito);

                surveyDAO.addEncuesta(survey);
                
                access = home;
                break;
            case "eliminar":
                int id_encuesta = Integer.parseInt(request.getParameter("id_encuesta"));
                surveyDAO.deleteEncuesta(id_encuesta);
                access = encuestas;
                break;
        }
        
        response.sendRedirect(access);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
