import com.google.gson.Gson;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "AreaCheckServlet", urlPatterns = "/validate")
public class AreaCheckServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Date startTime = new Date();
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


//        if (history.getAttribute("coord") != null) {
//            coordinates = gson.fromJson((String) history.getAttribute("coord"), type);
//        }

        Date endTime = new Date();
        double execute = endTime.getTime() - startTime.getTime();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("HH:mm:ss");

        Coordinate coordinate = new Coordinate(x,y,r,simpleDateFormat.format(startTime), execute, correctCoordinate);

        String cord = gson.toJson(coordinate);
        System.out.println(cord);
//        history.setAttribute("coord", coord);
        resp.sendRedirect(req.getContextPath() + "/index.jsp");
    }

}
