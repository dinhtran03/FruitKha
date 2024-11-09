package com.example.fruitka.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.logging.Logger;

@WebServlet(name = "test/*", value = "/test/*")
public class TestServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(TestServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        String path = request.getContextPath();
        String uri = request.getRequestURI();
        String servletPath = request.getServletPath();

        logger.info("pathInfo: " + pathInfo);
        logger.info("path: " + path);
        logger.info("uri: " + uri);
        logger.info("servletPath: " + servletPath);

        request.getRequestDispatcher("/test.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
