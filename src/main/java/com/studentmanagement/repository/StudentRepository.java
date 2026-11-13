package com.studentmanagement.repository;

import com.studentmanagement.entity.Student;

import java.util.List;

public interface StudentRepository {
    Student save(Student student);
    List<Student> findAll();
    Student findById(Long id);
    Student update(Student student);
    void delete(Long id);
}
