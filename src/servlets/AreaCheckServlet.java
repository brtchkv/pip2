package servlets;

import com.google.gson.Gson;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;

@WebServlet(name = "AreaCheckServlet", urlPatterns = "/validate")
public class AreaCheckServlet extends HttpServlet {
    Vector<String> coordinatesCollection = new Vector<>();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        long startTime = System.nanoTime();
        double x = Double.parseDouble(req.getParameter("x").replace(',', '.'));
        double y = Double.parseDouble(req.getParameter("y").replace(',', '.'));
        double r = Double.parseDouble(req.getParameter("r").replace(',', '.'));


        Gson gson = new Gson();
        boolean correctCoordinate = false;

        if (x >= 0 && y >= 0 && y <= -x + r) {
            correctCoordinate = true;
        } else if (x >= 0 && y <= 0 && y * y <= r * r / 4 - x * x) {
            correctCoordinate = true;
        } else if (x <= 0 && y >= 0 && x >= -r / 2 && y <= r) {
            correctCoordinate = true;
        }


        long endTime = System.nanoTime();
        long execute = endTime - startTime;
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("HH:mm:ss");

        Coordinate coordinate = new Coordinate(x,y,r,simpleDateFormat.format(startTime), execute, correctCoordinate);

        String cord = gson.toJson(coordinate);
        ServletContext context = req.getSession().getServletContext();

        Object attribute = context.getAttribute("userData");

        if (!(attribute == null || ((Vector<String>) attribute).size() == 0)){
            coordinatesCollection = (Vector<String>) attribute;
        }

        coordinatesCollection.add(cord);
        context.setAttribute("userData", coordinatesCollection);

        resp.sendRedirect(req.getContextPath() + "/result.jsp");
    }

}
