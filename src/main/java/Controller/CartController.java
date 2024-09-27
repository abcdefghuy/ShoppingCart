package Controller;

import Data.ProductIO;
import Model.Cart;
import Model.LineItem;
import Model.Product;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
@WebServlet("/Cart-update")
public class CartController extends HttpServlet {
@Override
protected void doPost(HttpServletRequest request,
                      HttpServletResponse response)
        throws ServletException, IOException{
   String url="/index.jsp";
   String action=request.getParameter("action");
    ServletContext sc = getServletContext();
   if(action==null){
       action="cart";
   }
   if(action.equals("shop")){
       url="/index.jsp";
   }
   else if(action.equals("cart")){
       String productCode=request.getParameter("ProductCode");
       String quantityString=request.getParameter("quantity");
       HttpSession session = request.getSession();
       Cart cart = (Cart) session.getAttribute("cart");
       if (cart == null) {
           cart = new Cart();
       }

       //if the user enters a negative or invalid quantity,
       //the quantity is automatically reset to 1.
       int quantity;
       try {
           quantity = Integer.parseInt(quantityString);
           if (quantity < 0) {
               quantity = 1;
           }
       } catch (NumberFormatException nfe) {
           quantity = 1;
       }

       String path = sc.getRealPath("/WEB-INF/products.txt");
       Product product = ProductIO.getProduct(productCode, path);

       LineItem lineItem = new LineItem();
       lineItem.setProduct(product);
       lineItem.setQuantity(quantity);
       if (quantity > 0) {
           cart.addItem(lineItem);
       } else if (quantity == 0) {
           cart.removeItem(lineItem);
       }

       session.setAttribute("cart", cart);
       url = "/Cart.jsp";
   }
   else if (action.equals("checkout")) {
       url = "/Checkout.jsp";
   }

    sc.getRequestDispatcher(url)
            .forward(request, response);
}
    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
