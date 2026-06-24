package bean;

import java.io.Serializable;

public class StudentScoreBean implements Serializable {

    private String studentNo;
    private String studentName;
    private String classNum;
    private String subjectName;
    private int testNo;
    private int point;
    private String subjectCd;
    private int no;
    private String schoolCode;


    public StudentScoreBean() {
    }

    public String getStudentNo() {
        return studentNo;
    }

    public void setStudentNo(String studentNo) {
        this.studentNo = studentNo;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getClassNum() {
        return classNum;
    }

    public void setClassNum(String classNum) {
        this.classNum = classNum;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public int getTestNo() {
        return testNo;
    }

    public void setTestNo(int testNo) {
        this.testNo = testNo;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }
    
    public String getSubjectCd() {
        return subjectCd;
    }

    public void setSubjectCd(String subjectCd) {
        this.subjectCd = subjectCd;
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getSchoolCode() {
        return schoolCode;
    }

    public void setSchoolCode(String schoolCode) {
        this.schoolCode = schoolCode;
    }
}