<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  Users: crist
  Date: 5/28/2018
  Time: 4:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Mine&Craft BookShop</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- Bootstrap core CSS -->
    <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<c:url value="/resources/css/carousel.css"/>" rel="stylesheet">
</head>
<!-- NAVBAR
================================================== -->
<body>
<div class="navbar-wrapper">
    <div class="container">

        <nav class="navbar navbar-inverse navbar-static-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-left" href="<c:url value="/"/>"><img src="https://preview.ibb.co/eDWnOT/Picture1.png" alt="Picture1" border="0" width="200" height="60"></a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="#account">Account</a></li>
                        <li><a href="<c:url value="/productList"/>">Products</a></li>
                        <li><a href="#contact">Contact</a></li>
                    </ul>
                    <ul class="nav navbar-nav pull-right">
                        <li><a href="<c:url value="/admin" />">Admin</a></li>
                        <li><a href="<c:url value="/register" />">Register</a></li>
                    </ul>
                </div>
            </div>
        </nav>

    </div>
</div>


<!-- Carousel
================================================== -->
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img class="first-slide" src="https://i.pinimg.com/originals/d7/70/5b/d7705b4b6c3dbf719523b248ef646a0f.jpg" alt="First slide">
            <div class="container">
                <div class="carousel-caption">
                    <h1>Become a Miner!</h1>
                    <p>Shop all your favorites book, obtain discounts, get the news first! Just join now!</p>
                    <p><a class="btn btn-lg btn-primary" href="<c:url value="/register" />" role="button">Sign-up</a></p>
                </div>
            </div>
        </div>
        <div class="item">
            <img class="second-slide" src="http://i.imgur.com/I1rrW.png" alt="Second slide">
            <div class="container">
                <div class="carousel-caption">
                    <h1>Find us in Social Media</h1>
                    <p>
                        <a href="#" class="fa fa-facebook"></a>
                        <a href="#" class="fa fa-instagram"></a>
                        <a href="#" class="fa fa-snapchat-ghost"></a>
                        <a href="#" class="fa fa-twitter"></a>
                    </p>
                </div>
            </div>
        </div>
        <div class="item">
            <img class="third-slide" src="https://timedotcom.files.wordpress.com/2016/06/minecraft.jpg" alt="Third slide">
            <div class="container">
                <div class="carousel-caption">
                    <h1>Top Rated Books</h1>
                    <p>Don't forget to look at the bestsellers books of the year!</p>
                    <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse Bestsellers</a></p>
                </div>
            </div>
        </div>
    </div>
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div><!-- /.carousel -->


<!-- Marketing messaging and featurettes
================================================== -->
<!-- Wrap the rest of the page in another container to center all the content. -->

<div class="container marketing">

    <!-- Three columns of text below the carousel -->
    <div class="row">
        <div class="col-lg-4">
            <img class="img-circle" src="https://i.imgur.com/dpajR.jpg" alt="Generic placeholder image" width="140" height="140">
            <h2>Events</h2>
            <p>Check out all our amazing events!</p>
            <p><a class="btn btn-default" href="#" role="button">View Calendar &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
            <img class="img-circle" src="https://lh5.ggpht.com/77EvXtEUqn9KMJXzc7pVR5pQgws1XDRKAyd6M9XPBlI6J8rlvpeCcKCP2fEhLBOrFgK7=h1080" alt="Generic placeholder image" width="140" height="140">
            <h2>Locations</h2>
            <p>Check out all our locations!</p>
            <p><a class="btn btn-default" href="#" role="button">Visit Us &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
            <img class="img-circle" src="https://wallpapercave.com/wp/gEPOrzw.jpg" alt="Generic placeholder image" width="140" height="140">
            <h2>Questions</h2>
            <p>Ask us any questions, we will respond ASAP!</p>
            <p><a class="btn btn-default" href="#" role="button">Contact Us &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->

    <!-- FOOTER -->
    <footer>
        <p class="pull-right"><a href="#">Back to top</a></p>
        <p>&copy; 2018 Mine&Craft, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
    </footer>

</div><!-- /.container -->


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="<c:url value="/resources/js/jquery.min.js" />"><\/script>')</script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
</body>
</html>
