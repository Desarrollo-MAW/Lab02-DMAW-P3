
package Controller;

import Model.Usuario;
import ModelDAO.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "ServletLogin", urlPatterns = {"/ServletLogin"})
public class ServletLogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletLogin</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletLogin at " + request.getContextPath() + "</h1>");
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
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Usuario user = new Usuario();
        user.setCorreo(email);
        user.setContra(password);
        
        //Agregar a Lista
        UsuarioDAO userList = new UsuarioDAO();
        List<Usuario> list = userList.loginUser(user);
        
        //Variable tipo Usuario para Iterador
        Usuario userIterator = null;
        
        try (PrintWriter out = response.getWriter()) {
            if(list.isEmpty()) {
                String url = "views/login";
                String messageContent = 
                        "<div class='bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded'>" +
                        "<strong class='font-bold'>Error!</strong>" +
                        "<span class='ml-2'>Correo o Contraseña Incorrecta</span>" +
                        "</div>";
                response.sendRedirect(url+"?message="+messageContent);
            } else {
                Iterator<Usuario> i = list.iterator();
                HttpSession session = request.getSession();
                while(i.hasNext()) {
                    userIterator = i.next();
                    session.setAttribute("correo", userIterator.getCorreo());
                    session.setAttribute("contra", userIterator.getContra());
                    session.setAttribute("nombre", userIterator.getNombre());
                    session.setAttribute("apellido", userIterator.getApellido());
                    response.sendRedirect("");
                }
            }
        }
        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
