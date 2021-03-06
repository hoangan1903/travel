package com.travel.service;

import com.travel.bean.ImageBean;
import com.travel.bean.TourBean;
import com.travel.bean.TourInfoBean;
import com.travel.dao.ImageDAO;
import com.travel.dao.TourDAO;
import com.travel.dao.TourInfoDAO;
import com.travel.enumerize.PagingSize;
import com.travel.enumerize.Status;
import com.travel.viewmodel.CreateTourRequest;
import com.travel.viewmodel.TourDetail;

import java.util.ArrayList;

public class TourService {
    TourDAO tourDAO = null;

    public TourService() throws Exception {
        tourDAO = new TourDAO();
    }

    public TourBean GetTourByID(int id) {
        return tourDAO.GetTourByID(id);
    }

    public ArrayList<TourBean> GetAllTours(int page, int perPage) {
        page = Math.max(page, 0);
        perPage = perPage < 0 ? 10 : perPage;

        return tourDAO.GetAllTours(page, perPage);
    }

    public ArrayList<TourBean> GetToursByName(String name, String fieldName, String sortType, int start, int size) {
        start = Math.max(start, 0);
        size = size < 0 ? 10 : size;
        fieldName = fieldName == null || fieldName.equals("") ? "name" : fieldName;
        sortType = sortType == null || sortType.equals("") ? "ASC" : sortType;
        String keyword = name.replace(" ", "&");
        String params = " ORDER BY " + fieldName + " " + sortType;

        return tourDAO.GetToursByName(keyword, params, start, size);
    }

    public ArrayList<TourBean> GetToursInProvinceByID(int provinceID, String fieldName, String sortType, int start, int size) {
        start = Math.max(start, 0);
        size = size < 0 ? 10 : size;
        fieldName = fieldName == null || fieldName.equals("") ? "name" : fieldName;
        sortType = sortType == null || sortType.equals("") ? "ASC" : sortType;
        String params = " ORDER BY " + fieldName + " " + sortType;

        return tourDAO.GetToursInProvinceByID(provinceID, params, start, size);
    }

    public ArrayList<TourBean> GetToursInProviceByName(String name, int provinceID, int page, int perPage) {
        page = Math.max(page, 0);
        perPage = perPage < 0 ? 10 : perPage;
        String keyword = name.replace(" ", "&");
        return tourDAO.GetToursInProvinceByName(keyword, provinceID, page, perPage);
    }

    public ArrayList<TourBean> GetToursByAreaID(int areaID, int limit) {
        limit = Math.max(limit, 3);
        ArrayList<TourBean> tours = tourDAO.GetTopToursByAreaID(areaID, limit);
        int length = tours.size();
        if (length == limit) {
            return tours;
        } else if (length == 0) {
            ArrayList<TourBean> addedTours = tourDAO.GetTourByAreaID(areaID, limit);
            tours.addAll(addedTours);
        } else if (length > 0 && length < limit) {
            String params = parseTourIDToString(tours);
            ArrayList<TourBean> addedTours = tourDAO.GetToursExcludingIDs(params, areaID, limit - tours.size());
            tours.addAll(addedTours);
        }
        return tours;
    }

    public ArrayList<TourBean> GetToursTopOrder(int limit) {
        limit = Math.max(limit, 6);
        ArrayList<TourBean> tours = tourDAO.GetToursTopOrder(limit);
        int length = tours.size();
        if (length == limit) {
            return tours;
        } else if (length == 0) {
            ArrayList<TourBean> addedTours = tourDAO.GetAllTours(0, limit);
            tours.addAll(addedTours);
        } else if (length > 0 && length < limit) {
            String params = parseTourIDToString(tours);
            ArrayList<TourBean> addedTours = tourDAO.GetToursExcludingIDs(params, 3, limit - tours.size());
            tours.addAll(addedTours);
        }
        return tours;
    }

    public ArrayList<TourBean> GetToursByListIDs(int[] ids) {
        if (ids.length == 0) {
            return null;
        }

        String params = parseListIntToStringQuery(ids);
        return tourDAO.GetToursByListIDs(params);
    }

    public boolean CreateTour(CreateTourRequest request) {
        TourBean tour = new TourBean(request.getName(), request.getImage(), request.getProvinceID());
        int tourID = tourDAO.CreateTour(tour);
        if (tourID == 0) {
            return false;
        }

        TourInfoBean tourInfo = new TourInfoBean(request.getTitle(), request.getDetail(), request.getPrice(), Status.ACTIVE.getValue(), tourID);
        int tourInfoID;
        try {
            tourInfoID = new TourInfoDAO().CreateTourInfo(tourInfo);
            if (tourInfoID == 0) {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        ArrayList<ImageBean> images = request.getImages();
        String paramsInsertImages = parseInsertImage(images, tourInfoID);
        try {
            new ImageDAO().CreateImage(paramsInsertImages);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return true;
    }

    public boolean UpdateTour(CreateTourRequest request, int tourID) {
        boolean success = tourDAO.UpdateTour(request, tourID);
        if (!success) {
            return false;
        }

        try {
            success = new TourInfoDAO().UpdateTourInfoByTourID(request, tourID);
            if (!success) {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        ArrayList<ImageBean> images = request.getImages();
        TourInfoBean tourInfo = null;
        try {
            tourInfo = new TourInfoDAO().GetTourInfoByTourID(tourID);
        } catch (Exception e) {
            e.printStackTrace();
        }
        String paramsInsertImages = parseInsertImage(images, tourInfo.getId());
        try {
            success = new ImageDAO().UpdateImages(paramsInsertImages, tourInfo.getId());
            if (!success) {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return true;
        }

        return true;
    }

    // Sample: GetAllTourHaveSorting("name", "ASC", 1, 0, 5)
    public ArrayList<TourDetail> GetAllTourHaveSorting(String fieldName, String sortType, int status, int page, int perPage) {
        page = Math.max(page, 0);
        perPage = perPage < 0 ? 10 : perPage;
        fieldName = ((fieldName == null) || (fieldName == "")) ? "name" : fieldName;
        sortType = ((sortType == null) || (sortType == "")) ? "ASC" : sortType;
        status = status < 0 ? 2 : status;

        String params = status == 2 ? "" : " WHERE status = " + status;
        params = params + " ORDER BY " + fieldName + " " + sortType;

        return tourDAO.GetAllToursHaveSorting(params, page, perPage);
    }

    public boolean DeactivateTour(int tourID) {
        if (tourID <= 0) {
            return false;
        }

        return tourDAO.UpdateTourStatus(tourID, Status.DEACTIVE);
    }

    public boolean ActiveTour(int tourID) {
        if (tourID <= 0) {
            return false;
        }

        return tourDAO.UpdateTourStatus(tourID, Status.ACTIVE);
    }

    public CreateTourRequest GetTourInfoByID(int tourID) {
        if (tourID <= 0) {
            return null;
        }

        return tourDAO.GetTourDetailByID(tourID);
    }

    private String parseTourIDToString(ArrayList<TourBean> tours) {
        StringBuilder builder = new StringBuilder();
        for (TourBean tour : tours) {
            builder.append(tour.getId() + ",");
        }
        builder.deleteCharAt(builder.length() - 1);

        return builder.toString();
    }

    private String parseListIntToStringQuery(int[] ids) {
        StringBuilder builder = new StringBuilder();
        for (int id : ids) {
            builder.append(id + ",");
        }
        builder.deleteCharAt(builder.length() - 1);

        return builder.toString();
    }

    public String parseInsertImage(ArrayList<ImageBean> images, int tourInfoID) {
        StringBuilder builder = new StringBuilder();
        for (ImageBean image : images) {
            image.setTourInfoID(tourInfoID);
            image.setDescription(image.getDescription().replace("'", ""));
            builder.append(" (\'" + image.getUrl() + "\', " + image.getTourInfoID() + ", \'" + image.getDescription() + "\', now(), now()),");
        }
        builder.deleteCharAt(builder.length() - 1);

        return builder.toString();
    }

    public ArrayList<TourDetail> GetTourInAdminPageByKeyword(String keyword, int start, int size) {
        if (keyword.equals("")) {
            return GetAllTourHaveSorting("name", "asc", 2, 0, PagingSize.ADMIN_TOURS.getValue());
        }

        keyword = keyword.replace(" ", "&");
        start = Math.max(start, 0);
        size = size < 0 ? 10 : size;

        return tourDAO.GetTourInAdminPageByKeyword(keyword, start, size);
    }

}
