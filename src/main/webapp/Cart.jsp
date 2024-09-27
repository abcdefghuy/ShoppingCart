<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 9/25/2024
  Time: 10:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <title>Your Cart</title>
</head>
<body>
<h1>Your cart</h1>

<table class="table table-striped">
    <tr>
        <th>Quantity</th>
        <th>Description</th>
        <th>Price</th>
        <th>Amount</th>
        <th></th>
    </tr>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${not empty cart and not empty cart.items}">
    <c:forEach var="item" items="${cart.items}">
        <tr>
            <td>
                <form action="Cart-update" method="post">
                    <input type="hidden" name="ProductCode" value="${item.product.id}">
                    <input type="text" name="quantity" value="${item.quantity}" id="quantity">
                    <input type="submit" value="Update">
                </form>
            </td>
            <td>${item.product.description}</td>
            <td>${item.product.priceCurrencyFormat}</td>
            <td>${item.totalCurrencyFormat}</td>
            <td>
<%--                <a href="cart?productCode=${item.product.id}&amp;quantity=0">Remove Item</a>--%>

      <form action="Cart-update" method="post">
        <input type="hidden" name="ProductCode"
               value="${item.product.id}">
        <input type="hidden" name="quantity"
               value="0">
        <input type="submit" value="Remove Item">
      </form>

            </td>
        </tr>
    </c:forEach>
</c:if>
</table>
        <p><b>To change the quantity</b>, enter the new quantity and click on the Update button</p>


        <form action="" method="post">
            <input type="hidden" name="action" value="shop">
            <input type="submit" value="Continue Shopping">
        </form>

        <form action="Checkout.jsp" method="post">
            <input type="hidden" name="action" value="checkout">
            <input type="submit" value="Checkout">
        </form>

</body>
</html>
