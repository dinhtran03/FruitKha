<%@ page import="java.time.Year" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<div class="footer-area">
  <div class="container">
    <div class="row">
      <div class="col-lg-3 col-md-6">
        <div class="footer-box about-widget">
          <h2 class="widget-title">About us</h2>
          <p>Ut enim ad minim veniam perspiciatis unde omnis iste natus
            error sit voluptatem accusantium doloremque laudantium, totam rem
            aperiam, eaque ipsa quae.</p>
        </div>
      </div>
      <div class="col-lg-3 col-md-6">
        <div class="footer-box get-in-touch">
          <h2 class="widget-title">Get in Touch</h2>
          <ul>
            <li>34/8, East Hukupara, Gifirtok, Sadan.</li>
            <li>support@fruitkha.com</li>
            <li>+00 111 222 3333</li>
          </ul>
        </div>
      </div>
      <div class="col-lg-3 col-md-6">
        <div class="footer-box pages">
          <h2 class="widget-title">Pages</h2>
          <ul>
            <li><a href="${pageContext.request.contextPath}/">Home</a></li>
            <li><a href="${pageContext.request.contextPath}/about">About</a></li>
            <li><a href="${pageContext.request.contextPath}/shop">Shop</a></li>
            <li><a href="${pageContext.request.contextPath}/news">News</a></li>
            <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
          </ul>
        </div>
      </div>
      <div class="col-lg-3 col-md-6">
        <div class="footer-box subscribe">
          <h2 class="widget-title">Subscribe</h2>
          <p>Subscribe to our mailing list to get the latest updates.</p>
          <form action="">
            <label for="email" hidden></label>
            <input type="email" id="email" placeholder="Email">
            <button type="submit">
              <i class="fas fa-paper-plane"></i>
            </button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- copyright -->
<div class="copyright">
  <div class="container">
    <div class="row">
      <div class="col-lg-6 col-md-12">
        <p>
          Copyrights &copy; <%= Year.now().getValue()%> - <a href="https://github.com/duc82">Liu Tiu Diu</a>, All Rights Reserved.
        </p>
      </div>
      <div class="col-lg-6 text-right col-md-12">
        <div class="social-icons">
          <ul>
            <li><a
                href="#"
                target="_blank"><i class="fab fa-facebook-f"></i></a></li>
            <li><a
                href="#"
                target="_blank"><i class="fab fa-twitter"></i></a></li>
            <li><a
                href="#"
                target="_blank"><i class="fab fa-instagram"></i></a></li>
            <li><a
                href="#"
                target="_blank"><i class="fab fa-linkedin"></i></a></li>
            <li><a
                href="#"
                target="_blank"><i class="fab fa-dribbble"></i></a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- end copyright -->