package com.project.dao;

import java.sql.*;
import com.project.entities.User;

public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    //method to insert user data
    public boolean saveUser(User user) {
        boolean isQueryExecute = false;
        try {
            String query = "INSERT INTO user(fullname, email, contactno, password) VALUES(?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getFullName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getContactNo());
            pstmt.setString(4, user.getPassword());

            pstmt.executeUpdate();
            isQueryExecute = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isQueryExecute;
    }

    //Get user by email and password
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;

        try {

            String query = "SELECT * FROM user WHERE email = ? and password = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {

                user = new User();

                // data from db
                String fullName = set.getString("fullname");
                int userId = Integer.parseInt(set.getString("userid"));
                String userRole = set.getString("userrole");
                String userEmail = set.getString("email");
                String userContact = set.getString("contactno");
                Timestamp regDate = set.getTimestamp("regdate");

                //set to user object
                user.setFullName(fullName);
                user.setUserRole(userRole);
                user.setId(userId);
                user.setEmail(userEmail);
                user.setContactNo(userContact);
                user.setRegDate(regDate);
                
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
    
    //Method to update user password
    public boolean updatePassword(String currentPassword, String newPassword, String email) {
        
        boolean isQueryExecute = false;
        User user = null;
        user = getUserByEmailAndPassword(email, currentPassword);
        
        if(user == null) {
            return isQueryExecute;
        }
        
        try {
            String query = "UPDATE user SET password = ? WHERE email = ?";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, newPassword);
            pstmt.setString(2, email);
           
            pstmt.executeUpdate();
            isQueryExecute = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return isQueryExecute;
    }
}
