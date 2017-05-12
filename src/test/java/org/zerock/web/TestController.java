package org.zerock.web;


import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.service.BoardService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class TestController {
	
	private static final Logger logger = Logger.getLogger(TestController.class);
	
	@Inject
	SqlSessionTemplate sess;
	
	@Inject
	BoardService service;
	
	@Test
	public void timeTest(){
		sess.selectOne("org.zerock.persistence.BoardDAO.time");
		
		
	}
	
	@Test
	public void list() throws Exception{
		
		Criteria cri = new Criteria();
		
		service.getList(cri);
		
		
		
	}
	
	
	
}
