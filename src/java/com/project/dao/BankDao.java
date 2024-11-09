package com.project.dao;

import java.sql.*;
import com.project.entities.Bank;

public class BankDao {

    private Connection con;

    public BankDao(Connection con) {
        this.con = con;
    }

    //Method to fetch bank details
    public Bank getBankDetails(String cardNumber) {
        Bank bank = null;
        try {
            String query = "SELECT * FROM bankdetails WHERE card_number = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, cardNumber);

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {

                bank = new Bank();

                bank.setCardHolderName(set.getString("cardholder_name"));
                bank.setCardNumber(set.getString("card_number"));
                bank.setExpiryDate(set.getString("expiration_date"));
                bank.setCvv(set.getString("cvv"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return bank;
    }

}
