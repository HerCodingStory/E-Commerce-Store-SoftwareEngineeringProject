<%@include file="/WEB-INF/views/template/header.jsp" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

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
            <img class="first-slide" src="https://d2v9y0dukr6mq2.cloudfront.net/video/thumbnail/SsLYSh45lizrfzvep/videoblocks-young-man-make-some-notes-in-note-book-from-the-smart-phone-with-green-screan-on-wood-background-man-hands-make-travel-list-for-the-future-trip-top-view_rf0vwf6rl_thumbnail-full01.png" alt="First slide">
            <div class="container">
                <div class="carousel-caption">
                    <h1>Sign up!</h1>
                    <p>Shop all your favorites book, obtain discounts, get the news first! Just join now!</p>
                    <p><a class="btn btn-lg btn-primary" href="<c:url value="/register" />" role="button">Sign-up</a></p>
                </div>
            </div>
        </div>
        <div class="item">
            <img class="second-slide" src="https://ontargetinteractive.com/wp-content/uploads/2017/08/social-.jpg" alt="Second slide">
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
            <img class="third-slide" src="https://knoxseminary.edu/wp-content/uploads/2014/09/Books-Background-1.jpg" alt="Third slide">
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
            <img class="img-circle" src="https://png.pngtree.com/thumb_back/fw800/back_pic/04/00/06/5357fba91399bf7.jpg" alt="Generic placeholder image" width="140" height="140">
            <h2>Events</h2>
            <p>Check out all our amazing events!</p>
            <p><a class="btn btn-default" href="#" role="button">View Calendar &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
            <img class="img-circle" src="https://imgc.allpostersimages.com/img/print/posters/andrey-kuzmin-aged-treasure-map-background_a-G-12141049-9201595.jpg" alt="Generic placeholder image" width="140" height="140">
            <h2>Locations</h2>
            <p>Check out all our locations!</p>
            <p><a class="btn btn-default" href="#" role="button">Visit Us &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
            <img class="img-circle" src="https://www.fastweb.com/uploads/article_photo/photo/2035954/brainstorm-common-scholarship-essay-questions.jpg" alt="Generic placeholder image" width="140" height="140">
            <h2>Questions</h2>
            <p>Ask us any questions, we will respond ASAP!</p>
            <p><a class="btn btn-default" href="#" role="button">Contact Us &raquo;</a></p>
        </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->


<%@include file="/WEB-INF/views/template/footer.jsp" %>