package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardService {
	
	public List<BoardVO> getList(Criteria cri) throws Exception;
	
	public int getCount(Criteria cri) throws Exception; 
	
	public BoardVO getContent(BoardVO vo) throws Exception;
	
	public void register(BoardVO vo) throws Exception;
	
	public void removeData(BoardVO vo) throws Exception;
	
	public void updateData(BoardVO vo) throws Exception;
	
	
}
