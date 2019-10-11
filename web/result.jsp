<%--
Created by IntelliJ IDEA.
User: ivan
Date: 2019-10-09
Time: 21:50
To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.util.Vector" %>
<%@ page import="servlets.Coordinate" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>

<%
    StringBuilder builder = new StringBuilder();
    Vector<String> coordinates = new Vector<>();
    ServletContext context = request.getServletContext();
    Gson gson = new Gson();
    if (context.getAttribute("userData") != null) {
        coordinates = (Vector<String>) context.getAttribute("userData");
    }

%>

<!DOCTYPE html>
<html lang="ru">
<head>
    <title>Результат вычислений</title>
    <meta charset='utf-8'>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js" type="text/javascript"></script>
    <link href="css/stylesResponse.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css" rel="stylesheet">
    <script language="text/javascript" src="js/script.js" type="text/javascript"></script>
</head>

<body style="overflow:hidden;">
<div class="background">


    <main class="animated zoomIn fast">
        <table id="tableResponse" cellspacing="15">
            <a href="index.jsp" class="close">
                <script>
                    $(function () {
                        $('a').click(function (e) {
                            $('main').addClass('animated zoomOut fast');
                        });
                    });
                </script>
            </a>
            <tbody>
            <tr>
                <td class="etRect">
                    <span style="font-size: 18px;">Время исполнения</span>
                    <p>
<%
    if (coordinates.size() != 0){
        Coordinate lastElement = gson.fromJson(coordinates.lastElement(), Coordinate.class);
        out.println("<span style='text-align:center;' title=\"" + lastElement.getExecutionTime() + "\">" + lastElement.getExecutionTime()/1000 + " мкс" + "</span>");
    }
%>
                    </p>
                </td>
                <td>
                    <table id="tableParameters" style="text-align: center;">
                        <tr>
                            <td class="yRect">
                                <span class="parameters" style="font-size: 18px;">X</span>
                                <%
                                    if (coordinates.size() != 0){
                                        Coordinate lastElement = gson.fromJson(coordinates.lastElement(), Coordinate.class);
                                        out.println("<span style='text-align:center;' title=\"" + lastElement.getX() + "\">" + lastElement.editOutput(lastElement.getX()) + "</span>");
                                    }
                                %>
                            </td>
                            <td style="padding:0 5px 0 5px;"></td>
                            <td class="xRect">
                                <span class="parameters" style="font-size: 18px;">Y</span>
                                <%
                                    if (coordinates.size() != 0){
                                        Coordinate lastElement = gson.fromJson(coordinates.lastElement(), Coordinate.class);
                                        out.println("<span style='text-align:center;' title=\"" + lastElement.getY() + "\">" + lastElement.editOutput(lastElement.getY()) + "</span>");
                                    }
                                %>
                            </td>
                            <td style="padding:0 5px 0 5px;"></td>
                            <td class="rRect">
                                <span class="parameters" style="font-size: 18px;">R</span>
                                <%
                                    if (coordinates.size() != 0){
                                        Coordinate lastElement = gson.fromJson(coordinates.lastElement(), Coordinate.class);
                                        out.println("<span style='text-align:center;' title=\"" + lastElement.getR() + "\">" + lastElement.editOutput(lastElement.getR()) + "</span>");
                                    }
                                %>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>

            <tr>
                <td class="ctRect">
                    <span style="font-size: 18px;">Текущее время</span>
                    <p id="time"></p>
                    <script type="text/javascript">
                        function setTime() {
                            document.getElementById("time").innerHTML = new Date().toLocaleTimeString();
                        }

                        setInterval(setTime, 1000);
                        setTime();
                    </script>
                </td>
                <td class="resultRect">
                    <span style="font-size: 18px;">Результат</span>
                    <%
                        if (coordinates.size() != 0){
                            Coordinate lastElement = gson.fromJson(coordinates.lastElement(), Coordinate.class);
                            if (lastElement.getCorrect()) {
                                out.println( "<p style=\"color:#008000;text-align:center;\">Попал!</p>");
                            } else {
                                out.println("<p style=\"color:#B22222;text-align:center;\">Мимо :(</p>");
                            }
                        }
                    %>
                </td>
            </tr>
            </tbody>
        </table>
        <div class="tableFixHead">
            <table id="dataTable" style="text-align: center;" class="hide">
                <thead align="center">
                <tr>
                    <th>X</th>
                    <th>Y</th>
                    <th>R</th>
                    <th>Результат</th>
                </tr>
                </thead>

                <tbody id="tableBody">

                </tbody>
            </table>
        </div>

        <button id="historyButton" class="historyButton" onclick="showTable()" style="border: none;">
            <svg id="historyIcon" width="64" version="1.1" xmlns="http://www.w3.org/2000/svg" height="64"
                 viewBox="0 0 64 64" enable-background="new 0 0 64 64">
                <g>
                    <g fill="#333">
                        <path d="m34.688,3.315c-15.887,0-28.812,12.924-28.81,28.729-0.012,0.251-0.157,4.435 1.034,8.941l-3.881-2.262c-0.964-0.56-2.192-0.235-2.758,0.727-0.558,0.96-0.234,2.195 0.727,2.755l9.095,5.302c0.019,0.01 0.038,0.013 0.056,0.022 0.097,0.052 0.196,0.09 0.301,0.126 0.071,0.025 0.14,0.051 0.211,0.068 0.087,0.019 0.173,0.025 0.262,0.033 0.062,0.006 0.124,0.025 0.186,0.025 0.035,0 0.068-0.012 0.104-0.014 0.034-0.001 0.063,0.007 0.097,0.004 0.05-0.005 0.095-0.026 0.144-0.034 0.097-0.017 0.189-0.038 0.282-0.068 0.078-0.026 0.155-0.057 0.23-0.093 0.084-0.04 0.163-0.084 0.241-0.136 0.071-0.046 0.139-0.096 0.203-0.15 0.071-0.06 0.134-0.125 0.197-0.195 0.059-0.065 0.11-0.133 0.159-0.205 0.027-0.04 0.063-0.069 0.087-0.11 0.018-0.031 0.018-0.067 0.033-0.098 0.027-0.055 0.069-0.103 0.093-0.162l3.618-8.958c0.417-1.032-0.081-2.207-1.112-2.624-1.033-0.414-2.207,0.082-2.624,1.114l-1.858,4.6c-1.24-4.147-1.099-8.408-1.095-8.525 0-13.664 11.117-24.78 24.779-24.78 13.663,0 24.779,11.116 24.779,24.78 0,13.662-11.116,24.778-24.779,24.778-1.114,0-2.016,0.903-2.016,2.016s0.901,2.016 2.016,2.016c15.888,0 28.812-12.924 28.812-28.81-0.002-15.888-12.926-28.812-28.813-28.812z"/>
                        <path d="m33.916,36.002c0.203,0.084 0.417,0.114 0.634,0.129 0.045,0.003 0.089,0.027 0.134,0.027 0.236,0 0.465-0.054 0.684-0.134 0.061-0.022 0.118-0.054 0.177-0.083 0.167-0.08 0.321-0.182 0.463-0.307 0.031-0.027 0.072-0.037 0.103-0.068l12.587-12.587c0.788-0.788 0.788-2.063 0-2.851-0.787-0.788-2.062-0.788-2.851,0l-11.632,11.631-10.439-4.372c-1.033-0.431-2.209,0.053-2.64,1.081-0.43,1.027 0.055,2.208 1.08,2.638l11.688,4.894c0.004,0.001 0.008,0.001 0.012,0.002z"/>
                    </g>
                </g>
            </svg>
        </button>
</main>
</div>
<header>
    Иван Братчиков<br>
    Вариант № 201003<br>
    P3201<br>
</header>
<footer class="footer">
    <p><span id="datetime"></span></p>

    <script type="text/javascript">
        document.write(new Date().getFullYear());
    </script>
</footer>
</body>
</html>

