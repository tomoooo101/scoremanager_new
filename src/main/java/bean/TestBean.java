package bean;

import java.io.Serializable;

public class TestBean implements Serializable {

    private String studentNo;
    private String subjectCd;
    private int no;
    private int point;
    private String classNum;
    private String schoolCode;

    public TestBean() {
    }

    public String getStudentNo() {
        return studentNo;
    }

    public void setStudentNo(String studentNo) {
        this.studentNo = studentNo;
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

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    public String getClassNum() {
        return classNum;
    }

    public void setClassNum(String classNum) {
        this.classNum = classNum;
    }
    
    public String getSchoolCode() {
        return schoolCode;
    }

    public void setSchoolCode(String schoolCode) {
        this.schoolCode = schoolCode;
    }
}