package cs.dit;

import java.sql.*;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDao {
	
	private ResultSet rs;
	
	private Connection getConnection() throws Exception {
		InitialContext initCtx = new InitialContext();
		DataSource ds = (DataSource)initCtx.lookup("java:comp/env/jdbc/suuurin");
		Connection con = ds.getConnection();
		
		return con;
	}
	
	public MemberDto getOne(String getId) {
		String sql = "select * from member where id=?";
		MemberDto dto = new MemberDto();
		
		try(Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			) {
				pstmt.setString(1, getId);	
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					String id = rs.getString("id");
					String pwd = rs.getString("pwd");
					String nickname = rs.getString("nickname");
					String name = rs.getString("name");
					String phone = rs.getString("phone");
					String email = rs.getString("email");
					
					dto = new MemberDto(id, pwd, nickname, name, phone, email);
				}
		} catch (Exception e) {
				e.printStackTrace();
		}
		return dto;
	}
	
	public void insertMember(MemberDto dto) {
		String sql = "insert into member values(?,?,?,?,?,?)";
		try(Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			) {
				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getPwd());
				pstmt.setString(3, dto.getNickname());
				pstmt.setString(4, dto.getName());
				pstmt.setString(5, dto.getPhone());
				pstmt.setString(6, dto.getEmail());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int loginMember(MemberDto dto) {
		String sql = "select pwd from member where id=?";
		try(Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			) {
				pstmt.setString(1, dto.getId());
				
				rs = pstmt.executeQuery();
			    if (rs.next()) {
			      if(rs.getString(1).equals(dto.getPwd())) {
			    	  return 1;	//로그인 성공
			      }else {
			    	  return 0;	//비밀번호 불일치
			      }
			    }
			    return -1;	//아이디가 없음
		}catch(Exception e){
			e.printStackTrace();
		}
		return -2; //데이터베이스오류의미
	}
	
	public void updateMember(MemberDto dto) {
		String sql = "update member set nickname=?, name=?, phone=?, email=?, pwd=? where id=?";
		try(Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);
			) {
				pstmt.setString(1, dto.getNickname());
				pstmt.setString(2, dto.getName());
				pstmt.setString(3, dto.getPhone());
				pstmt.setString(4, dto.getEmail());
				pstmt.setString(5, dto.getPwd());
				pstmt.setString(6, dto.getId());
				
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
	
	public void deleteMember(String id) {
		String sql = "delete from member where id=?";
		try(Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				) {
					pstmt.setString(1, id);
					pstmt.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				}
	}
}