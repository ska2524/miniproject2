package org.zerock.web;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import javax.inject.Inject;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/spring/*.xml")
@WebAppConfiguration
public class modelTest {
	
	
	
	@Inject
	WebApplicationContext ctx;
	
	
	MockMvc mock;
	
	
	@Before
	public void beefore(){
		mock = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void start() throws Exception{
		
		
		mock.perform(get("/list")).andReturn().getModelAndView().getModel();
		
	}
	
	
	
	
	
	
	
	
}
