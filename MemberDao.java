package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import member.model.Member;

public class MemberDao {

		// id 데이터 존재 시 -->  SQL MEMBER 테이블에서 특정 m_id의 모든 값을(*)가져와 member에 저장(= return member;) 
	  public Member selectById(Connection conn, String id) throws SQLException {
		    PreparedStatement pstmt = null;
		    ResultSet rs = null;
		    try {
		      // member 테이블에서 m_id 칼럼 값이 id 파라미터와 동일한 데이터를 조회한다.
		      pstmt = conn.prepareStatement("select * from member where m_id=?");
		      pstmt.setString(1, id);
		      rs = pstmt.executeQuery();
		      Member member = null;
		      // 데이터가 존재하면 member 객체를 생성하고 조회된 값을 저장한다.
		      if(rs.next()){
		        member = new Member(
		            rs.getString("m_id"),
		            rs.getString("m_pw"),
		            /*rs.getString("m_regnum"),*/
		            rs.getString("m_birth"),
		            rs.getString("m_gender"),
		            rs.getString("m_email"),
		            rs.getString("m_phone"),
		            toDate(rs.getTimestamp("m_regdate"))
		            );
		      }
		      return member;
		    } finally {
		      JdbcUtil.close(rs);
		      JdbcUtil.close(pstmt);
		    }
		  }

	private static Date toDate(Timestamp date) {
		return date == null ? null : new Date(date.getTime());
	}

	// mem 파라미터를 이용하여 INSERT문을 완성하고(pstmt.set*) 실행한다(pstmt.executeUpdate()).
	public void insert(Connection conn, Member mem) throws SQLException {
		try (PreparedStatement pstmt =
				conn.prepareStatement("insert into member values(?,?,?,?,?,?,?)")) {
			pstmt.setString(1, mem.getM_id());
			pstmt.setString(2, mem.getM_pw());
			/*pstmt.setString(3, mem.getM_regnum());*/
			pstmt.setString(3, mem.getM_birth());
			pstmt.setString(4, mem.getM_gender());
			pstmt.setString(5, mem.getM_email());
			pstmt.setString(6, mem.getM_phone());
			pstmt.setTimestamp(7, new Timestamp(mem.getM_regDate().getTime()));
			
			pstmt.executeUpdate();
		}
	}
	
	public static void update(Connection conn, Member member) throws SQLException {
		try (PreparedStatement pstmt = conn.prepareStatement(
				"update member set m_pw = ?, m_email = ?, m_phone = ? where m_id =?")) {
			pstmt.setString(1, member.getM_pw());
			pstmt.setString(2, member.getM_email());
			pstmt.setString(3, member.getM_phone());
			pstmt.setString(4, member.getM_id());
			pstmt.executeUpdate();

		}
	}

	public void delete(Connection conn, String m_id) throws SQLException {
		try (PreparedStatement pstmt = conn.prepareStatement(
				"delete from member WHERE m_id = ?")) {
			pstmt.setString(1, m_id);
			pstmt.executeUpdate();

		}
		
	}

	public Member selectByBirthEmail(Connection conn, String birth,
			String email) throws SQLException {
		PreparedStatement pstmt = null;
	    ResultSet rs = null;
		try { pstmt = conn.prepareStatement(
				"select * from member WHERE m_birth = ? AND m_email = ?");
			pstmt.setString(1, birth);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			Member member = null;
			if(rs.next()){
		        member = new Member(
		        		rs.getString("m_id"),
			            rs.getString("m_pw"),
			            /*rs.getString("m_regnum"),*/
			            rs.getString("m_birth"),
			            rs.getString("m_gender"),
			            rs.getString("m_email"),
			            rs.getString("m_phone"),
			            toDate(rs.getTimestamp("m_regdate"))
		            );
		      }
		      return member;
		    } finally {
		      JdbcUtil.close(rs);
		      JdbcUtil.close(pstmt);
		    }
		
	}

	public Member selectByIdPhone(Connection conn, String id,
			String phone) throws SQLException {
		PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    try {
	    	pstmt = conn.prepareStatement(
	    			"select * from member WHERE m_id=? AND m_phone=?" );
	    	pstmt.setString(1, id);
	    	pstmt.setString(2, phone);
	    	rs = pstmt.executeQuery();
	    	Member member = null;
	    	if(rs.next()) {
	    		member = new Member(
	    				rs.getString("m_id"),
			            rs.getString("m_pw"),
			            /*rs.getString("m_regnum"),*/
			            rs.getString("m_birth"),
			            rs.getString("m_gender"),
			            rs.getString("m_email"),
			            rs.getString("m_phone"),
			            toDate(rs.getTimestamp("m_regdate"))
	 		            );	    		
	    	}	return member;
	    }	finally {
		    JdbcUtil.close(rs);
		    JdbcUtil.close(pstmt);
	    }
	}

	public void updateTempPwd(Connection conn, String tempPwd, Member member) throws SQLException {
		try (PreparedStatement pstmt = conn.prepareStatement(
				"update member set m_pw = ? where m_id = ?")) {
			pstmt.setString(1, tempPwd);
			pstmt.setString(2, member.getM_id());
			pstmt.executeUpdate();
		}
	}
}
