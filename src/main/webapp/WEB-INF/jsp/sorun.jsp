<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


    <style>

        /*@media screen and (max-width: 2000px) {*/
            /*table td:before {*/
                /*content: attr();*/
                /*float: left;*/
                /*text-transform: uppercase;*/
                /*font-weight: bold;*/
            /*}*/

        /*}*/

        #chartdiv3 {
            width: 100%;
            height: 500px;
            font-size: 11px;
        }

        #chartdiv {
            width: 100%;
            height: 500px;
            font-size: 11px;
        }

        #chartdiv2 {
            width: 100%;
            height: 500px;
            font-size: 11px;
        }

        .amcharts-export-menu-top-right {
            top: 10px;
            right: 0;
        }

        body {
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
            margin: auto;
            position: relative;
            width: 960px;
        }

        text {
            font: 10px sans-serif;
        }

        .axis path,
        .axis line {
            fill: none;
            stroke: #000;
            shape-rendering: crispEdges;
        }

        form {
            position: absolute;
            right: 10px;
            top: 10px;
        }
    </style>


    <script type="text/javascript" src="<c:url value="/resources/sockjs-client/dist/sockjs.min.js"/> "></script>
    <script type="text/javascript" src="<c:url value="/resources/studentWebSocket.js"/> "></script>
    <script type="text/javascript" src="<c:url value="/resources/amcharts/amcharts.js"/> "></script>
    <script type="text/javascript" src="<c:url value="/resources/amcharts/serial.js"/> "></script>
    <script type="text/javascript" src="<c:url value="/resources/amcharts/themes/light.js"/> "></script>

    <script type="text/javascript" src="<c:url value="/resources/bootstrap-3.3.5-dist/jquery.js"/> "></script>
    <script type="text/javascript" src="<c:url value="/resources/bootstrap-3.3.5-dist/d3.js"/> "></script>

    <script type="text/javascript" src="<c:url value="/resources/datatables/js/jquery.dataTables.js"/> "></script>
    <script type="text/javascript" src="<c:url value="/resources/datatables/js/dataTables.bootstrap.js"/> "></script>
    <script type="text/javascript"
            src="<c:url value="/resources/jQuery-File-Upload-9.11.0/js/jquery.fileupload.js"/> "></script>
    <script type="text/javascript" src="<c:url value="/resources/datatables/js/dataTables.foundation.js"/> "></script>
    <link rel="stylesheet" href="<c:url value="/resources/datatables/css/jquery.dataTables.css"/> "/>

    <link rel="stylesheet" href="<c:url value="/resources/datatables/css/dataTables.bootstrap.css"/> "/>

    <script type="text/javascript" src="<c:url value="/resources/bootstrap-3.3.5-dist/js/bootstrap.min.js"/> "></script>
    <script type="text/javascript" src="<c:url value="/resources/bootstrap-3.3.5-dist/js/bootstrap.js" />"></script>
    <link rel="stylesheet" href="<c:url value="/resources/bootstrap-3.3.5-dist/css/bootstrap.css"/> " type="text/css"/>
    <link rel="stylesheet" href="<c:url value="/resources/bootstrap-3.3.5-dist/css/bootstrap.min.css"/> "
          type="text/css"/>

    <script type="text/javascript"
            src="<c:url value="/resources/bootstrap-3.3.5-dist/js/bootstrap-modal.js"/> "></script>
</head>
<body>


<h1>Stock Ticker</h1>

<table>
    <thead>
    <tr>
        <th>Code</th>
        <th>Price</th>
        <th>Time</th>
    </tr>
    </thead>
    <tbody id="price"></tbody>
</table>

<p class="new">
    Code: <input type="text" class="code"/>
    Price: <input type="text" class="price"/>
    <button class="add">Add</button>
    <button class="remove-all">Remove All</button>
</p>

${curUser.surname}

<a href="${pageContext.request.contextPath}/student/createStudent">Create Student</a>

<div id="connect">

</div>
<div id="disconnect"></div>

<div id="response">

</div>

</body>

</html>


<script type="text/javascript">
    function setConnected(connected) {
        document.getElementById('connect').disabled = connected;
        document.getElementById('disconnect').disabled = !connected;
        document.getElementById('conversationDiv').style.visibility = connected ? 'visible' : 'hidden';
        document.getElementById('response').innerHTML = '';
    }

    function connect() {
        if ('WebSocket' in window) {
            console.log('Websocket supported');
            socket = new WebSocket('ws://localhost:8080//websocket');

            console.log('Connection attempted');

            socket.onopen = function () {
                console.log('Connection open!');
                setConnected(true);
            };

            socket.onclose = function () {
                console.log('Disconnecting connection');
            };

            socket.onmessage = function (evt) {
                var received_msg = evt.data;
                console.log(received_msg);
                console.log('message received!');
                showMessage(received_msg);
            }

        } else {
            console.log('Websocket not supported');
        }
    }

    function disconnect() {
        setConnected(false);
        console.log("Disconnected");
    }

    function sendName() {
        var message = document.getElementById('message').value;
        socket.send(JSON.stringify({'message': message}));
    }

    function showMessage(message) {
        var response = document.getElementById('response');
        var p = document.createElement('p');
        p.style.wordWrap = 'break-word';
        p.appendChild(document.createTextNode(message));
        response.appendChild(p);
    }

</script>

