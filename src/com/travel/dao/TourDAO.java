package com.travel.dao;

import com.travel.bean.ImageBean;
import com.travel.dbconnection.DBConnection;
import com.travel.bean.TourBean;
import com.travel.enumerize.Status;
import com.travel.viewmodel.CreateTourRequest;
import com.travel.viewmodel.TourDetail;

import java.sql.*;
import java.util.ArrayList;

public class TourDAO extends BaseDAO {
    Connection connection = null;
    PreparedStatement preparedStatement = null;

    public TourDAO() throws Exception {
        super();
    }

    public ArrayList<TourBean> GetAllTours(int page, int perPage) {
        ArrayList<TourBean> tours = new ArrayList<>();
        try {
            connection = DBConnection.getConnect();
            String sql = "SELECT * FROM tours t INNER JOIN tour_infos ti ON t.id = ti.tour_id ORDER BY status DESC, name ASC LIMIT ? OFFSET ?;";

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, page * perPage + perPage);
            preparedStatement.setInt(2, page * perPage);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String image = rs.getString("image");
                int provinceID = rs.getInt("province_id");
                long price = rs.getLong("price");
                tours.add(new TourBean(id, name, image, provinceID, price));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            BaseDAO.closeConnection(preparedStatement, connection);
        }

        return tours;
    }

    public TourBean GetTourByID(int id) {
        TourBean tourBean = null;
        try {
            connection = DBConnection.getConnect();
            String sql = "SELECT * FROM tours t INNER JOIN tour_infos ti ON t.id = ti.tour_id WHERE t.id = ?;";

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String image = rs.getString("image");
                int provinceID = rs.getInt("province_id");
                long price = rs.getLong("price");
                tourBean = new TourBean(name, image, provinceID, price);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseDAO.closeConnection(preparedStatement, connection);
        }
        return tourBean;
    }

    public ArrayList<TourBean> GetToursByName(String name, String params, int start, int size) {
        ArrayList<TourBean> listTours = new ArrayList<>();
        try {
            connection = DBConnection.getConnect();
            String sql = "SELECT * FROM tours t INNER JOIN tour_infos ti ON t.id = ti.tour_id "
                    + " WHERE to_tsvector(convertnonunicode(name)) @@ to_tsquery(convertnonunicode(?))"
                    + params
                    + " LIMIT ? OFFSET ?";

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, name);
            preparedStatement.setInt(2, size);
            preparedStatement.setInt(3, start);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String tourName = rs.getString("name");
                String image = rs.getString("image");
                int provinceID = rs.getInt("province_id");
                long price = rs.getLong("price");
                listTours.add(new TourBean(id, tourName, image, provinceID, price));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            BaseDAO.closeConnection(preparedStatement, connection);
        }

        return listTours;
    }

    public ArrayList<TourBean> GetToursInProvinceByID(int provinceID, String params, int start, int size) {
        ArrayList<TourBean> listTours = new ArrayList<>();
        try {
            connection = DBConnection.getConnect();
            String sql = "SELECT * FROM tours t INNER JOIN tour_infos ti ON t.id = ti.tour_id "
                    + " WHERE t.province_id = ? AND ti.status = ? "
                    + params
                    + " LIMIT ? OFFSET ?;";

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, provinceID);
            preparedStatement.setInt(2, Status.ACTIVE.getValue());
            preparedStatement.setInt(3, size);
            preparedStatement.setInt(4, start);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String tourName = rs.getString("name");
                String image = rs.getString("image");
                long price = rs.getLong("price");
                listTours.add(new TourBean(id, tourName, image, provinceID, price));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            BaseDAO.closeConnection(preparedStatement, connection);
        }
        return listTours;
    }

    public ArrayList<TourBean> GetToursInProvinceByName(String name, int provinceID, int page, int perPage) {
        ArrayList<TourBean> listTours = new ArrayList<>();
        try {
            connection = DBConnection.getConnect();
            String sql = "SELECT * FROM tours t INNER JOIN tour_infos ti ON t.id = ti.tour_id "
                    + " WHERE to_tsvector(convertnonunicode(name)) @@ to_tsquery(convertnonunicode(?))"
                    + " AND t.province_id = ? AND ti.status = ? ORDER BY NAME ASC LIMIT ? OFFSET ?;";

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, name);
            preparedStatement.setInt(2, provinceID);
            preparedStatement.setInt(3, Status.ACTIVE.getValue());
            preparedStatement.setInt(4, page * perPage + perPage);
            preparedStatement.setInt(5, page * perPage);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String tourName = rs.getString("name");
                String image = rs.getString("image");
                long price = rs.getLong("price");
                listTours.add(new TourBean(id, tourName, image, provinceID, price));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            BaseDAO.closeConnection(preparedStatement, connection);
        }
        return listTours;
    }

    public ArrayList<TourBean> GetTopToursByAreaID(int areaID, int limit) {
        ArrayList<TourBean> tours = new ArrayList<>();
        try {
            connection = DBConnection.getConnect();
            String sql = "SELECT * FROM ("
                    + " SELECT t.id, a.name AS area_name, COUNT(t.id) as c FROM orders o inner join tours t on o.tour_id = t.id"
                    + " INNER JOIN provinces p ON t.province_id = p.id"
                    + " INNER JOIN areas a ON p.area_id = a.id"
                    + " WHERE a.id = ?"
                    + " GROUP BY t.id, a.name"
                    + " ORDER BY count(t.id) DESC"
                    + " LIMIT ?"
                    + " ) AS tem INNER JOIN tours ON tem.id =tours.id"
                    + " INNER JOIN tour_infos ti ON tours.id = ti.tour_id"
                    + " WHERE ti.status = ? ORDER BY tem.c DESC;";

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, areaID);
            preparedStatement.setInt(2, limit);
            preparedStatement.setInt(3, Status.ACTIVE.getValue());

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String image = rs.getString("image");
                int provinceID = rs.getInt("province_id");
                long price = rs.getLong("price");
                tours.add(new TourBean(id, name, image, provinceID, price));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseDAO.closeConnection(preparedStatement, connection);
        }

        return tours;
    }

    public ArrayList<TourBean> GetToursTopOrder(int limit) {
        ArrayList<TourBean> tours = new ArrayList<>();
        try {
            connection = DBConnection.getConnect();
            String sql = "SELECT * FROM ("
                    + " SELECT t.id, count(t.id) as c FROM orders o INNER JOIN tours t ON o.tour_id = t.id"
                    + " INNER JOIN provinces p ON t.province_id = p.id"
                    + " GROUP BY t.id "
                    + " ORDER BY count(t.id) DESC "
                    + " LIMIT ?"
                    + " ) AS tem INNER JOIN tours ON tem.id = tours.id"
                    + " INNER JOIN tour_infos ti ON tours.id = ti.tour_id"
                    + " WHERE ti.status = ? ORDER BY c DESC;";

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, limit);
            preparedStatement.setInt(2, Status.ACTIVE.getValue());

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String image = rs.getString("image");
                int provinceID = rs.getInt("province_id");
                long price = rs.getLong("price");
                tours.add(new TourBean(id, name, image, provinceID, price));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseDAO.closeConnection(preparedStatement, connection);
        }

        return tours;
    }

    public ArrayList<TourBean> GetTourByAreaID(int areaID, int limit) {
        ArrayList<TourBean> tours = new ArrayList<>();
        try {
            connection = DBConnection.getConnect();
            String sql = "SELECT t.*, ti.price FROM tours t INNER JOIN provinces p ON t.province_id = p.id"
                    + " INNER JOIN areas a ON p.area_id = a.id"
                    + " INNER JOIN tour_infos ti ON t.id = ti.tour_id"
                    + " WHERE a.id = ? AND ti.status = ? ORDER BY t.id ASC LIMIT ?;";

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, areaID);
            preparedStatement.setInt(2, Status.ACTIVE.getValue());
            preparedStatement.setInt(3, limit);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String image = rs.getString("image");
                int provinceID = rs.getInt("province_id");
                long price = rs.getLong("price");
                tours.add(new TourBean(id, name, image, provinceID, price));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseDAO.closeConnection(preparedStatement, connection);
        }
        return tours;
    }

    public ArrayList<TourBean> GetToursExcludingIDs(String params, int areaID, int limit) {
        ArrayList<TourBean> tours = new ArrayList<>();
        try {
            connection = DBConnection.getConnect();
            String sql = "SELECT t.*, ti.price FROM tours t INNER JOIN provinces p ON t.province_id = p.id "
                    + " INNER JOIN areas a ON p.area_id = a.id"
                    + " INNER JOIN tour_infos ti ON t.id = ti.tour_id"
                    + " WHERE a.id = ? AND t.id NOT IN("
                    + params
                    + ") AND ti.status = ? ORDER BY id ASC LIMIT ?;";

            preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setInt(1, areaID);
            preparedStatement.setInt(2, Status.ACTIVE.getValue());
            preparedStatement.setInt(3, limit);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String image = rs.getString("image");
                int provinceID = rs.getInt("province_id");
                long price = rs.getLong("price");
                tours.add(new TourBean(id, name, image, provinceID, price));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseDAO.closeConnection(preparedStatement, connection);
        }

        return tours;
    }

    public boolean UpdateTourStatus(int tourID, Status status) {
        try {
            connection = DBConnection.getConnect();
            String sql = "UPDATE tour_infos SET status = ?, updated_at = now() WHERE tour_id = ?;";

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, status.getValue());
            preparedStatement.setInt(2, tourID);

            int affectedRows = preparedStatement.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Deactivate tour failed, no rows affected.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            BaseDAO.closeConnection(preparedStatement, connection);
        }

        return true;
    }

    public ArrayList<TourDetail> GetAllToursHaveSorting(String params, int page, int perPage) {
        ArrayList<TourDetail> listTours = new ArrayList<>();
        try {
            connection = DBConnection.getConnect();
            String sql = "SELECT t.id, t.name, ti.title, ti.price, ti.status, p.name as province FROM tours t "
                    + " INNER JOIN tour_infos ti ON t.id = ti.tour_id "
                    + " INNER JOIN provinces p on t.province_id = p.id "
                    + params
                    + " LIMIT ? OFFSET ?";

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, page * perPage + perPage);
            preparedStatement.setInt(2, page * perPage);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String tourName = rs.getString("name");
                String title = rs.getString("title");
                String province = rs.getString("province");
                long price = rs.getLong("price");
                int status = rs.getInt("status");
                listTours.add(new TourDetail(id, tourName, title, province, price, status));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseDAO.closeConnection(preparedStatement, connection);
        }

        return listTours;
    }

    public ArrayList<TourBean> GetToursByListIDs(String params) {
        ArrayList<TourBean> tours = new ArrayList<>();
        try {
            connection = DBConnection.getConnect();
            String sql = "SELECT t.*, ti.price FROM tours t INNER JOIN tour_infos ti ON t.id = ti.tour_id WHERE ti.status = ? AND t.id IN ("
                    + params
                    + " ) ORDER BY price DESC;";

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, Status.ACTIVE.getValue());

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String image = rs.getString("image");
                int provinceID = rs.getInt("province_id");
                long price = rs.getLong("price");
                tours.add(new TourBean(id, name, image, provinceID, price));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            BaseDAO.closeConnection(preparedStatement, connection);
        }

        return tours;
    }

    public int CreateTour(TourBean tour) {
        int id = 0;
        try {
            connection = DBConnection.getConnect();
            String sql = "INSERT INTO tours (name, image, province_id, created_at, updated_at) VALUES (?, ?, ?, now(), now());";

            preparedStatement = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            preparedStatement.setString(1, tour.getName());
            preparedStatement.setString(2, tour.getImage());
            preparedStatement.setInt(3, tour.getProvinceID());
            preparedStatement.executeUpdate();

            try (ResultSet generatedKeys = preparedStatement.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    id = generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Creating tour failed, no ID obtained.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return 0;
        } finally {
            BaseDAO.closeConnection(preparedStatement, connection);
        }

        return id;
    }

    public CreateTourRequest GetTourDetailByID(int tourID) {
        CreateTourRequest tour = null;
        int tourInfoID = -1;
        try {
            connection = DBConnection.getConnect();
            String sql = "SELECT t.id, t.name, t.image, p.id as province_id, p.name as province_name, ti.title, ti.detail, ti.price, ti.id as ti_id"
                    + " FROM tours t INNER JOIN tour_infos ti ON t.id = ti.tour_id"
                    + " INNER JOIN provinces p on t.province_id = p.id WHERE t.id = ?;";

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, tourID);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String image = rs.getString("image");
                int provinceID = rs.getInt("province_id");
                String provinceName = rs.getString("province_name");
                String title = rs.getString("title");
                String detail = rs.getString("detail");
                long price = rs.getLong("price");
                tourInfoID = rs.getInt("ti_id");
                tour = new CreateTourRequest(id, name, image, provinceID, provinceName, title, detail, price, tourInfoID);
            }

            if (tourInfoID > 0) {
                ArrayList<ImageBean> images = new ImageDAO().GetImagesByTourInfoID(tourInfoID);
                tour.setImages(images);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            BaseDAO.closeConnection(preparedStatement, connection);
        }

        return tour;
    }

    public boolean UpdateTour(CreateTourRequest tour, int tourID) {
        try {
            connection = DBConnection.getConnect();
            String sql = "UPDATE tours SET name = ?, image = ?, province_id = ?, updated_at = now() WHERE id = ?;";

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, tour.getName());
            preparedStatement.setString(2, tour.getImage());
            preparedStatement.setInt(3, tour.getProvinceID());
            preparedStatement.setInt(4, tourID);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            BaseDAO.closeConnection(preparedStatement, connection);
        }

        return true;
    }

    public ArrayList<TourDetail> GetTourInAdminPageByKeyword(String keyword, int start, int size) {
        ArrayList<TourDetail> listTours = new ArrayList<>();
        try {
            connection = DBConnection.getConnect();
            String sql = "SELECT t.id, t.name, ti.title, ti.price, ti.status, p.name as province FROM tours t "
                    + " INNER JOIN tour_infos ti ON t.id = ti.tour_id "
                    + " INNER JOIN provinces p on t.province_id = p.id "
                    + " WHERE to_tsvector(convertnonunicode(t.name)) @@ to_tsquery(convertnonunicode(?))"
                    + " ORDER BY t.name ASC LIMIT ? OFFSET ?;";

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, keyword);
            preparedStatement.setInt(2, size);
            preparedStatement.setInt(3, start);

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String tourName = rs.getString("name");
                String title = rs.getString("title");
                String province = rs.getString("province");
                long price = rs.getLong("price");
                int status = rs.getInt("status");
                listTours.add(new TourDetail(id, tourName, title, province, price, status));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            BaseDAO.closeConnection(preparedStatement, connection);
        }

        return listTours;
    }
}
