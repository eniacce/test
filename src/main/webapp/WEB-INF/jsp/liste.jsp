<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<style>

    body {
        padding-top: 40px;
    }

    .col-sm-6 {
        background: #ccc;
    }

    .other {
        background: #a4a4a4;
    }

    .p {
        text-align: center;
        padding-top: 120px;
    }

    .p a {
        text-decoration: underline;
        color: blue;
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
<script type="text/var connection = new WebSocket('ws://html5rocks.websocket.org/echo', ['soap', 'xmpp']);javascript"
        src="<c:url value="/resources/jQuery-File-Upload-9.11.0/js/jquery.fileupload.js"/> "></script>
<script type="text/javascript" src="<c:url value="/resources/datatables/js/dataTables.foundation.js"/> "></script>
<link rel="stylesheet" href="<c:url value="/resources/datatables/css/jquery.dataTables.css"/> "/>

<link rel="stylesheet" href="<c:url value="/resources/datatables/css/dataTables.bootstrap.css"/> "/>

<script type="text/javascript" src="<c:url value="/resources/bootstrap-3.3.5-dist/js/bootstrap.min.js"/> "></script>
<script type="text/javascript" src="<c:url value="/resources/bootstrap-3.3.5-dist/js/bootstrap.js" />"></script>
<link rel="stylesheet" href="<c:url value="/resources/bootstrap-3.3.5-dist/css/bootstrap.css"/> " type="text/css"/>
<link rel="stylesheet" href="<c:url value="/resources/bootstrap-3.3.5-dist/css/bootstrap.min.css"/> " type="text/css"/>

<script type="text/javascript" src="<c:url value="/resources/bootstrap-3.3.5-dist/js/bootstrap-modal.js"/> "></script>
</head>
<body style="background-color: #245269">


<div class="row">

    <div class="col-md-6"><img src="<c:url value="/resources/logo.png"/> " alt="resim">
        <input type="button" value="Kayit" id="kayit" onclick="kayitEt()"/></div>
    <div class="col-md-6"><img src="<c:url value="/resources/logo.png"/> " alt="resim"></div>

</div>

<div class="row">

    <div class="col-md-4">
        <div class="table-responsive">
            <table class="table" style="width: 40%">

                <thead>
                <tr>
                    <th>#</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Username</th>
                    <th>URL</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <c:forEach items="${liste}" var="list">
                    <th scope="row">#</th>
                    <th scope="row">${list.id}</th>
                    <th scope="row">${list.name}</th>
                    <th scope="row">${list.surname}</th>
                    <th scope="row">${list.url}</th>

                </tbody>
                </c:forEach>
            </table>
        </div>
    </div>
    <div class="col-md-4">

        <canvas id="canvas" width="300" height="300"
                style="background-color:#333">
        </canvas>

    </div>
    <div class="col-md-4">
        <h2>Title</h2>
        <img src="<c:url value="/resources/mmatanak.jpg"/> " alt="resim">

        <p>Durum:</p>
    </div>

</div>


<div class="row">

    <div class="col-md-6">
        <div class="table-responsive">
            <table class="table" style="width: 40%">

                <thead>
                <tr>
                    <th>#</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Username</th>
                    <th>URL</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <c:forEach items="${liste}" var="list">
                    <th scope="row">#</th>
                    <th scope="row">${list.id}</th>
                    <th scope="row">${list.name}</th>
                    <th scope="row">${list.surname}</th>
                    <th scope="row">${list.url}</th>

                </tbody>
                </c:forEach>
            </table>
        </div>
    </div>
    <div class="col-md-6">
        <div class="table-responsive">
            <table class="table" style="width: 40%">

                <thead>
                <tr>
                    <th>#</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Username</th>
                    <th>URL</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <c:forEach items="${liste}" var="list">
                    <th scope="row">#</th>
                    <th scope="row">${list.id}</th>
                    <th scope="row">${list.name}</th>
                    <th scope="row">${list.surname}</th>
                    <th scope="row">${list.url}</th>

                </tbody>
                </c:forEach>
            </table>
        </div>
    </div>


</div>


</body>

</html>


<script type="text/javascript">

    var canvas = document.getElementById("canvas");
    var ctx = canvas.getContext("2d");
    var radius = canvas.height / 2;
    ctx.translate(radius, radius);
    radius = radius * 0.90;
    setInterval(drawClock, 1000);

    function drawClock() {
        drawFace(ctx, radius);
        drawNumbers(ctx, radius);
        drawTime(ctx, radius);
    }

    function drawFace(ctx, radius) {
        var grad;
        ctx.beginPath();
        ctx.arc(0, 0, radius, 0, 2 * Math.PI);
        ctx.fillStyle = 'white';
        ctx.fill();
        grad = ctx.createRadialGradient(0, 0, radius * 0.95, 0, 0, radius * 1.05);
        grad.addColorStop(0, '#333');
        grad.addColorStop(0.5, 'white');
        grad.addColorStop(1, '#333');
        ctx.strokeStyle = grad;
        ctx.lineWidth = radius * 0.1;
        ctx.stroke();
        ctx.beginPath();
        ctx.arc(0, 0, radius * 0.1, 0, 2 * Math.PI);
        ctx.fillStyle = '#333';
        ctx.fill();
    }

    function drawNumbers(ctx, radius) {
        var ang;
        var num;
        ctx.font = radius * 0.15 + "px arial";
        ctx.textBaseline = "middle";
        ctx.textAlign = "center";
        for (num = 1; num < 13; num++) {
            ang = num * Math.PI / 6;
            ctx.rotate(ang);
            ctx.translate(0, -radius * 0.85);
            ctx.rotate(-ang);
            ctx.fillText(num.toString(), 0, 0);
            ctx.rotate(ang);
            ctx.translate(0, radius * 0.85);
            ctx.rotate(-ang);
        }
    }

    function drawTime(ctx, radius) {
        var now = new Date();
        var hour = now.getHours();
        var minute = now.getMinutes();
        var second = now.getSeconds();
        //hour
        hour = hour % 12;
        hour = (hour * Math.PI / 6) +
                (minute * Math.PI / (6 * 60)) +
                (second * Math.PI / (360 * 60));
        drawHand(ctx, hour, radius * 0.5, radius * 0.07);
        //minute
        minute = (minute * Math.PI / 30) + (second * Math.PI / (30 * 60));
        drawHand(ctx, minute, radius * 0.8, radius * 0.07);
        // second
        second = (second * Math.PI / 30);
        drawHand(ctx, second, radius * 0.9, radius * 0.02);
    }

    function drawHand(ctx, pos, length, width) {
        ctx.beginPath();
        ctx.lineWidth = width;
        ctx.lineCap = "round";
        ctx.moveTo(0, 0);
        ctx.rotate(pos);
        ctx.lineTo(0, -length);
        ctx.stroke();
        ctx.rotate(-pos);
    }


    function kayitEt() {
        var name = "mesut";
        $.ajax({
            url: '${pageContext.request.requestPath}/student/createStudent',
            type: 'POST',
            data: JSON.stringify(name),
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Accept", "application/json");
                xhr.setRequestHeader("Content-Type", "application/json");
            },
            success: function (data) {
                console.log(data);
            }
        });
    }


    <%--setInterval(function(){--%>
    <%--$.ajax({--%>

    <%--url: '${pageContext.request.contextPath}/student/create',--%>
    <%--type: 'POST',--%>


    <%--beforeSend: function (xhr) {--%>
    <%--xhr.setRequestHeader("Accept", "application/json");--%>
    <%--xhr.setRequestHeader("Content-Type", "application/json");--%>
    <%--},--%>
    <%--success: function (response) {--%>
    <%--console.log(response);--%>
    <%--$("#hocaResim").attr("src",response.data[20].url).css("width",'100');--%>

    <%--},--%>
    <%--error:function(data){--%>
    <%--console.log(data);--%>
    <%--}--%>

    <%--});--%>

    <%--},3000);--%>


    function kontrol() {
        var json = {"name": "mesut"};
        $.ajax({

            url: '${pageContext.request.contextPath}/student/create',
            type: 'POST',


            beforeSend: function (xhr) {
                xhr.setRequestHeader("Accept", "application/json");
                xhr.setRequestHeader("Content-Type", "application/json");
            },
            success: function (response) {
                console.log(response);
                for (var i = 0; i < response.data.length; i++)
                    $(".dropdown-menu").append('<li role="presentation"><a role="menuitem" tabindex="-1" href="#">' + response.data[i].name + '</a></li>');
            },
            error: function (data) {
                console.log(data);
            }

        });


    }


</script>