package com.travel.dao;

import com.travel.dbconnection.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class BaseDAO {
    private Connection connection = null;

    public BaseDAO() throws Exception {
        try {
            connection = DBConnection.getConnect();
        } catch (Exception e) {
            System.out.println("Failed to connection database: " + e.getMessage());
            e.printStackTrace();
            throw e;
        }
    }

    static void closeConnection(PreparedStatement preparedStatement, Connection connection) {
        try {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
