<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="html" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


    <script type="text/javascript" src="<c:url value="/resources/bootstrap-3.3.5-dist/jquery.js"/> "></script>


    <script type="text/javascript" src="<c:url value="/resources/datatables/js/dataTables.bootstrap.js"/> "></script>

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

<div class="bs-example" data-example-id="basic-forms">
    <form>

        <div class="form-group">
            <label for="name">ID</label>
            <input type="text" class="form-control" id="id" placeholder="id" hidden="true">
        </div>
        <div class="form-group">
            <label for="name">Username</label>
            <input type="text" class="form-control" id="name" placeholder="UserName">
        </div>
        <div class="form-group">
            <label for="surname">Password</label>
            <input type="text" class="form-control" id="surname" placeholder="surname">
        </div>


        <div class="form-group">
            <label for="url">Password</label>
            <input type="text" class="form-control" id="url" placeholder="URL">
        </div>


        <button id="kontrol" onclick="test()" type="button" class="btn btn-default">Submit</button>
    </form>
</div>


</body>

</html>


<script>


    function test() {
        var ad = $('#name').val();
        var soyad = $('#surname').val();


        $.ajax({
            url: '${pageContext.request.contextPath}/student/createStudentSave',
            type: "POST",
            data: JSON.stringify({ad,soyad}),
            beforeSend: function (xhr) {
                xhr.setRequestHeader("Accept", "application/json");
                xhr.setRequestHeader("Content-Type", "application/json");
            },
            success: function (data) {

                console.log(data);

            }
        });


    }


</script>


