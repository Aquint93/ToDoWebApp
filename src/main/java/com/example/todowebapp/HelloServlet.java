package com.example.todowebapp;

import java.io.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/")
public class HelloServlet extends HttpServlet {
    private TasksDao tasksDao;

    public void init() {
        tasksDao = new TasksDao();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws  IOException {
            String task = request.getParameter("task");
            Tasks newTask = new Tasks(task);
            tasksDao.saveTask(newTask);
            response.sendRedirect("index.jsp");
    }
}