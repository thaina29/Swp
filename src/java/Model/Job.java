/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Legion
 */
public class Job {
    private int jobID;
    private int companyID;
    private String jobTitle;
    private String jobDescription;
    private String location;
    private String salaryRange;
    private String jobType;
    private String experienceLevel;
    private String requiredSkills;
    private java.sql.Timestamp postedDate;
    private java.sql.Timestamp applicationDeadline;
    private boolean isRemote;

    // Constructor
    public Job() {}

    // Getters and Setters
    public int getJobID() {
        return jobID;
    }

    public void setJobID(int jobID) {
        this.jobID = jobID;
    }

    public int getCompanyID() {
        return companyID;
    }

    public void setCompanyID(int companyID) {
        this.companyID = companyID;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public String getJobDescription() {
        return jobDescription;
    }

    public void setJobDescription(String jobDescription) {
        this.jobDescription = jobDescription;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getSalaryRange() {
        return salaryRange;
    }

    public void setSalaryRange(String salaryRange) {
        this.salaryRange = salaryRange;
    }

    public String getJobType() {
        return jobType;
    }

    public void setJobType(String jobType) {
        this.jobType = jobType;
    }

    public String getExperienceLevel() {
        return experienceLevel;
    }

    public void setExperienceLevel(String experienceLevel) {
        this.experienceLevel = experienceLevel;
    }

    public String getRequiredSkills() {
        return requiredSkills;
    }

    public void setRequiredSkills(String requiredSkills) {
        this.requiredSkills = requiredSkills;
    }

    public java.sql.Timestamp getPostedDate() {
        return postedDate;
    }

    public void setPostedDate(java.sql.Timestamp postedDate) {
        this.postedDate = postedDate;
    }

    public java.sql.Timestamp getApplicationDeadline() {
        return applicationDeadline;
    }

    public void setApplicationDeadline(java.sql.Timestamp applicationDeadline) {
        this.applicationDeadline = applicationDeadline;
    }

    public boolean isRemote() {
        return isRemote;
    }

    public void setRemote(boolean isRemote) {
        this.isRemote = isRemote;
    }
}

