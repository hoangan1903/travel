package com.travel.servlet.admin;

import com.travel.dao.AreaDAO;
import com.travel.dao.HomeProvinceDAO;
import com.travel.helper.SessionHelpers;
import com.travel.service.OrderService;
import com.travel.service.UserService;
import com.travel.viewmodel.ChartValue;
import com.travel.viewmodel.OrderDetail;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/admin/Dashboard")
public class AdminDashboardServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {

        HttpSession currentSession = request.getSession(false);
        boolean isAuthenticated = SessionHelpers.validateSession(currentSession);
        if (isAuthenticated) {
            try {
//                get List Chart
                AreaDAO areaDAO = new AreaDAO();
                HomeProvinceDAO homeProvinceDAO = new HomeProvinceDAO();
                List<ChartValue> provinceWithOrders = homeProvinceDAO.ProvinceWithOrders(5);
                List<ChartValue> AreaChartValues = areaDAO.AreaWithOrders();
                request.setAttribute("chartValues", AreaChartValues);
                request.setAttribute("chartValues1", provinceWithOrders);

                //-------------get list Orders-----------------
                OrderService orderService = new OrderService();
                ArrayList<OrderDetail> listNewOrders = orderService.GetOrdersHaveSorting("created_at", "desc", 0, 5);
                request.setAttribute("listNewOrders", listNewOrders);

                String username = (String) currentSession.getAttribute("authenticatedUser");
                UserService userService = new UserService();

                if (userService.IsAdmin(username)) {
                    request.getRequestDispatcher("AdminDashboard.jsp").forward(request, response);
                } else response.sendRedirect("/");

            } catch (Exception e) {
                e.printStackTrace();
            }
        } else response.sendRedirect("/login");
    }

}
