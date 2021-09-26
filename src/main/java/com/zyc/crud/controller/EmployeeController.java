package com.zyc.crud.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zyc.crud.bean.Employee;
import com.zyc.crud.bean.Msg;
import com.zyc.crud.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author zyc
 * @create 2021--09--23 15:20
 */
@Controller
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;

    /**
     * responseBody注解需要导入jackson包
     * @param pn
     * @param model
     * @return
     */
    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmpsWithJson(@RequestParam(value = "pn",defaultValue = "1")Integer pn,
                               Model model) {
        //引入PageHelper分页插件
        //查询之前需调用：传入的页码，以及每页的大小
        PageHelper.startPage(pn,5);
        //startPage后面紧跟的这个查询就是分页查询
        List<Employee> list = employeeService.getAll();
        //使用pageInfo包装查询后的结果,里面包含了丰富的页面信息,连续显示的页数为5
        PageInfo<Employee> pageInfo = new PageInfo<>(list,5);
        return Msg.success().add("pageInfo",pageInfo);
    }

    /**
     * 查询员工数据(分页查询)
     * @return
     */
    //@RequestMapping("/emps")
    public String getEmps(@RequestParam(value = "pn",defaultValue = "1")Integer pn,
                          Model model) {
        //引入PageHelper分页插件
        //查询之前需调用：传入的页码，以及每页的大小
        PageHelper.startPage(pn,5);
        //startPage后面紧跟的这个查询就是分页查询
        List<Employee> list = employeeService.getAll();
        //使用pageInfo包装查询后的结果,里面包含了丰富的页面信息,连续显示的页数为5
        PageInfo<Employee> pageInfo = new PageInfo<>(list,5);

        model.addAttribute("pageInfo",pageInfo);
        return "list";
    }
}
