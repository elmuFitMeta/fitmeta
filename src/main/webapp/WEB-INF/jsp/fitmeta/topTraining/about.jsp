<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="projectPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  
  <title>FitMeta</title>

  <link rel="shortcut icon" href="${projectPath}/css/assets/favicon.ico" type="image/x-icon">
  
  <link rel="stylesheet" type="text/css" href="${projectPath}/css/assets/css/themify-icons.css">
  
  <link rel="stylesheet" type="text/css" href="${projectPath}/css/assets/css/bootstrap.css">

  <link rel="stylesheet" type="text/css" href="${projectPath}/css/assets/vendor/animate/animate.css">
  
  <link rel="stylesheet" type="text/css" href="${projectPath}/css/assets/vendor/owl-carousel/owl.carousel.css">
  
  <link rel="stylesheet" type="text/css" href="${projectPath}/css/assets/vendor/nice-select/css/nice-select.css">
  
  <link rel="stylesheet" type="text/css" href="${projectPath}/css/assets/vendor/fancybox/css/jquery.fancybox.min.css">
  
  <link rel="stylesheet" type="text/css" href="${projectPath}/css/assets/css/virtual.css">
  
  <link rel="stylesheet" type="text/css" href="${projectPath}/css/assets/css/topbar.virtual.css">
</head>


<script type="text/javascript">
	const ptId = sessionStorage.getItem('pt-id');
</script>

<body class="theme-red">
  
  <!-- Back to top button -->
  <div class="btn-back_to_top">
    <span class="ti-arrow-up"></span>
  </div>
  
  <!-- Setting button -->
  <div class="config">
    <div class="set-menu">
      <p>Select Color</p>
      <div class="color-bar" data-toggle="selected">
        <span class="color-item bg-theme-red selected" data-class="theme-red"></span>
        <span class="color-item bg-theme-blue" data-class="theme-blue"></span>
        <span class="color-item bg-theme-green" data-class="theme-green"></span>
        <span class="color-item bg-theme-orange" data-class="theme-orange"></span>
        <span class="color-item bg-theme-purple" data-class="theme-purple"></span>
      </div>
      <select class="custom-select d-block my-2" id="change-page">
        <option value="">Choose Page</option>
        <option value="index">Topbar</option>
        <option value="blog-topbar">Blog (Topbar)</option>
        <option value="index-2">Minibar</option>
        <option value="blog-minibar">Blog (Minibar)</option>
      </select>
    </div>
  </div>
  
  <div class="vg-page page-home" id="home" style="background-image: url(../css/assets/img/bg_banner.jpg)">
    <!-- Navbar -->                                                    
    <div class="navbar navbar-expand-lg navbar-dark sticky" data-offset="500">
      <div class="container">
        <a href="/fit-meta/topTraining/index.do" class="navbar-brand">Fit-Meta</a>
        <button class="navbar-toggler" data-toggle="collapse" data-target="#main-navbar" aria-expanded="true">
          <span class="ti-menu"></span>
        </button>
        <div class="collapse navbar-collapse" id="main-navbar">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a href="#home" class="nav-link" data-animate="scrolling">トップ</a>
            </li>
            <li class="nav-item">
              <a href="#about" class="nav-link" data-animate="scrolling">About</a>
            </li>
            <li class="nav-item">
              <a href="#blog" class="nav-link" data-animate="scrolling">ニュース</a>
            </li>
            <li class="nav-item">
              <a href="#contact" class="nav-link" data-animate="scrolling">お問い合わせ</a>
            </li>
          </ul>
          <ul class="nav ml-auto">
            <li class="nav-item">
              <button class="btn btn-fab btn-theme no-shadow">Japan</button>
            </li>
          </ul>
        </div>
      </div>
    </div> <!-- End Navbar -->
    <!-- Caption header -->
    <div class="caption-header text-center wow zoomInDown">
      <h5 class="fw-normal fg-theme">ようこそ</h5>
      <h1 class="fw-light mb-4"><b class="fg-theme" id="nm"></b></h1>
      <div class="badge">パーソナルトレーナー</div>
    </div> <!-- End Caption header -->
    <div class="floating-button"><span class="ti-mouse"></span></div>
  </div>
  
  <div class="vg-page page-about" id="about">
    <div class="container py-5">
      <div class="row">
        <div class="col-lg-4 py-3">
          <div class="img-place wow fadeInUp">
            <img id="my-photo" src="" alt="">
          </div>
        </div>
        <div class="col-lg-6 offset-lg-1 wow fadeInRight">
          <h1 class="fw-light"></h1>
          <h5 class="fg-theme mb-3">パーソナルトレーナー</h5>
          <p class="text-muted"></p>
          <ul class="theme-list">
            <li><b>From:</b> <span class="_address"></span></li>
            <li><b>Lives In:</b> <span class="_address"></span></li>
            <li><b>Age:</b> 25</li>
            <li><b>Gender:</b> Male</li>
          </ul>
        </div>
      </div>
    </div>
    <div class="container py-5">
      <h1 class="text-center fw-normal wow fadeIn">My Skills</h1>
      <div class="row py-3">
        <div class="col-md-6">
          <div class="px-lg-3">
            <h4 class="wow fadeInUp">Coding skills</h4>
            <div class="progress-wrapper wow fadeInUp">
              <span class="caption">JavaScript</span>
              <div class="progress">
                <div class="progress-bar" role="progressbar" style="width: 86%;" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">86%</div>
              </div>
            </div>
            <div class="progress-wrapper wow fadeInUp">
              <span class="caption">PHP</span>
              <div class="progress">
                <div class="progress-bar" role="progressbar" style="width: 80%;" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">80%</div>
              </div>
            </div>
            <div class="progress-wrapper wow fadeInUp">
              <span class="caption">HTML + CSS</span>
              <div class="progress">
                <div class="progress-bar" role="progressbar" style="width: 100%;" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">100%</div>
              </div>
            </div>
            <div class="progress-wrapper wow fadeInUp">
              <span class="caption">Phyton</span>
              <div class="progress">
                <div class="progress-bar" role="progressbar" style="width: 90%;" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">90%</div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="px-lg-3">
            <h4 class="wow fadeInUp">Design Skills</h4>
            <div class="progress-wrapper wow fadeInUp">
              <span class="caption">UI / UX Design</span>
              <div class="progress">
                <div class="progress-bar" role="progressbar" style="width: 92%;" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">92%</div>
              </div>
            </div>
            <div class="progress-wrapper wow fadeInUp">
              <span class="caption">Web Design</span>
              <div class="progress">
                <div class="progress-bar" role="progressbar" style="width: 99%;" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">99%</div>
              </div>
            </div>
            <div class="progress-wrapper wow fadeInUp">
              <span class="caption">Logo Design</span>
              <div class="progress">
                <div class="progress-bar" role="progressbar" style="width: 79%;" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">79%</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="container pt-5">
      <div class="row">
        <div class="col-md-6 wow fadeInRight">
          <h2 class="fw-normal">Education</h2>
          <ul class="timeline mt-4 pr-md-5">
            <li>
              <div class="title">2010</div>
              <div class="details">
                <h5>Specialize of course</h5>
                <small class="fg-theme">University of Study</small>
                <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered</p>
              </div>
            </li>
            <li>
              <div class="title">2009</div>
              <div class="details">
                <h5>Specialize of course</h5>
                <small class="fg-theme">University of Study</small>
                <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered</p>
              </div>
            </li>
            <li>
              <div class="title">2008</div>
              <div class="details">
                <h5>Specialize of course</h5>
                <small class="fg-theme">University of Study</small>
                <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered</p>
              </div>
            </li>
          </ul>
        </div>
        <div class="col-md-6 wow fadeInRight" data-wow-delay="200ms">
          <h2 class="fw-normal">Experience</h2>
          <ul class="timeline mt-4 pr-md-5">
            <li>
              <div class="title">2017 - Current</div>
              <div class="details">
                <h5>Specialize of course</h5>
                <small class="fg-theme">University of Study</small>
                <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered</p>
              </div>
            </li>
            <li>
              <div class="title">2014</div>
              <div class="details">
                <h5>Specialize of course</h5>
                <small class="fg-theme">University of Study</small>
                <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered</p>
              </div>
            </li>
            <li>
              <div class="title">2011</div>
              <div class="details">
                <h5>Specialize of course</h5>
                <small class="fg-theme">University of Study</small>
                <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered</p>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>

  
  <div class="vg-page page-funfact" style="background-image: url(../css/assets/img/bg_banner.jpg);">
    <div class="container">
      <div class="row section-counter">
        <div class="col-md-6 col-lg-3 py-4 wow fadeIn">
          <h1 class="number" data-number="768">768</h1>
          <span>Clients</span>
        </div>
        <div class="col-md-6 col-lg-3 py-4 wow fadeIn">
          <h1 class="number" data-number="230">230</h1>
          <span>Project Compleate</span>
        </div>
        <div class="col-md-6 col-lg-3 py-4 wow fadeIn">
          <h1 class="number" data-number="97">97</h1>
          <span>Project Ongoing</span>
        </div>
        <div class="col-md-6 col-lg-3 py-4 wow fadeIn">
          <h1 class="number" data-number="699">699</h1>
          <span>Client Satisfaction</span>
        </div>
      </div>
    </div>
  </div>
  
  
    <!-- Blog -->
  <div class="vg-page page-blog" id="blog">
    <div class="container">
      <div class="text-center">
        <div class="badge badge-subhead wow fadeInUp">News</div>
      </div>
      <h1 class="text-center fw-normal wow fadeInUp">Latest News</h1>
      <div class="row post-grid">
        <div class="col-md-6 col-lg-4 wow fadeInUp">
          <div class="card">
            <div class="img-place">
              <img src="${projectPath}/css/assets/img/work/work-9.jpg" alt="">
            </div>
            <div class="caption">
              <a href="javascript:void(0)" class="post-category">Technology</a>
              <a href="#" class="post-title">Invision design forward fund</a>
              <span class="post-date"><span class="sr-only">Published on</span> May 22, 2018</span>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-4 wow fadeInUp">
          <div class="card">
            <div class="img-place">
              <img src="${projectPath}/css/assets/img/work/work-6.jpg" alt="">
            </div>
            <div class="caption">
              <a href="javascript:void(0)" class="post-category">Business</a>
              <a href="#" class="post-title">Announcing a plan for small teams</a>
              <span class="post-date"><span class="sr-only">Published on</span> May 22, 2018</span>
            </div>
          </div>
        </div>
        <div class="col-md-6 col-lg-4 wow fadeInUp">
          <div class="card">
            <div class="img-place">
              <img src="${projectPath}/css/assets/img/work/work-1.jpg" alt="">
            </div>
            <div class="caption">
              <a href="javascript:void(0)" class="post-category">Design</a>
              <a href="#" class="post-title">5 basic tips for illustrating</a>
              <span class="post-date"><span class="sr-only">Published on</span> May 22, 2018</span>
            </div>
          </div>
        </div>
        <div class="col-12 text-center py-3 wow fadeInUp">
          <a href="blog-fullbar.html" class="btn btn-theme">See All Post</a>
        </div>
      </div>
    </div>
  </div> <!-- End blog -->
  
  
  <!-- Client -->
  <div class="vg-page page-client">
    <div class="container">
      <div class="row">
        <div class="col-md-6 col-lg-4 col-xl-3 item">
          <div class="img-place wow fadeInUp">
            <img src="${projectPath}/css/assets/img/logo/company_1.svg" alt="">
          </div>
        </div>
        <div class="col-md-6 col-lg-4 col-xl-3 item">
          <div class="img-place wow fadeInUp">
            <img src="${projectPath}/css/assets/img/logo/company_2.svg" alt="">
          </div>
        </div>
        <div class="col-md-6 col-lg-4 col-xl-3 item">
          <div class="img-place wow fadeInUp">
            <img src="${projectPath}/css/assets/img/logo/company_3.svg" alt="">
          </div>
        </div>
        <div class="col-md-6 col-lg-4 col-xl-3 item">
          <div class="img-place wow fadeInUp">
            <img src="${projectPath}/css/assets/img/logo/company_4.svg" alt="">
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-6 col-lg-4 col-xl-3 item">
          <div class="img-place wow fadeInUp">
            <img src="${projectPath}/css/assets/img/logo/company_5.svg" alt="">
          </div>
        </div>
        <div class="col-md-6 col-lg-4 col-xl-3 item">
          <div class="img-place wow fadeInUp">
            <img src="${projectPath}/css/assets/img/logo/company_6.svg" alt="">
          </div>
        </div>
        <div class="col-md-6 col-lg-4 col-xl-3 item">
          <div class="img-place wow fadeInUp">
            <img src="${projectPath}/css/assets/img/logo/company_7.svg" alt="">
          </div>
        </div>
        <div class="col-md-6 col-lg-4 col-xl-3 item">
          <div class="img-place wow fadeInUp">
            <img src="${projectPath}/css/assets/img/logo/company_8.svg" alt="">
          </div>
        </div>
      </div>
    </div>
  </div> <!-- End client -->
  
  
  <!-- Contact -->
  <div class="vg-page page-contact" id="contact">
    <div class="container-fluid">
      <div class="text-center wow fadeInUp">
        <div class="badge badge-subhead">Contact</div>
      </div>
      <h1 class="text-center fw-normal wow fadeInUp">Get in touch</h1>
      <div class="row py-5">
        <div class="col-lg-5">
          <form class="vg-contact-form">
            <div class="form-row">
              <div class="col-12 mt-3 wow fadeInUp">
                <input class="form-control" type="text" name="Name" placeholder="Your Name">
              </div>
              <div class="col-6 mt-3 wow fadeInUp">
                <input class="form-control" type="text" name="Email" placeholder="Email Address">
              </div>
              <div class="col-6 mt-3 wow fadeInUp">
                <input class="form-control" type="text" name="Subject" placeholder="Subject">
              </div>
              <div class="col-12 mt-3 wow fadeInUp">
                <textarea class="form-control" name="Message" rows="6" placeholder="Enter message here.."></textarea>
              </div>
              <button type="submit" class="btn btn-theme mt-3 wow fadeInUp ml-1">Send Message</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div> <!-- End Contact -->
  
  <!-- Footer -->
  <div class="vg-footer">
    <h1 class="text-center">Virtual Folio</h1>
    <div class="container">
      <div class="row">
        <div class="col-lg-4 py-3">
          <div class="footer-info">
            <p>Where to find me</p>
            <hr class="divider">
            <p class="fs-large fg-white">1600 Amphitheatre Parkway Mountain View, California 94043 US</p>
          </div>
        </div>
        <div class="col-md-6 col-lg-3 py-3">
          <div class="float-lg-right">
            <p>Follow me</p>
            <hr class="divider">
            <ul class="list-unstyled">
              <li><a href="#">Instagram</a></li>
              <li><a href="#">Facebook</a></li>
              <li><a href="#">Twitter</a></li>
              <li><a href="#">Youtube</a></li>
            </ul>
          </div>
        </div>
        <div class="col-md-6 col-lg-3 py-3">
          <div class="float-lg-right">
            <p>Contact me</p>
            <hr class="divider">
            <ul class="list-unstyled">
              <li>info@virtual.com</li>
              <li>+8890234</li>
              <li>+813023</li>
            </ul>
          </div>
        </div>
      </div>
      <div class="row justify-content-center mt-3">
        <div class="col-12 mb-3">
          <h3 class="fw-normal text-center">Subscribe</h3>
        </div>
        <div class="col-lg-6">
          <form class="mb-3">
            <div class="input-group">
              <input type="text" class="form-control" placeholder="Email address">
              <input type="submit" class="btn btn-theme no-shadow" value="Subscribe">
            </div>
          </form>
        </div>
        <div class="col-12">
          <p class="text-center mb-0 mt-4">Copyright &copy;2020. All right reserved | This template is made with <span class="ti-heart fg-theme-red"></span> by <a href="https://www.macodeid.com/">MACode ID</a></p>
        </div>
      </div>
    </div>
  </div> <!-- End footer -->
  
  
  <script src="${projectPath}/css/assets/js/jquery-3.5.1.min.js"></script>
    
  <script src="${projectPath}/css/assets/js/bootstrap.bundle.min.js"></script>
    
  <script src="${projectPath}/css/assets/vendor/owl-carousel/owl.carousel.min.js"></script>
    
  <script src="${projectPath}/css/assets/vendor/isotope/isotope.pkgd.min.js"></script>
    
  <script src="${projectPath}/css/assets/vendor/nice-select/js/jquery.nice-select.min.js"></script>
    
  <script src="${projectPath}/css/assets/vendor/fancybox/js/jquery.fancybox.min.js"></script>

  <script src="${projectPath}/css/assets/vendor/wow/wow.min.js"></script>

  <script src="${projectPath}/css/assets/vendor/animateNumber/jquery.animateNumber.min.js"></script>

  <script src="${projectPath}/css/assets/vendor/waypoints/jquery.waypoints.min.js"></script>
    
  <script src="${projectPath}/css/assets/js/topbar-virtual.js"></script>

  <script src="${projectPath}/js/fitMetaDAO.js?1.1"></script>
  
  <script src="${projectPath}/js/dev.mrgelo.js?1.1"></script>

  <script src="${projectPath}/js/top-training/u-about.js?1.1"></script>
  
</body>
</html>
