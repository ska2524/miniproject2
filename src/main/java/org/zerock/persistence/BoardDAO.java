package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardDAO {
	
	public List<BoardVO> list(Criteria cri) throws Exception;
	
	public int Count(Criteria cri) throws Exception; 
	
	public BoardVO read(BoardVO vo) throws Exception;
	
	public void insert(BoardVO vo) throws Exception;
	
	public void delete(BoardVO vo) throws Exception;
	
	public void update(BoardVO vo) throws Exception;
	
	
	
	
	
}
