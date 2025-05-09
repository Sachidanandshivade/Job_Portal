package com.entity;

public class Jobs {
    private int id;
    private String title;
    private String description;
    private String location;
    private String category;
    private String status;
    private String pdate;
    private String userEmail; // New field

    public Jobs() {
        super();
    }

    
    public Jobs(String title, String description, String category, String status, String location, String userEmail) {
        this.title = title;
        this.description = description;
        this.category = category;
        this.status = status;
        this.location = location;
        this.userEmail = userEmail;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPdate() {
        return pdate;
    }

    public void setPdate(String pdate) {
        this.pdate = pdate;
    }

    public String getUserEmail() { // Getter for userEmail
        return userEmail;
    }

    public void setUserEmail(String userEmail) { // Setter for userEmail
        this.userEmail = userEmail;
    }
}
