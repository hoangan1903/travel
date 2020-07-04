package com.travel.servlet;

import com.travel.bean.TourBean;
import com.travel.bean.TourInfoBean;
import com.travel.bean.UserBean;
import com.travel.helper.CookieHelpers;
import com.travel.helper.SessionHelpers;
import com.travel.service.TourInfoService;
import com.travel.service.TourService;
import com.travel.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(urlPatterns = {"/checkout"})
public class CheckoutServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession currentSession = request.getSession(false);
        boolean isAuthenticated = SessionHelpers.validateSession(currentSession);
        if (isAuthenticated) {
            Cookie cookie = CookieHelpers.getExistingCookie(request, "checkoutTourId");
            if (cookie != null) {
                int checkoutTourId = Integer.parseInt(cookie.getValue());
                String username = (String) currentSession.getAttribute("authenticatedUser");
                UserBean customer = null;
                TourBean tour = null;
                TourInfoBean tourInfo = null;

                try {
                    UserService userService = new UserService();
                    TourService tourService = new TourService();
                    TourInfoService tourInfoService = new TourInfoService();

                    customer = userService.GetUserByUserName(username);
                    tour = tourService.GetTourByID(checkoutTourId);
                    tourInfo = tourInfoService.GetTourInfoByTourID(checkoutTourId);
                } catch (Exception e) {
                    e.printStackTrace();
                }

                request.setAttribute("customer", customer);
                request.setAttribute("checkoutTour", tour);
                request.setAttribute("checkoutTourInfo", tourInfo);
                request.getRequestDispatcher("checkout.jsp").forward(request, response);
            } else {
                response.sendRedirect("/");
            }
        } else {
            response.sendRedirect("/login");
        }
    }
}
