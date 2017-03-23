<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<div class="push"></div>
</div>
<footer class="footer" role="navigation">
    <div class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-2  col-md-2 col-sm-4 col-xs-6">
                    <h3> <?php echo translate_get($_SESSION['lang'],"categories"); ?> </h3>
                    <ul>
                        <li> <a href="#"> Telefoane </a> </li>
                        <li> <a href="#"> Tablete </a> </li>
                        <li> <a href="#"> Calculatoare </a> </li>
                        <li> <a href="#"> Audio-Video-Foto </a> </li>
                        <li> <a href="#"> Diverse </a> </li>
                    </ul>
                </div>
                <div class="col-lg-2  col-md-2 col-sm-4 col-xs-6">
                    <h3> <?php echo translate_get($_SESSION['lang'],"info"); ?> </h3>
                    <ul>
                        <li> <a href="#"> <?php echo translate_get($_SESSION['lang'],"about"); ?> </a> </li>
                        <li> <a href="#"> <?php echo translate_get($_SESSION['lang'],"team"); ?> </a> </li>
                        <li> <a href="#"> <?php echo translate_get($_SESSION['lang'],"shops"); ?> </a> </li>
                        <li> <a href="#"> <?php echo translate_get($_SESSION['lang'],"search"); ?> </a> </li>
                    </ul>
                </div>
                <div class="col-lg-2  col-md-2 col-sm-4 col-xs-6">
                    <h3> <?php echo translate_get($_SESSION['lang'],"others"); ?> </h3>
                    <ul>
                        <li> <a href="#"> <?php echo translate_get($_SESSION['lang'],"contact"); ?> </a> </li>
                        <li> <a href="#"> <?php echo translate_get($_SESSION['lang'],"refunds"); ?> </a> </li>
                        <li> <a href="#"> <?php echo translate_get($_SESSION['lang'],"delivery"); ?> </a> </li>
                        <li> <a href="#"> <?php echo translate_get($_SESSION['lang'],"garanty"); ?> </a> </li>
                    </ul>
                </div>
				<div class="col-lg-2  col-md-2 col-sm-4 col-xs-6">
                    
                </div>
                <div class="col-lg-3  col-md-3 col-sm-6 col-xs-12">
                    <h3> <?php echo translate_get($_SESSION['lang'],"news_subs"); ?> </h3>
                    <ul>
                        <li>
                            <div class="input-append newsletter-box text-center">
                                <input type="text" class="full text-center" placeholder="Email ">
                                <button class="btn  bg-gray" type="button"> <?php echo translate_get($_SESSION['lang'],"email_subs"); ?> <i class="fa fa-long-arrow-right"> </i> </button>
                            </div>
                        </li>
                    </ul>
                    <ul class="social">
                        <li> <a href="#"> <i class=" fa fa-facebook">   </i> </a> </li>
                        <li> <a href="#"> <i class="fa fa-twitter">   </i> </a> </li>
                        <li> <a href="#"> <i class="fa fa-google-plus">   </i> </a> </li>
                        <li> <a href="#"> <i class="fa fa-pinterest">   </i> </a> </li>
                        <li> <a href="#"> <i class="fa fa-youtube">   </i> </a> </li>
                    </ul>
                </div>
            </div>
            <!--/.row--> 
        </div>
        <!--/.container--> 
    </div>
    <!--/.footer-->
    
    <div class="footer-bottom">
        <div class="container">
            <p class="pull-left"> <?php echo translate_get($_SESSION['lang'],"copyright"); ?> </p>
            <div class="pull-right">
                <ul class="nav nav-pills payments">
                    <li><i class="fa fa-cc-visa"></i></li>
                    <li><i class="fa fa-cc-mastercard"></i></li>
                    <li><i class="fa fa-cc-amex"></i></li>
                    <li><i class="fa fa-cc-paypal"></i></li>
                </ul> 
            </div>
        </div>
    </div>
    <!--/.footer-bottom--> 
</footer>
<script src="js/main.js"></script>