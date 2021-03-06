package servlet;

import java.io.IOException;
import java.util.LinkedList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OrderDao;
import dao.ProductDao;
import dao.RateDao;
import bean.CartInfo;
import bean.OrderInfo;
import bean.UserInfo;



public class OrderS extends HttpServlet {
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		switch(Integer.parseInt(request.getParameter("flag"))) {
		case 0:
			insertOrder(request, response);
			break;
		case 1:
			viewOrder(request, response);
			break;
		case 2:
			rateOrder(request, response);
			break;
		case 3:
			insertRate(request, response);
			break;
		}
	}
	
	private void insertOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserInfo u = (UserInfo)request.getSession().getAttribute("userinfo");
		String username = u.getUserName();
		int userid = u.getUserId();
		LinkedList<CartInfo> cart = (LinkedList<CartInfo>) request.getSession().getAttribute("Shoppingcart");
		float totalsum = 0;
		OrderDao od = new OrderDao();
		ProductDao pd = new ProductDao();
		
		int orderid = 0;
		try {
			orderid = od.insertOrder(u.getUserName());
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		for (CartInfo c : cart) {
			OrderInfo oi = new OrderInfo();
			oi.setUsername(username);
			oi.setUserid(userid);
			oi.setProname(c.getProductName());
			oi.setProid(c.getId());
			oi.setQuantity(c.getQuantity());
			
			float sum = c.getPrice()*c.getQuantity();
			totalsum = totalsum + sum;
			oi.setSum(sum);
			try {
				pd.changeStock(c.getProductName(), c.getId(), c.getQuantity());
				od.insertOrderLine(orderid, oi);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		try {
			od.updateOrder(orderid, totalsum);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("OrderS?flag=1");
		rd.forward(request, response);
		
	}
	
	private void viewOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserInfo u = (UserInfo)request.getSession().getAttribute("userinfo");
		int userid = u.getUserId();
		OrderDao od = new OrderDao();
		try {
			//problem
			LinkedList<Integer> oidlist = od.queryOrderid(userid);
			
			if (oidlist.size() > 0){
				request.setAttribute("orderinfo", oidlist);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("/account.jsp");
		rd.forward(request, response);
	}
	
	
	private void rateOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oid = request.getParameter("oid");
		int orderid = Integer.valueOf(oid);
		OrderDao od = new OrderDao();
		LinkedList<OrderInfo> order = new LinkedList<OrderInfo>();
		try {
			order = od.queryOrder(orderid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("order", order);
		RequestDispatcher rd = request.getRequestDispatcher("/orderrate.jsp");
		rd.forward(request, response);
	}

	
	
	
	//=============Maybe have bug======================
	private void insertRate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		OrderInfo item =  (OrderInfo) request.getSession().getAttribute("singleProduct");
		System.out.println("OrderS139--" + item.getProid());
		
		int rate = Integer.parseInt(request.getParameter("rate"));
		
		System.out.println("OrderS141--" + rate);
		
		RateDao rdo = new RateDao();
		
			try {
				rdo.insertRate(item, rate);
			} catch (Exception e) {
				e.printStackTrace();
			}

			request.setAttribute("singleProduct",null);
		RequestDispatcher rd = request.getRequestDispatcher("/search.jsp");
		rd.forward(request, response);
	}


	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	public void destroy() {
		super.destroy();
	}
}
