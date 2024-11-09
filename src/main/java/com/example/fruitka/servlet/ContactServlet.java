package com.example.fruitka.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.logging.Logger;

@WebServlet(name = "contact", value = "/contact")
public class ContactServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(ContactServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String iframeMapUrl = "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3725.7366773976064!2d105.76154267616387!3d20.96308728066993!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x313454cabc683f57%3A0xdb02223a0620af21!2zVHLGsOG7nW5nIMSQ4bqhaSBI4buNYyBOZ3V54buFbiBUcsOjaQ!5e0!3m2!1sen!2s!4v1712918183118!5m2!1sen!2s";
        request.setAttribute("iframeMapUrl", iframeMapUrl);
        request.getRequestDispatcher("/contact.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {

        } catch (Exception e) {
            request.setAttribute("error", e.getMessage());
        }
        doGet(request, response);
    }
}
