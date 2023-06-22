package cs.dit;

import java.sql.Timestamp;

public class BoardDto {
    private int qNum;
    private String subject;
    private String content;
    private Timestamp regDate;
    private String writer;
    private int recommand;
    
    public BoardDto() {
    }

    public BoardDto(int qNum, String subject, String content, String regDate, String writer, int recommand) {
        this.qNum = qNum;
        this.subject = subject;
        this.content = content;
        this.regDate = Timestamp.valueOf(regDate);
        this.writer = writer;
        this.recommand = recommand;
    }
    
    public BoardDto(String subject, String content, String regDate, String writer, int recommand) {
        this.subject = subject;
        this.content = content;
        this.regDate = Timestamp.valueOf(regDate);
        this.writer = writer;
        this.recommand = recommand;
    }
    
    public BoardDto(int qNum, String subject, String writer) {
        this.qNum = qNum;
        this.subject = subject;
        this.writer = writer;
    }
    
    public BoardDto(String regDate, String subject, String writer) {
        this.regDate = Timestamp.valueOf(regDate);
        this.subject = subject;
        this.writer = writer;
    }
    
    public int getQNum() {
        return qNum;
    }

    public void setQNum(int qNum) {
        this.qNum = qNum;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getRegDate() {
        return regDate;
    }

    public void setRegDate(Timestamp regDate) {
        this.regDate = regDate;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public int getRecommand() {
        return recommand;
    }

    public void setRecommand(int recommand) {
        this.recommand = recommand;
    }
}