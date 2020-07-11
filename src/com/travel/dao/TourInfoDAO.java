package com.travel.dao;

import com.travel.bean.TourBean;
import com.travel.bean.TourInfoBean;
import com.travel.dbconnection.DBConnection;
import com.travel.enumerize.Status;
import org.postgresql.ds.common.BaseDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TourInfoDAO extends BaseDAO {
    Connection connection = null;
    PreparedStatement preparedStatement = null;


    public TourInfoDAO() throws Exception {
        super();
    }


    public int CreateTourInfo(TourInfoBean tourInfo){
        int id = 0;
        try {
            connection = DBConnection.getConnect();
            String sql = "INSERT INTO tour_infos (title, detail, price, status, tour_id, created_at, updated_at)"
                   + " VALUES (?, ?, ?, ?, ?, now(), now();)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, tourInfo.getTitle());
            preparedStatement.setString(2, tourInfo.getDetail());
            preparedStatement.setLong(3, tourInfo.getPrice());
            preparedStatement.setInt(4, tourInfo.getStatus());
            preparedStatement.setInt(5, tourInfo.getTourID());

            try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    id = generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Creating tour info failed, no ID obtained.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return -1;
        } finally {
            BaseDAO.closeConnection(preparedStatement, connection);
        }

        return id;
    }

    public TourInfoBean GetTourInfoByTourID(int tourID) {
        TourInfoBean tourInfo = null;
        try {
            this.connection = DBConnection.getConnect();
            String sql = "SELECT * FROM tour_infos WHERE tour_id = ? AND status = ?;";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, tourID);
            preparedStatement.setInt(2, Status.ACTIVE.getValue());

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String title = rs.getString("title");
                String detail = rs.getString("detail");
                long price = rs.getLong("price");
                tourInfo = new TourInfoBean(id, title, detail, price, Status.ACTIVE.getValue(), tourID, null);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseDAO.closeConnection(preparedStatement, connection);
        }

        return tourInfo;
    }
}
