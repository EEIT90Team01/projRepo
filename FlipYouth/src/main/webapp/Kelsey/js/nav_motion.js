//最大的下方選單------------------------------------
$(document).ready(function() {
    $('#nav-icon3').click(function() {
        $(this).toggleClass('open');
        $('#navContainer').toggleClass('open');
    });
});

//會員下方選單------------------------------------
$(document).ready(function() {
    $('#MemberSelect').click(function() {
        $(this).toggleClass('MemberOpenSelect');
        $('#MemberUL').toggleClass('MemberOpenSelected');
    });
});

//商城下方選單------------------------------------
$(document).ready(function() {
    $('#ShopSelect').click(function() {
        $(this).toggleClass('ShopOpenSelect');
        $('#ShopUL').toggleClass('ShopOpenSelected');
    });
});

//揪團下方選單------------------------------------
$(document).ready(function() {
    $('#TeamSelect').click(function() {
        $(this).toggleClass('TeamOpenSelect');
        $('#TeamUL').toggleClass('TeamOpenSelected');
    });
});


//好友下方選單------------------------------------

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
