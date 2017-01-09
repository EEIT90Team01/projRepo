$(document).ready(function() {
    $('#nav-icon3').click(function() {
        $(this).toggleClass('open');
        $('#navContainer').toggleClass('open');
    });
});


$(document).ready(function() {
    $('#FriendSelect').click(function() {
    	console.log(" $('#FriendSelect').click");
        $(this).toggleClass('openSelect');
        $('#FriendSelectUL').toggleClass('openSelected');
    });
});





// var openIO = false

// $(document).ready(function() {
//     $('#nav-icon3').click(function() {
//         $(this).toggleClass('open');

//         if (!openIO) {
//             TweenMax.to($('#navContainer ul'), 1, { css: { 'height': '200px' } });
//             openIO = true;
//         } else if (openIO) {
//             TweenMax.to($('#navContainer ul'), 1, { css: { 'height': '0px' } });
//             openIO = false;
//         }
//     });
// });
