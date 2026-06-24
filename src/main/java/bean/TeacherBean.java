package bean;

import java.io.Serializable;

public class TeacherBean implements Serializable {
    private static final long serialVersionUID = 1L;
    private String id;
    private String password;
    private String name;
    private String schoolCode;

    public String getId() { return id; }
    public void setId(String id) { this.id = id; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getSchoolCode() { return schoolCode; }
    public void setSchoolCode(String schoolCode) { this.schoolCode = schoolCode; }
}
