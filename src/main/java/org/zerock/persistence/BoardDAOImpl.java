package org.zerock.persistence;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
@Repository
public class BoardDAOImpl implements BoardDAO {
	
	private static final String namespace ="org.zerock.persistence.BoardDAO";
	
	
	@Inject
	SqlSessionTemplate sess;
	
	
	@Override
	public List<BoardVO> list(Criteria cri) {
		
		return sess.selectList(namespace+".list", cri);  
	}


	@Override
	public int Count(Criteria cri) throws Exception {
		
		return sess.selectOne(namespace+".count",cri);
	}


	@Override
	public BoardVO read(BoardVO vo) throws Exception {
		
		return sess.selectOne(namespace+".read", vo);
	}


	@Override
	public void insert(BoardVO vo) throws Exception {
		sess.insert(namespace+".insert", vo);
		
	}


	@Override
	public void delete(BoardVO vo) throws Exception {
		sess.delete(namespace+".delete", vo);
		
	}


	@Override
	public void update(BoardVO vo) throws Exception {
		sess.delete(namespace+".update", vo);
		
	}


	
}
