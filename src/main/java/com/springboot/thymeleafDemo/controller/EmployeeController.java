package com.springboot.thymeleafDemo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.springboot.thymeleafDemo.entity.Employee;
import com.springboot.thymeleafDemo.service.EmployeeService;

@Controller
@RequestMapping("/employees") //Base Mapping for URL Requests
public class EmployeeController {
	
	private EmployeeService employeeService;
	
	public EmployeeController(EmployeeService theEmployeeService) {
		employeeService = theEmployeeService;
	}
	
	//Add mapping for list of employees
	@GetMapping("/list")
	public String listEmployee(Model theModel) {
		
		//Get the employee list from the Database
		List<Employee> theEmployees = employeeService.findAll();
		
		//Add to spring Model
		theModel.addAttribute("employees", theEmployees);
		
		return "employees/list-employees";
	}
	
	@GetMapping("/showFormForAdd")
	public String showFormForAdd(Model theModel) {
		
		//Create model attribute to bind the form data
		
		Employee theEmployee = new Employee();
		
		//
		theModel.addAttribute("employee", theEmployee);
		
		return "employees/employee-form";
	}
	
	@GetMapping("/showFormForUpdate")
	public String showFormForUpdate(@RequestParam("employeeId") int theId, Model theModel) {
		
		// get the employee from the service
		Employee theEmployee = employeeService.findById(theId);
		
		// set employee in the model to prepopulate the form
		theModel.addAttribute("employee", theEmployee);
		// send it over to the form
		
		return "employees/employee-form";
	}
	
	@PostMapping("/save")
	public String saveEmployee(@ModelAttribute("employee") Employee theEmployee) {
		
		//Save the data into Database
		
		employeeService.save(theEmployee);
		
		//Use redirect to prevent duplicate submission
		
		return "redirect:/employees/list";
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("employeeId") int theId) {
		
		//Delete the Employee
		employeeService.deleteById(theId);
		
		//redirect to list html
		return "redirect:/employees/list";
	}
}

