package cs.dit;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDao {

    private ResultSet rs;

    private Connection getConnection() throws Exception {
        InitialContext initCtx = new InitialContext();
        DataSource ds = (DataSource) initCtx.lookup("java:comp/env/jdbc/suuurin");
        Connection con = ds.getConnection();

        return con;
    }

    public BoardDto getOne(String regdate) {
        String sql = "SELECT subject, content, regdate, writer, recommand FROM sboard WHERE regdate=? union all "
              + "SELECT subject, content, regdate, writer, recommand FROM tboard WHERE regdate=? union all "
              + "SELECT subject, content, regdate, writer, recommand FROM qboard WHERE regdate=?";
        BoardDto dto = new BoardDto();

        try (Connection con = getConnection();
                PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, regdate);
            pstmt.setString(2, regdate);
            pstmt.setString(3, regdate);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    String subject = rs.getString("SUBJECT");
                    String content = rs.getString("CONTENT");
                    String regDate = rs.getString("REGDATE");
                    String writer = rs.getString("WRITER");
                    int recommand = rs.getInt("RECOMMAND");

                    dto = new BoardDto(subject, content, regDate, writer, recommand);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dto;
    }

    public void insertQBoard(BoardDto dto) {
        String sql = "INSERT INTO qboard (SUBJECT, CONTENT, WRITER) VALUES(?,?,?)";
        try (Connection con = getConnection();
                PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, dto.getSubject());
            pstmt.setString(2, dto.getContent());
            pstmt.setString(3, dto.getWriter());

            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void insertSBoard(BoardDto dto) {
        String sql = "INSERT INTO sboard (SUBJECT, CONTENT, WRITER) VALUES(?,?,?)";
        try (Connection con = getConnection();
                PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, dto.getSubject());
            pstmt.setString(2, dto.getContent());
            pstmt.setString(3, dto.getWriter());

            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void insertTBoard(BoardDto dto) {
        String sql = "INSERT INTO tboard (SUBJECT, CONTENT, WRITER) VALUES(?,?,?)";
        try (Connection con = getConnection();
                PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, dto.getSubject());
            pstmt.setString(2, dto.getContent());
            pstmt.setString(3, dto.getWriter());

            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public ArrayList<BoardDto> sboardList() {
       String sql = "select regdate, subject, writer from sboard order by regdate desc";
       ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
       
       try (Connection con = getConnection();
             Statement st = con.createStatement();
       ) {
          rs = st.executeQuery(sql);
          
          while(rs.next()) {
             String regDate = rs.getString("regdate");
             String subject = rs.getString("subject");
             String writer = rs.getString("writer");
             
             BoardDto dto = new BoardDto(regDate, subject, writer);
             dtos.add(dto);
          }
        } catch (Exception e) {
            e.printStackTrace();
        }
       return dtos;
   }
    
    public ArrayList<BoardDto> tboardList() {
       String sql = "select regdate, subject, writer from tboard order by regdate desc";
       ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
       
       try (Connection con = getConnection();
             Statement st = con.createStatement();
       ) {
          rs = st.executeQuery(sql);
          
          while(rs.next()) {
             String regDate = rs.getString("regdate");
             String subject = rs.getString("subject");
             String writer = rs.getString("writer");
             
             BoardDto dto = new BoardDto(regDate, subject, writer);
             dtos.add(dto);
          }
        } catch (Exception e) {
            e.printStackTrace();
        }
       return dtos;
   }
    
    public ArrayList<BoardDto> qboardList() {
       String sql = "select regdate, subject, writer from qboard order by regdate desc";
       ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
       
       try (Connection con = getConnection();
             Statement st = con.createStatement();
       ) {
          rs = st.executeQuery(sql);
          
          while(rs.next()) {
             String regDate = rs.getString("regdate");
             String subject = rs.getString("subject");
             String writer = rs.getString("writer");
             
             BoardDto dto = new BoardDto(regDate, subject, writer);
             dtos.add(dto);
          }
        } catch (Exception e) {
            e.printStackTrace();
        }
       return dtos;
   }
    
    public ArrayList<BoardDto> searchSboard(String search) {
       String sql = "select snum, subject, writer from sboard where subject like '%"+search+"%' order by regdate desc";
       ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
       
       try (Connection con = getConnection();
             Statement st = con.createStatement();
       ) {
          rs = st.executeQuery(sql);
          
          while(rs.next()) {
             int snum = rs.getInt("snum");
             String subject = rs.getString("subject");
             String writer = rs.getString("writer");
             
             BoardDto dto = new BoardDto(snum, subject, writer);
             dtos.add(dto);
          }
        } catch (Exception e) {
            e.printStackTrace();
        }
       return dtos;
   }
    
    public ArrayList<BoardDto> searchTboard(String search) {
       String sql = "select tnum, subject, writer from tboard where subject like '%"+search+"%' order by regdate desc";
       ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
       
       try (Connection con = getConnection();
             Statement st = con.createStatement();
       ) {
          rs = st.executeQuery(sql);
          
          while(rs.next()) {
             int tnum = rs.getInt("tnum");
             String subject = rs.getString("subject");
             String writer = rs.getString("writer");
             
             BoardDto dto = new BoardDto(tnum, subject, writer);
             dtos.add(dto);
          }
        } catch (Exception e) {
            e.printStackTrace();
        }
       return dtos;
   }
    
    public ArrayList<BoardDto> searchQboard(String search) {
       String sql = "select qnum, subject, writer from qboard where subject like '%"+search+"%' order by regdate desc";
       ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
       
       try (Connection con = getConnection();
             Statement st = con.createStatement();
       ) {
          rs = st.executeQuery(sql);
          
          while(rs.next()) {
             int qnum = rs.getInt("qnum");
             String subject = rs.getString("subject");
             String writer = rs.getString("writer");
             
             BoardDto dto = new BoardDto(qnum, subject, writer);
             dtos.add(dto);
          }
        } catch (Exception e) {
            e.printStackTrace();
        }
       return dtos;
   }
    
    public ArrayList<BoardDto> mainList() {
       String sql = "select regdate, subject, writer from sboard union all "
             + "select regdate, subject, writer from tboard union all "
             + "select regdate, subject, writer from qboard "
             + "order by regdate desc limit 3";
       ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
       
       try (Connection con = getConnection();
             Statement st = con.createStatement();
       ) {
          rs = st.executeQuery(sql);
          
          while(rs.next()) {
             String regDate = rs.getString("regdate");
             String subject = rs.getString("subject");
             String writer = rs.getString("writer");
             
             BoardDto dto = new BoardDto(regDate, subject, writer);
             dtos.add(dto);
          }
        } catch (Exception e) {
            e.printStackTrace();
        }
       return dtos;
   }
    
    public ArrayList<BoardDto> searchMypage(String name) {
       String sql = "select regdate, subject, writer from sboard where writer like '%"+name+"%' union all "
             + "select regdate, subject, writer from tboard where writer like '%"+name+"%' union all "
             + "select regdate, subject, writer from qboard where writer like '%"+name+"%' "
             + "order by regdate desc";
       ArrayList<BoardDto> dtos = new ArrayList<BoardDto>();
       
       try (Connection con = getConnection();
             Statement st = con.createStatement();
       ) {
          rs = st.executeQuery(sql);
          
          while(rs.next()) {
             String regDate = rs.getString("regdate");
             String subject = rs.getString("subject");
             String writer = rs.getString("writer");
             
             BoardDto dto = new BoardDto(regDate, subject, writer);
             dtos.add(dto);
          }
        } catch (Exception e) {
            e.printStackTrace();
        }
       return dtos;
   }
}