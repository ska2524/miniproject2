package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.persistence.BoardDAO;
@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	BoardDAO dao;
	
	
	

	@Override
	public int getCount(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.Count(cri);
	}




	@Override
	public List<BoardVO> getList(Criteria cri) throws Exception {
		
		return dao.list(cri);
	}




	@Override
	public BoardVO getContent(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(vo);
	}




	@Override
	public void register(BoardVO vo) throws Exception {
		dao.insert(vo);
		
	}




	@Override
	public void removeData(BoardVO vo) throws Exception {
		dao.delete(vo);
		
	}




	@Override
	public void updateData(BoardVO vo) throws Exception {
		dao.update(vo);
		
	}





}
