package com.studentmanagement.controller;

import com.studentmanagement.entity.Student;
import com.studentmanagement.service.StudentService;
import jakarta.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {
    private final StudentService studentService;

    public StudentController(StudentService studentService) {
        this.studentService = studentService;
    }

    // Display Add Student Form
    @GetMapping("/add")
    public String showAddForm(Model model) {

        model.addAttribute("student", new Student());

        return "student-form";
    }

    // Save Student
    @PostMapping("/save")
    public String saveStudent(@Valid @ModelAttribute("student") Student student, BindingResult result) {
        if (result.hasErrors())
            return "student-form";
        studentService.saveStudent(student);

        return "redirect:/student/list";
    }

    // Display All Students
    @GetMapping("/list")
    public String listStudents(Model model) {

        List<Student> students = studentService.getAllStudents();

        model.addAttribute("students", students);

        return "student-list";
    }

    // View Individual Student
    @GetMapping("/view/{id}")
    public String viewStudent(@PathVariable("id") Long id, Model model) {

        Student student = studentService.getStudentById(id);

        model.addAttribute("student", student);

        return "student-details";
    }

    // Display Edit Student Form
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") Long id, Model model) {

        Student student = studentService.getStudentById(id);

        model.addAttribute("student", student);

        return "student-form";
    }

    // Update Student
    @PostMapping("/update")
    public String updateStudent(@Valid @ModelAttribute("student") Student student, BindingResult result) {
        if (result.hasErrors())
            return "student-form";
        studentService.updateStudent(student);

        return "redirect:/student/list";
    }

    // Delete Student
    @PostMapping("/delete/{id}")
    public String deleteStudent(@PathVariable("id") Long id) {

        studentService.deleteStudent(id);

        return "redirect:/student/list";
    }
}
