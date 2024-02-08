package com.example.todowebapp;

import java.io.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "removeTaskServlet", value = "/RemoveTaskServlet")
public class RemoveTaskServlet extends HttpServlet {
    private TasksDao tasksDao;

    public void init() {
        tasksDao = new TasksDao();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String taskIdStr = request.getParameter("taskId");

        if (taskIdStr != null && !taskIdStr.isEmpty()) {
            try {
                int taskId = Integer.parseInt(taskIdStr);
                tasksDao.deleteTask(taskId);
            } catch (NumberFormatException e) {

            }
        }
        response.sendRedirect("index.jsp");
    }
}
