package com.travel.dao;

import com.travel.bean.CommentBean;
import com.travel.dbconnection.DBConnection;
import com.travel.enumerize.Status;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CommentDAO extends BaseDAO {
    Connection connection = null;
    PreparedStatement preparedStatement = null;

    public CommentDAO() throws Exception {
        super();
    }

    public boolean CreateComment(CommentBean comment) {
        try {
            connection = DBConnection.getConnect();
            String sql = "INSERT INTO comments (user_name, content, tour_info_id, status, created_at, updated_at)"
                    + " VALUES (?, ?, ?, ?, now(), now())";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, comment.getUserName());
            preparedStatement.setString(2, comment.getContent());
            preparedStatement.setInt(3, comment.getTourInfoID());
            preparedStatement.setInt(4, Status.ACTIVE.getValue());
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            BaseDAO.closeConnection(preparedStatement, connection);
        }

        return true;
    }

    public ArrayList<CommentBean> GetComments(int page, int perPage) {
        ArrayList<CommentBean> comments = new ArrayList<>();
        try {
            connection = DBConnection.getConnect();
            String sql = "SELECT * FROM comments ORDER BY CREATED_AT DESC LIMIT ? OFFSET";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, page * perPage + perPage);
            preparedStatement.setInt(2, page * perPage);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String userName = rs.getString("user_name");
                String content = rs.getString("content");
                int tourInfoID = rs.getInt("tour_info_id");
                int status = rs.getInt("status");
                comments.add(new CommentBean(id, userName, content, tourInfoID, status));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseDAO.closeConnection(preparedStatement, connection);
        }

        return comments;
    }

    public boolean DeactivateComment(int commentID){
        try {
            connection = DBConnection.getConnect();
            String sql = "UPDATE comments SET status = ?, updated_at = now() WHERE id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, Status.DEACTIVE.getValue());
            preparedStatement.setInt(2, commentID);
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            BaseDAO.closeConnection(preparedStatement, connection);
        }

        return true;
    }
}