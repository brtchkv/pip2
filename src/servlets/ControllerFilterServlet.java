package servlets;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ControllerFilterServlet implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        String x = getValidString(servletRequest.getParameter("x"));
        String y = getValidString(servletRequest.getParameter("y"));
        String r = getValidString(servletRequest.getParameter("r"));

        x = x.replace(',', '.');
        y = y.replace(',', '.');
        r = r.replace(',', '.');

        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;


        if ((isNumeric(x)) || (isNumeric(y)) || (isNumeric(r))) {

            double xNumber = Double.parseDouble(x);
            double yNumber = Double.parseDouble(y);
            double rNumber = Double.parseDouble(r);

            if ((rNumber <= 6 && rNumber >= 1) && (yNumber >= -5 && 5 >= yNumber) && (xNumber >= -2 && 2 >= xNumber))
                filterChain.doFilter(servletRequest, servletResponse);

        } else {
            resp.sendRedirect(req.getContextPath() + "/index.jsp");
        }
    }

    private static boolean isNumeric(String str) {
        return str.matches("-?\\d+(\\.\\d+)?");
    }
    private static String getValidString(String str){
        return str == null ? "" : str;
    }
}
