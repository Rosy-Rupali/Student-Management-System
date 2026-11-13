package com.studentmanagement.filter;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;

import java.io.IOException;

public class RequestLoggingFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) {
        System.out.println("RequestLoggingFilter initialized");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) request;

        long startTime = System.currentTimeMillis();

        System.out.println("HTTP Method: " + httpRequest.getMethod());
        System.out.println("Request URI: " + httpRequest.getRequestURI());
        System.out.println("Client IP: " + httpRequest.getRemoteAddr());

        try {
            chain.doFilter(request, response);
        } finally {
            long executionTime =
                    System.currentTimeMillis() - startTime;

            System.out.println(
                    "Processing Time: " + executionTime + " ms"
            );
        }
    }

    @Override
    public void destroy() {
        System.out.println("RequestLoggingFilter destroyed");
    }
}
