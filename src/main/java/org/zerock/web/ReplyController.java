package org.zerock.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageMaker;
import org.zerock.domain.ReplyVO;
import org.zerock.service.ReplyService;

@RestController
@RequestMapping("/reply")
public class ReplyController {

	@Inject
	ReplyService service;

	private static final Logger logger = Logger.getLogger(ReplyController.class);
	
	@PostMapping
	public ResponseEntity<String> register(@RequestBody ReplyVO vo){
		
		ResponseEntity<String>entity = null;
		
		try {
			service.addReply(vo);
			entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
/*	@GetMapping("/view/{bno}")
	@ResponseBody
	public ResponseEntity<List<ReplyVO>> list(@PathVariable("bno") Integer bno) {
		
		ResponseEntity<List<ReplyVO>> entity = null;
		
		try{
			entity = new ResponseEntity<List<ReplyVO>>(
					service.getList(bno, cri),HttpStatus.OK);
		}catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<ReplyVO>>(HttpStatus.BAD_REQUEST);
			// TODO: handle exception
		}
		
		return entity;

	}
	*/
	
	

	@GetMapping("/view/{bno}/{page}")
	@ResponseBody
	public ResponseEntity<Map<String, Object>> list(@PathVariable("bno") Integer bno,@PathVariable("page")Integer page) {
		
		ResponseEntity<Map<String, Object>> entity = null;
		try {
			Criteria cri = new Criteria();
			cri.setPage(page);
			PageMaker pageMaker = new PageMaker(cri, service.count(bno));
			pageMaker.setCri(cri);
			
			Map<String, Object> map = new HashMap<String,Object>();
			
			List<ReplyVO> list = service.getList(bno,cri);
			
			map.put("list", list);
			
			int replyCount = service.count(bno);
			pageMaker.setTotal(replyCount);
			
			map.put("pageMaker", pageMaker);
			
			
			entity = new ResponseEntity<Map<String,Object>>(
					map,HttpStatus.OK);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
			
		}
		
		return entity;

	}
	
	@PutMapping("/{rno}")
	@ResponseBody
	public ResponseEntity<String> update(@PathVariable("rno") Integer rno, @RequestBody ReplyVO vo) {
		
		ResponseEntity<String> entity = null;
		try {
			vo.setRno(rno);
			service.modifyReply(vo);
			entity = new ResponseEntity<String>(
					"SUCCESS",HttpStatus.OK);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			
		}
		
		return entity;

	}
	
	@DeleteMapping("/{rno}")
	@ResponseBody
	public ResponseEntity<String> remove(@PathVariable("rno") Integer rno) {
		
		ResponseEntity<String> entity = null;
		try {
			service.removeReply(rno);
			entity = new ResponseEntity<String>(
					"SUCCESS",HttpStatus.OK);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
			
		}
		
		return entity;

	}
	

}
