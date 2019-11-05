<%--
Created by IntelliJ IDEA.
User: ivan
Date: 2019-10-09
Time: 21:50
To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.Vector" %>
<%@ page import="servlets.Coordinate" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>

<%
    StringBuilder builderHistoryForGraph = new StringBuilder();
    Vector<Coordinate> coordinates = new Vector<>();
    ServletContext context = request.getServletContext();
    if (context.getAttribute("userData") != null) {
        coordinates = (Vector<Coordinate>) context.getAttribute("userData");
    }

    for (Coordinate element : coordinates) {
        builderHistoryForGraph.append("{'x':'" + element.getX() + "','y':'" + element.getY() + "','r':'" + element.getR()
                + "','correct':'" + element.getCorrect() + "'},");
    }

%>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>Лаба 1</title>
    <link href="css/stylesMain.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js" type="text/javascript"></script>
    <script language="text/javascript" src="js/script.js" type="text/javascript"></script>
    <script language="text/javascript" src="js/interactive.js" type="text/javascript"></script>
</head>

<body style="overflow:hidden;">
<!-- 	min: 950x640   -->
<div class="background">
<main class="mainRect animated zoomIn fast">
    <form action="validate" id="form" method="GET">
        <input autocomplete="off" id="xValue" name="x" type="hidden" value="">
        <div class="inputFields">
            <div class="task taskRect">
                <div class="headerText">
                    Введите данные на проверку вхождения в область значений данного графика:
                </div>
            </div>

            <div class="xRect" id="xField">
                <span class="xLetter">X</span>
                <table id="tableButton" onclick="regularTableX()">

                    <tr>
                        <td>
                            <button class="buttonNumber" id="-2" name="x" onclick="mindX(this.id)" type="button">-2
                            </button>
                        </td>
                        <td>
                            <button class="buttonNumber" id="-1.5" name="x" onclick="mindX(this.id)" type="button">-1,5
                            </button>
                        </td>
                        <td>
                            <button class="buttonNumber" id="-1" name="x" onclick="mindX(this.id)" type="button">-1
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button class="buttonNumber" id="-0.5" name="x" onclick="mindX(this.id)" type="button">-0,5
                            </button>
                        </td>
                        <td>
                            <button class="buttonNumber" id="0" name="x" onclick="mindX(this.id)" type="button">0
                            </button>
                        </td>
                        <td>
                            <button class="buttonNumber" id="0.5" name="x" onclick="mindX(this.id)" type="button">0,5
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button class="buttonNumber" id="1" name="x" onclick="mindX(this.id)" type="button">1
                            </button>
                        </td>
                        <td>
                            <button class="buttonNumber" id="1.5" name="x" onclick="mindX(this.id)" type="button">1,5
                            </button>
                        </td>
                        <td>
                            <button class="buttonNumber" id="2" name="x" onclick="mindX(this.id)" type="button">2
                            </button>
                        </td>
                    </tr>
                </table>
                <script type="text/javascript">
                    $('.buttonNumber').on('click', function () {
                        $('buttonNumber').removeClass('selected');
                        $(this).addClass('selected');
                    });
                </script>
            </div>

            <div class="rRect" id="rField">
                <span class="rParameter">R</span>
                <div class="cntr">
                    <table id="tableRadio" onclick="regularTableR()">
                        <tr>
                            <td>
                                <label class="btn-radio" for="rdo-1">
                                    <input id="rdo-1" name="r" type="radio" value="1">
                                    <svg height="20px" viewBox="0 0 20 20" width="20px">
                                        <circle cx="10" cy="10" r="9"></circle>
                                        <path class="inner"
                                              d="M10,7 C8.34314575,7 7,8.34314575 7,10 C7,11.6568542 8.34314575,13 10,13 C11.6568542,13 13,11.6568542 13,10 C13,8.34314575 11.6568542,7 10,7 Z"></path>
                                        <path class="outer"
                                              d="M10,1 L10,1 L10,1 C14.9705627,1 19,5.02943725 19,10 L19,10 L19,10 C19,14.9705627 14.9705627,19 10,19 L10,19 L10,19 C5.02943725,19 1,14.9705627 1,10 L1,10 L1,10 C1,5.02943725 5.02943725,1 10,1 L10,1 Z"></path>
                                    </svg>
                                    <span>1</span>
                                </label>
                            </td>

                            <td>
                                <label class="btn-radio" for="rdo-2">
                                    <input id="rdo-2" name="r" type="radio" value="2">
                                    <svg height="20px" viewBox="0 0 20 20" width="20px">
                                        <circle cx="10" cy="10" r="9"></circle>
                                        <path class="inner"
                                              d="M10,7 C8.34314575,7 7,8.34314575 7,10 C7,11.6568542 8.34314575,13 10,13 C11.6568542,13 13,11.6568542 13,10 C13,8.34314575 11.6568542,7 10,7 Z"></path>
                                        <path class="outer"
                                              d="M10,1 L10,1 L10,1 C14.9705627,1 19,5.02943725 19,10 L19,10 L19,10 C19,14.9705627 14.9705627,19 10,19 L10,19 L10,19 C5.02943725,19 1,14.9705627 1,10 L1,10 L1,10 C1,5.02943725 5.02943725,1 10,1 L10,1 Z"></path>
                                    </svg>
                                    <span>2</span>
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label class="btn-radio" for="rdo-3">
                                    <input id="rdo-3" name="r" type="radio" value="3">
                                    <svg height="20px" viewBox="0 0 20 20" width="20px">
                                        <circle cx="10" cy="10" r="9"></circle>
                                        <path class="inner"
                                              d="M10,7 C8.34314575,7 7,8.34314575 7,10 C7,11.6568542 8.34314575,13 10,13 C11.6568542,13 13,11.6568542 13,10 C13,8.34314575 11.6568542,7 10,7 Z"></path>
                                        <path class="outer"
                                              d="M10,1 L10,1 L10,1 C14.9705627,1 19,5.02943725 19,10 L19,10 L19,10 C19,14.9705627 14.9705627,19 10,19 L10,19 L10,19 C5.02943725,19 1,14.9705627 1,10 L1,10 L1,10 C1,5.02943725 5.02943725,1 10,1 L10,1 Z"></path>
                                    </svg>
                                    <span>3</span>
                                </label>
                            </td>

                            <td>
                                <label class="btn-radio" for="rdo-4">
                                    <input id="rdo-4" name="r" type="radio" value="4">
                                    <svg height="20px" viewBox="0 0 20 20" width="20px">
                                        <circle cx="10" cy="10" id="test" r="9"></circle>
                                        <path class="inner"
                                              d="M10,7 C8.34314575,7 7,8.34314575 7,10 C7,11.6568542 8.34314575,13 10,13 C11.6568542,13 13,11.6568542 13,10 C13,8.34314575 11.6568542,7 10,7 Z"></path>
                                        <path class="outer"
                                              d="M10,1 L10,1 L10,1 C14.9705627,1 19,5.02943725 19,10 L19,10 L19,10 C19,14.9705627 14.9705627,19 10,19 L10,19 L10,19 C5.02943725,19 1,14.9705627 1,10 L1,10 L1,10 C1,5.02943725 5.02943725,1 10,1 L10,1 Z"></path>
                                    </svg>
                                    <span>4</span>
                                </label>
                            </td>
                        </tr>
                        <tr>

                            <td>
                                <label class="btn-radio" for="rdo-5">
                                    <input id="rdo-5" name="r" type="radio" value="5">
                                    <svg height="20px" viewBox="0 0 20 20" width="20px">
                                        <circle cx="10" cy="10" r="9"></circle>
                                        <path class="inner"
                                              d="M10,7 C8.34314575,7 7,8.34314575 7,10 C7,11.6568542 8.34314575,13 10,13 C11.6568542,13 13,11.6568542 13,10 C13,8.34314575 11.6568542,7 10,7 Z"></path>
                                        <path class="outer"
                                              d="M10,1 L10,1 L10,1 C14.9705627,1 19,5.02943725 19,10 L19,10 L19,10 C19,14.9705627 14.9705627,19 10,19 L10,19 L10,19 C5.02943725,19 1,14.9705627 1,10 L1,10 L1,10 C1,5.02943725 5.02943725,1 10,1 L10,1 Z"></path>
                                    </svg>
                                    <span>5</span>

                                </label>
                            </td>
<%--                            <td>--%>
<%--                                <label class="btn-radio" for="rdo-6">--%>
<%--                                    <input id="rdo-6" name="r" type="radio" value="6">--%>
<%--                                    <svg height="20px" viewBox="0 0 20 20" width="20px">--%>
<%--                                        <circle cx="10" cy="10" r="9"></circle>--%>
<%--                                        <path class="inner"--%>
<%--                                              d="M10,7 C8.34314575,7 7,8.34314575 7,10 C7,11.6568542 8.34314575,13 10,13 C11.6568542,13 13,11.6568542 13,10 C13,8.34314575 11.6568542,7 10,7 Z"></path>--%>
<%--                                        <path class="outer"--%>
<%--                                              d="M10,1 L10,1 L10,1 C14.9705627,1 19,5.02943725 19,10 L19,10 L19,10 C19,14.9705627 14.9705627,19 10,19 L10,19 L10,19 C5.02943725,19 1,14.9705627 1,10 L1,10 L1,10 C1,5.02943725 5.02943725,1 10,1 L10,1 Z"></path>--%>
<%--                                    </svg>--%>
<%--                                    <span>6</span>--%>

<%--                                </label>--%>
<%--                            </td>--%>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="yRect" id="yField">
                 <span class="yLetter">
                    Y
                 </span>
                <input autocomplete="off" autofocus
                       class="input" id="y" maxlength="8" name="y"
                       onchange="checkData();"
                       onkeyup="checkData();" placeholder="Введите число от -5 до 5" style="border: 2px solid #d0d1c7;"
                       title="Введите число" type="text">
            </div>

            <div class="imageRect">
                <div class="imageRect image">
                    <canvas class="canvas" height="181" id="canvas" style="position:absolute;" width="181" history="<%=builderHistoryForGraph.toString()%>"></canvas>
                    <svg fill="none" height="181" viewBox="0 0 181 181" width="181" xmlns="http://www.w3.org/2000/svg">
                        <rect height="180" transform="translate(0 1)" width="180"/>
                        <path d="M90 27L149 88H90V27Z" fill="#3E97FF"/>
                        <rect x="60" y="28" width="31.5" height="60" fill="#3E97FF"/>
                        <line x1="149.5" y1="81" x2="149.5" y2="94.9311" stroke="black"/>
                        <path d="M120 88C120 104.569 106.569 118 90 118C90 88 90 118 90 104.538C90 87.9699 90 109.154 90 88C106.569 88 100.125 88 120 88Z" fill="#3E97FF"/>
                        <line x1="120.5" y1="80" x2="120.5" y2="93.9311" stroke="black"/>
                        <line x1="59.5" y1="80" x2="59.5" y2="93.9311" stroke="black"/>
                        <path d="M171.773 98.7383L173.818 95.4688H175.143L172.447 99.6992L175.207 104H173.871L171.773 100.672L169.664 104H168.334L171.1 99.6992L168.398 95.4688H169.717L171.773 98.7383Z" fill="black"/>
                        <line x1="29.5" y1="81" x2="29.5" y2="94.9311" stroke="black"/>
                        <line x1="83" y1="27.5" x2="97.1716" y2="27.5" stroke="black"/>
                        <line x1="83" y1="56.5" x2="97.1716" y2="56.5" stroke="black"/>
                        <path d="M36.0762 71.8184H33.2168V70.9336H36.0762V71.8184ZM40.4355 71.5488H38.4316V75H37.3008V66.4688H40.125C41.0859 66.4688 41.8242 66.6875 42.3398 67.125C42.8594 67.5625 43.1191 68.1992 43.1191 69.0352C43.1191 69.5664 42.9746 70.0293 42.6855 70.4238C42.4004 70.8184 42.002 71.1133 41.4902 71.3086L43.4941 74.9297V75H42.2871L40.4355 71.5488ZM38.4316 70.6289H40.1602C40.7188 70.6289 41.1621 70.4844 41.4902 70.1953C41.8223 69.9062 41.9883 69.5195 41.9883 69.0352C41.9883 68.5078 41.8301 68.1035 41.5137 67.8223C41.2012 67.541 40.748 67.3984 40.1543 67.3945H38.4316V70.6289ZM44.748 75.7324H43.8164L47.3789 66.4688H48.3047L44.748 75.7324ZM54.9551 75H49.3652V74.2207L52.3184 70.9395C52.7559 70.4434 53.0566 70.041 53.2207 69.7324C53.3887 69.4199 53.4727 69.0977 53.4727 68.7656C53.4727 68.3203 53.3379 67.9551 53.0684 67.6699C52.7988 67.3848 52.4395 67.2422 51.9902 67.2422C51.4512 67.2422 51.0312 67.3965 50.7305 67.7051C50.4336 68.0098 50.2852 68.4355 50.2852 68.9824H49.2012C49.2012 68.1973 49.4531 67.5625 49.957 67.0781C50.4648 66.5938 51.1426 66.3516 51.9902 66.3516C52.7832 66.3516 53.4102 66.5605 53.8711 66.9785C54.332 67.3926 54.5625 67.9453 54.5625 68.6367C54.5625 69.4766 54.0273 70.4766 52.957 71.6367L50.6719 74.1152H54.9551V75Z" fill="black"/>
                        <path d="M105.119 27.5488H103.115V31H101.984V22.4688H104.809C105.77 22.4688 106.508 22.6875 107.023 23.125C107.543 23.5625 107.803 24.1992 107.803 25.0352C107.803 25.5664 107.658 26.0293 107.369 26.4238C107.084 26.8184 106.686 27.1133 106.174 27.3086L108.178 30.9297V31H106.971L105.119 27.5488ZM103.115 26.6289H104.844C105.402 26.6289 105.846 26.4844 106.174 26.1953C106.506 25.9062 106.672 25.5195 106.672 25.0352C106.672 24.5078 106.514 24.1035 106.197 23.8223C105.885 23.541 105.432 23.3984 104.838 23.3945H103.115V26.6289Z" fill="black"/>
                        <path d="M151.119 71.5488H149.115V75H147.984V66.4688H150.809C151.77 66.4688 152.508 66.6875 153.023 67.125C153.543 67.5625 153.803 68.1992 153.803 69.0352C153.803 69.5664 153.658 70.0293 153.369 70.4238C153.084 70.8184 152.686 71.1133 152.174 71.3086L154.178 74.9297V75H152.971L151.119 71.5488ZM149.115 70.6289H150.844C151.402 70.6289 151.846 70.4844 152.174 70.1953C152.506 69.9062 152.672 69.5195 152.672 69.0352C152.672 68.5078 152.514 68.1035 152.197 67.8223C151.885 67.541 151.432 67.3984 150.838 67.3945H149.115V70.6289Z" fill="black"/>
                        <path d="M60.0762 117.818H57.2168V116.934H60.0762V117.818ZM64.4355 117.549H62.4316V121H61.3008V112.469H64.125C65.0859 112.469 65.8242 112.688 66.3398 113.125C66.8594 113.562 67.1191 114.199 67.1191 115.035C67.1191 115.566 66.9746 116.029 66.6855 116.424C66.4004 116.818 66.002 117.113 65.4902 117.309L67.4941 120.93V121H66.2871L64.4355 117.549ZM62.4316 116.629H64.1602C64.7188 116.629 65.1621 116.484 65.4902 116.195C65.8223 115.906 65.9883 115.52 65.9883 115.035C65.9883 114.508 65.8301 114.104 65.5137 113.822C65.2012 113.541 64.748 113.398 64.1543 113.395H62.4316V116.629ZM68.748 121.732H67.8164L71.3789 112.469H72.3047L68.748 121.732ZM78.9551 121H73.3652V120.221L76.3184 116.939C76.7559 116.443 77.0566 116.041 77.2207 115.732C77.3887 115.42 77.4727 115.098 77.4727 114.766C77.4727 114.32 77.3379 113.955 77.0684 113.67C76.7988 113.385 76.4395 113.242 75.9902 113.242C75.4512 113.242 75.0312 113.396 74.7305 113.705C74.4336 114.01 74.2852 114.436 74.2852 114.982H73.2012C73.2012 114.197 73.4531 113.562 73.957 113.078C74.4648 112.594 75.1426 112.352 75.9902 112.352C76.7832 112.352 77.4102 112.561 77.8711 112.979C78.332 113.393 78.5625 113.945 78.5625 114.637C78.5625 115.477 78.0273 116.477 76.957 117.637L74.6719 120.115H78.9551V121Z" fill="black"/>
                        <path d="M180.354 88.3536C180.549 88.1583 180.549 87.8417 180.354 87.6464L177.172 84.4645C176.976 84.2692 176.66 84.2692 176.464 84.4645C176.269 84.6597 176.269 84.9763 176.464 85.1716L179.293 88L176.464 90.8284C176.269 91.0237 176.269 91.3403 176.464 91.5355C176.66 91.7308 176.976 91.7308 177.172 91.5355L180.354 88.3536ZM0 88.5L180 88.5V87.5L0 87.5L0 88.5Z" fill="black"/>
                        <path d="M91.3536 0.646454C91.1583 0.451187 90.8417 0.451187 90.6464 0.646454L87.4645 3.82843C87.2692 4.0237 87.2692 4.34027 87.4645 4.53554C87.6597 4.73079 87.9763 4.73079 88.1716 4.53554L91 1.70711L93.8284 4.53554C94.0237 4.73079 94.3403 4.73079 94.5355 4.53554C94.7308 4.34027 94.7308 4.0237 94.5355 3.82843L91.3536 0.646454ZM91.5 181L91.5 1H90.5L90.5 181H91.5Z" fill="black"/>
                        <line x1="84" y1="148.5" x2="98" y2="148.5" stroke="black"/>
                        <path d="M102.592 7.75195L104.818 3.46875H106.096L103.154 8.81836V12H102.029V8.81836L99.0879 3.46875H100.377L102.592 7.75195Z" fill="black"/>
                        <line x1="84" y1="118.5" x2="98.1716" y2="118.5" stroke="black"/>
                    </svg>
                </div>
            </div>

            <button class="buttonCheck buttonLetter" onclick="checkFields()" type="submit">
                Проверить
            </button>
        </div>
    </form>
    <div class="tableFixHead">
        <table id="dataTable" style="text-align: center;" class="hide">
            <thead align="center">
            <tr>
                <th>X</th>
                <th>Y</th>
                <th>R</th>
                <th>Результат</th>
                <th></th>
            </tr>
            </thead>

            <tbody id="tableBody">
            <%for (Coordinate element : coordinates) {%>
            <tr><td width="26%">
                <span title =" <%=element.getX()%> "> <%= element.editOutput(element.getX()).replace(".", ",")%> </span>
            </td><td width="26%">
                <span title =" <%=element.getY()%> "> <%= element.editOutput(element.getY()).replace(".", ",")%> </span>
            </td><td width="26%">
                <span title =" <%=element.getY()%> "> <%= Math.round(element.getR())%> </span>
            </td><td width="26%">
                <p style="color:<%=element.getColor()%>;text-align:center;"> <%=element.getCorrectWords()%> </p>
            </td><td width="26%">
            </td></tr>
            <%} %>
            </tbody>
        </table>
    </div>

    <button id="historyButton" class="historyButton" onclick="hideForm()" style="border: none;" type="button">
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
<footer>
    <p><span id="datetime"></span></p>
    <script type="text/javascript">
        document.write(new Date().getFullYear());
    </script>
</footer>
</body>
</html>