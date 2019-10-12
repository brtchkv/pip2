package servlets;

import javax.servlet.*;
import javax.servlet.FilterConfig;
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
    public void doFilter(ServletRequest servletRequest,
                         ServletResponse servletResponse,
                         FilterChain filterChain)
            throws IOException, ServletException {
        String x = servletRequest.getParameter("x");
        String y = servletRequest.getParameter("y");
        String r = servletRequest.getParameter("r");


        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;


        if (!(x == null || y == null || r == null) && (isNumeric(x) && isNumeric(y) && isNumeric(r))) {

            x = x.replace(',', '.');
            y = y.replace(',', '.');
            r = r.replace(',', '.');

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
}
