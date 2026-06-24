package bean;

import java.io.Serializable;

public class StudentBean implements Serializable {

    private int entYear;
    private String no;
    private String name;
    private String classNum;
    private boolean isAttend;
    private String schoolCode;

    public StudentBean() {
    }

    public int getEntYear() {
        return entYear;
    }

    public void setEntYear(int entYear) {
        this.entYear = entYear;
    }

    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getClassNum() {
        return classNum;
    }

    public void setClassNum(String classNum) {
        this.classNum = classNum;
    }
    
    public boolean isAttend() {
        return isAttend;
    }

    public void setIsAttend(boolean isAttend) {
        this.isAttend = isAttend;
    }

    public String getSchoolCode() {
        return schoolCode;
    }

    public void setSchoolCode(String schoolCode) {
        this.schoolCode = schoolCode;
    }
}