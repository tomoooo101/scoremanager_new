package bean;

import java.io.Serializable;

public class ClassNumBean implements Serializable {

    private String classNum;

    public ClassNumBean() {
    }

    public String getClassNum() {
        return classNum;
    }

    public void setClassNum(String classNum) {
        this.classNum = classNum;
    }
}