package org.zerock.persistence;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.zerock.domain.Criteria;
import org.zerock.domain.ReplyVO;
@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	@Inject
	SqlSessionTemplate sess;
	
	/*Map<String,Object> map = new HashMap<>();*/
	
	
	private static final String namespace ="org.zerock.persistence.ReplyDAO";
	
	@Override
	public List<ReplyVO> list(Integer bno, Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("bno",bno);
		map.put("cri", cri);
		
		return sess.selectList(namespace+".list", map);
	}

	@Override
	public void create(ReplyVO vo) throws Exception {
		 sess.insert(namespace+".create", vo);
		
	}

	@Override
	public void update(ReplyVO vo) throws Exception {
		sess.update(namespace+".update", vo);
		
	}

	@Override
	public void delete(Integer rno) throws Exception {
		sess.delete(namespace+".delete", rno);
		
	}

	@Override
	public int count(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return sess.selectOne(namespace+".count", bno);
	}

}
