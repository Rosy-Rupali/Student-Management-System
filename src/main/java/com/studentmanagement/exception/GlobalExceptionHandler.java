package com.studentmanagement.exception;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice  //Makes this class available for handling exceptions across controllers
public class GlobalExceptionHandler {
    @ExceptionHandler(StudentNotFoundException.class) //Specifies which exception a method handles
    public String handleStudentNotFound(StudentNotFoundException ex, Model model) {
        model.addAttribute("errorMessage", ex.getMessage());
        return "error";
    }

    @ExceptionHandler(Exception.class)
    public String handleGlobalException(Exception ex, Model model) {
        model.addAttribute("errorMessage", "Something went wrong. Please try again later.");
        return "error";
    }
}
