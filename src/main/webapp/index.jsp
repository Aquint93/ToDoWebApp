<%@ page import="java.util.List" %>
<%@ page import="com.example.todowebapp.TasksDao" %>
<%@ page import="com.example.todowebapp.Tasks" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.simplecss.org/simple.css">
    <title>JSP - To-Do List</title>
</head>
<script>
    function validateForm() {
        var taskField = document.forms["myForm"]["task"].value;

        // RequiredFieldValidator
        if (taskField == null || taskField.trim() === "") {
            alert("Task field must be filled out");
            return false;
        }
        // RegularExpressionValidator (assuming a simple alphanumeric pattern)
        var alphanumericPattern = /^[a-zA-Z0-9\s]+$/;
        if (!alphanumericPattern.test(taskField)) {
            alert("Task field must contain only letters, numbers, and spaces");
            return false;
        }
        return true;
    }
</script>
<body>
<h1>To-Do List Application!</h1>

<form name="myForm" action="HelloServlet" method="post" onsubmit="return validateForm()">
    <table>
        <tr>
            <td>Enter New Task :</td>
            <td><input type="text" name="task" size="50" /></td>
        </tr>
    </table>
    <input type="submit" value="Submit" name="submit">
</form>
<%
    TasksDao tasksDao = new TasksDao();
    List<Tasks> listOfTasks = tasksDao.getAllTasks();
%>
<h4>All of the Tasks</h4>
<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Task</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
    <%
        for (Tasks task : listOfTasks) {
    %>
    <tr>
        <td><%=task.getId()%></td>
        <td><%=task.getTask()%></td>
        <td>
            <form action="RemoveTaskServlet" method="post">
                <input type="hidden" name="taskId" value="<%=task.getId()%>">
                <input type="submit" value="Remove">
            </form>
        </td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
</body>
</html>