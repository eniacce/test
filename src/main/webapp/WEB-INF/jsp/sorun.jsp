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

<div class="table-responsive">
    <table class="table table-bordered">
        <caption>Listing</caption>
        <thead>
        <tr>
            <th>#</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Username</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <c:forEach items="${liste}" var="list">
            <th scope="row">#</th>
            <th scope="row">${list.id}</th>
            <th scope="row">${list.name}</th>
            <th scope="row">${list.surname}</th>

        </tbody>
        </c:forEach>
    </table>
</div>
${curUser.surname}

<a href="${pageContext.request.contextPath}/student/createStudent">Create Student</a>

</body>

</html>


<script>
    //Create stomp client over sockJS protocol
    var socket = new SockJS("/stockticker/ws");
    var stompClient = Stomp.over(socket);
    // Render price data from server into HTML, registered as callback
    // when subscribing to price topic
    function renderPrice(frame) {
        var prices = JSON.parse(frame.body);
        $('#price').empty();
        for(var i in prices) {
            var price = prices[i];
            $('#price').append(
                    $('<tr>').append(
                            $('<td>').html(price.code),
                            $('<td>').html(price.price.toFixed(2)),
                            $('<td>').html(price.timeStr)
                    )
            );
        }
    }

    // Callback function to be called when stomp client is connected to server
    var connectCallback = function() {
        stompClient.subscribe('/topic/price', renderPrice);
    };
    // Callback function to be called when stomp client could not connect to server
    var errorCallback = function(error) {
        alert(error.headers.message);
    };
    // Connect to server via websocket
    stompClient.connect("guest", "guest", connectCallback, errorCallback);

    // Register handler for add button
    $(document).ready(function() {
        $('.add').click(function(e){
            e.preventDefault();
            var code = $('.new .code').val();
            var price = Number($('.new .price').val());
            var jsonstr = JSON.stringify({ 'code': code, 'price': price });
            stompClient.send("/app/addStock", {}, jsonstr);
            return false;
        });
    });

    // Register handler for remove all button
    $(document).ready(function() {
        $('.remove-all').click(function(e) {
            e.preventDefault();
            stompClient.send("/app/removeAllStocks");
            return false;
        });
    });
</script>