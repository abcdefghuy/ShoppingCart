<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <title>JSP - Hello World</title>
</head>
<body>
<div class="container">
    <h1>CD List</h1>
        <table class="table table-striped">
            <thead>
            <tr>

                <th scope="col">Description</th>
                <th scope="col">Price</th>
                <th scope="col"></th>
            </tr>
            </thead>
            <tbody>
            <tr>

                <td>86 (the band) - True Life Songs and Pictures</td>
                <td>$14.95</td>
                <td>
                    <form action="Cart-update" method="post">
                        <input type="submit" value="Add to cart">
                        <input type="hidden" name="ProductCode" value="8601">
                    </form>
                </td>
            </tr>
            <tr>

                <td>Paddlefoot - The first CD</td>
                <td>$12.95</td>
                <td>
                    <form action="Cart-update" method="post">
                        <input type="submit" value="Add to cart">
                        <input type="hidden" name="ProductCode" value="pf01">
                    </form>
                </td>
            </tr>
            <tr>

                <td>Paddlefoot - The second CD</td>
                <td>$14.95</td>
                <td>
                    <form action="Cart-update" method="post">
                        <input type="submit" value="Add to cart">
                        <input type="hidden" name="ProductCode" value="pf02">
                    </form>
                </td>
            </tr>
            <tr>

                <td>Joe Rut - Genuine Wood Grained Finish</td>
                <td>$14.95</td>
                <td>
                    <form action="Cart-update" method="post">
                        <input type="submit" value="Add to cart">
                        <input type="hidden" name="ProductCode" value="jr01">
                    </form>
                </td>
            </tr>
            </tbody>
        </table>

</div>

</body>
</html>