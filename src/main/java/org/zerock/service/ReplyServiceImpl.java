package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.domain.ReplyVO;
import org.zerock.persistence.ReplyDAO;
@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Inject
	ReplyDAO dao;
	
	@Override
	public List<ReplyVO> getList(Integer bno/*, Criteria cri*/) throws Exception {
		// TODO Auto-generated method stub
		return dao.list(bno/*,cri*/);
	}

	@Override
	public void addReply(ReplyVO vo) throws Exception {
		dao.create(vo);
		
	}

	@Override
	public void modifyReply(ReplyVO vo) throws Exception {
		dao.update(vo);
		
	}

	@Override
	public void removeReply(Integer rno) throws Exception {
		dao.delete(rno);
		
	}

	@Override
	public int count(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.count(bno);
	}

	
	
	
}
