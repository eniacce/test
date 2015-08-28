<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link>


    <style>

        @media screen and (max-width: 2000px) {
            table td:before {
                content: attr();
                float: left;
                text-transform: uppercase;
                font-weight: bold;
            }

        }

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
    <link rel="stylesheet" href="<c:url value="/resources/bootstrap-3.3.5-dist/css/bootstrap.min.css"/> " type="text/css"/>

    <script type="text/javascript" src="<c:url value="/resources/bootstrap-3.3.5-dist/js/bootstrap-modal.js"/> "></script>
</head>
<body>
<h1>${test}</h1>
<img id="hocaResim" src="<c:url value="/resources/amcharts/images/dragIcon.gif"/> " alt="Smiley face" height="42" width="42">
<div class="table-responsive">
    <table class="table">
        <caption>Listing</caption>
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

<input type="button" value="Gonder" onclick="kontrol();"/>




</body>

</html>


<script type="text/javascript">

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
                for(var i=0;i<response.data.length;i++)
               $(".dropdown-menu").append('<li role="presentation"><a role="menuitem" tabindex="-1" href="#">'+response.data[i].name+'</a></li>');
            },
            error:function(data){
                console.log(data);
            }

        });



    }


</script>