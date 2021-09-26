package com.zyc.crud.test;

import com.zyc.crud.bean.Department;
import com.zyc.crud.bean.Employee;
import com.zyc.crud.dao.DepartmentMapper;
import com.zyc.crud.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;
import java.util.UUID;

/**
 * @author zyc
 * @create 2021--09--23 11:49
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    EmployeeMapper employeeMapper;

    @Autowired
    SqlSession sqlSession;

    @Test
    public void testCRUD() {
//        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("mybatis-config.xml");
//        DepartmentMapper bean = applicationContext.getBean(DepartmentMapper.class);

        // 1.插入部门
//        departmentMapper.insertSelective(new Department(null, "开发部"));
//        departmentMapper.insertSelective(new Department(null, "测试部"));

        // 2.插入员工
//        employeeMapper.insertSelective(new Employee(null,"钟无艳","f",null,2));

        // 3.批量插入员工
//        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
//        for (int i = 0; i <100 ; i++) {
//            String uuid = UUID.randomUUID().toString().substring(0, 5) + i;
////            mapper.insertSelective(new Employee(null,uuid,"M",uuid + "@qq.com",1));
//        }
//        System.out.println("完成");

        // 4.查询
        List<Employee> employees = employeeMapper.selectByExampleWithDept(null);
        for (Employee employee:employees) {
            System.out.println(employee.getDepartment().getDeptName());
        }
        System.out.println("====");
        Employee employee = employeeMapper.selectByPrimaryKeyWithDept(1);
        System.out.println(employee.getDepartment().getDeptName());
    }
}
