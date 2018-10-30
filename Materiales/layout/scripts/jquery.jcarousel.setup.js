$(document).ready(function () {

    function mycarousel_initCallback(carousel) {
        $('#featured-item-next').bind('click', function () {
            carousel.next();
            return false;
        });
        $('#featured-item-prev').bind('click', function () {
            carousel.prev();
            return false;
        });

        // Disable autoscrolling if the user clicks the prev or next button.
        carousel.buttonNext.bind('click', function () {
            carousel.startAuto(0);
        });

        carousel.buttonPrev.bind('click', function () {
            carousel.startAuto(0);
        });

        // Pause autoscrolling if the user moves with the cursor over the clip.
        carousel.clip.hover(function () {
            carousel.stopAuto();
        }, function () {
            carousel.startAuto();
        });

    };

  

});