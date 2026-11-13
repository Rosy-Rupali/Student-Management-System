package com.studentmanagement.service;

import com.studentmanagement.entity.Student;
import com.studentmanagement.exception.StudentNotFoundException;
import com.studentmanagement.repository.StudentRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service //this class contains business logic and should be managed as a Spring bean.
@Transactional
public class StudentServiceImpl implements StudentService {
    private final StudentRepository studentRepository;

    public StudentServiceImpl(StudentRepository studentRepository) {
        this.studentRepository = studentRepository;
    }

    @Override
    public Student saveStudent(Student student) {
        return studentRepository.save(student);
    }

    @Override
    @Transactional(readOnly = true)
    public Student getStudentById(Long id) {
        Student student = studentRepository.findById(id);
        if (student == null) {
            throw new StudentNotFoundException("Student not found with id: " + id);
        }
        return student;
    }

    @Override
    public Student updateStudent(Student student) {
        getStudentById(student.getId());
        return studentRepository.update(student);
    }

    @Override
    public void deleteStudent(Long id) {
        getStudentById(id);
        studentRepository.delete(id);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Student> getAllStudents() {
        return studentRepository.findAll();
    }

}
