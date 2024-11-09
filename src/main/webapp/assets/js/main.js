(function ($) {
    "use strict";

    $(document).ready(function ($) {

        // testimonial sliders
        $(".testimonial-sliders").owlCarousel({
            items: 1,
            loop: true,
            autoplay: true,
            responsive: {
                0: {
                    items: 1,
                    nav: false
                },
                600: {
                    items: 1,
                    nav: false
                },
                1000: {
                    items: 1,
                    nav: false,
                    loop: true
                }
            }
        });

        // homepage slider
        $(".homepage-slider").owlCarousel({
            items: 1,
            loop: true,
            autoplay: true,
            nav: true,
            dots: false,
            navText: ['<i class="fas fa-angle-left"></i>', '<i class="fas fa-angle-right"></i>'],
            responsive: {
                0: {
                    items: 1,
                    nav: false,
                    loop: true
                },
                600: {
                    items: 1,
                    nav: true,
                    loop: true
                },
                1000: {
                    items: 1,
                    nav: true,
                    loop: true
                }
            }
        });

        // logo carousel
        $(".logo-carousel-inner").owlCarousel({
            items: 4,
            loop: true,
            autoplay: true,
            margin: 30,
            responsive: {
                0: {
                    items: 1,
                    nav: false
                },
                600: {
                    items: 3,
                    nav: false
                },
                1000: {
                    items: 4,
                    nav: false,
                    loop: true
                }
            }
        });

        // count down
        const countDown = $(".time-countdown");
        if (countDown.data("countdown")) {
            const finalDate = countDown.data('countdown');
            countDown.countdown(finalDate,function(event) {
                const days = $(this).find("#days");
                const hours = $(this).find("#hours");
                const mins = $(this).find("#mins");
                const secs = $(this).find("#secs");

                days.text(event.strftime("%D"));
                hours.text(event.strftime("%H"));
                mins.text(event.strftime("%M"));
                secs.text(event.strftime("%S"));
            })
        }


        // projects filters isotop
        $(".product-filters li").on('click', function () {

            $(".product-filters li").removeClass("active");
            $(this).addClass("active");

            const selector = $(this).attr('data-filter');

            $(".product-lists").isotope({
                filter: selector,
            });

        });

        // isotop inner
        $(".product-lists").isotope();

        // magnific popup
        $('.popup-youtube').magnificPopup({
            disableOn: 700,
            type: 'iframe',
            mainClass: 'mfp-fade',
            removalDelay: 160,
            preloader: false,
            fixedContentPos: false
        });

        // light box
        $('.image-popup-vertical-fit').magnificPopup({
            type: 'image',
            closeOnContentClick: true,
            mainClass: 'mfp-img-mobile',
            image: {
                verticalFit: true
            }
        });

        // homepage slides animations
        $(".homepage-slider").on("translate.owl.carousel", function () {
            $(".hero-text-tablecell .subtitle").removeClass("animated fadeInUp").css({'opacity': '0'});
            $(".hero-text-tablecell h1").removeClass("animated fadeInUp").css({
                'opacity': '0',
                'animation-delay': '0.3s'
            });
            $(".hero-btns").removeClass("animated fadeInUp").css({'opacity': '0', 'animation-delay': '0.5s'});
        });

        $(".homepage-slider").on("translated.owl.carousel", function () {
            $(".hero-text-tablecell .subtitle").addClass("animated fadeInUp").css({'opacity': '0'});
            $(".hero-text-tablecell h1").addClass("animated fadeInUp").css({'opacity': '0', 'animation-delay': '0.3s'});
            $(".hero-btns").addClass("animated fadeInUp").css({'opacity': '0', 'animation-delay': '0.5s'});
        });


        // stikcy js
        $("#sticker").sticky({
            topSpacing: 0
        });

        //mean menu
        $('.main-menu').meanmenu({
            meanMenuContainer: '.mobile-menu',
            meanScreenWidth: "992"
        });

        const pathname = window.location.pathname;
        $(".main-menu ul li a").each(function (i, item) {
            if (item.getAttribute("href") === pathname) {
                $(item).parents("li").addClass("current-list-item");
            }
        });

        // admin menu
        $("#admin-menu .nav-link").each(function (i, item) {
            if (item.getAttribute("href") === pathname) {
                $(item).addClass("active");
            }
        })

        // account menu
        $("#account-menu a.list-group-item").each(function (i, item) {
            if (item.getAttribute("href") === pathname) {
                $(item).addClass("active");
            }
        })

        // add to cart
        $(".cart-btn").click(function () {
            const productId = +$(this).data("product_id");
            let quantity = $(this).data("quantity");

            if (!quantity) {
                quantity = +$(".single-product-form input").val();
            }

            const action = "add";
            $.post("/Fruitka/cart", {productId, quantity, action}, function (res) {
                console.log(res);
                // redirect to cart page
                if (!res.error) {
                    window.location.href = "/Fruitka/cart";
                }
            });
        });

        // update cart item quantity
        $(".product-quantity #quantity").change(function () {
            const stock = +$(this).data("stock");
            const quantity = Math.min(Math.max($(this).val(), 1), stock);
            $(this).val(quantity);
            const cartItemId = $(this).data("id");
            const price = $(this).data("price");

            const action = "update";

            $.post("/Fruitka/cart", {cartItemId, quantity, action}, function (res) {
                console.log(res);
                if (res.error) {
                    alert(res.error);
                } else {
                    // update total of cart item
                    const cartItemTotal = price * quantity;
                    $(`#${cartItemId} .product-total`).text(`$${cartItemTotal}`);

                    // update total of cart
                    const subTotal = res.subTotal;
                    const total = subTotal + 45;
                    $(".sub-total").text(`$${subTotal}`);
                    $(".total").text(`$${total}`);
                }
            });
        });

        // delete cart item
        $(".product-remove a").click(function () {
            const cartItemId = $(this).data("id");
            const action = "delete";
            $.post("/Fruitka/cart", {cartItemId, action}, function (res) {
                console.log(res);
                if (res.error) {
                    alert(res.error);
                } else {
                    // remove cart item
                    $(`#${cartItemId}`).remove();

                    // update total of cart
                    const subTotal = res.subTotal;
                    const total = subTotal + 45;
                    $(".sub-total").text(`$${subTotal}`);
                    $(".total").text(`$${total}`);
                }
            });
        });




        // checkout handle change shipping address

        function updateShippingAddress() {
            const selectedOption =  $("#shippingAddressId option:selected");
            $("#shippingAddress input#name").val(selectedOption.data("name"));
            $("#shippingAddress input#phone").val(selectedOption.data("phone"));
            $("#shippingAddress input#address").val(selectedOption.text().trim());
        }
        updateShippingAddress();
        $("#shippingAddressId").change(function () {
            updateShippingAddress();
        });

        // search form
        $(".search-bar-icon").on("click", function () {
            $(".search-area").addClass("search-active");
        });

        $(".close-btn").on("click", function () {
            $(".search-area").removeClass("search-active");
        });

    });


    jQuery(window).on("load", function () {
        jQuery(".loader").fadeOut(1000);
    });


}(jQuery));