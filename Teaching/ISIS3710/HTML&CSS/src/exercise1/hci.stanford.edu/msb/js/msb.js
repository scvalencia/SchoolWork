$(document).ready(function() {
    initializeLinks();
    initializeSideNav();
    initializeAnalyticsDownloadTracker();
    initializeDanOlsen();
});

function initializeLinks() {
    $('.more-courses').click(function(e) {
	$('.past-course').show();
	$(this).remove();
    });
}

function initializeSideNav() {
    if ($('.sidenav #sidenav-content').length == 0) {
        return;
    }

    // figure out minimum header value (e.g., h3 is the largest)
    var uniqueHeaderIndices = [];
    $('.sidenav-anchor').each(function() {
        var header = $(this).children(':header').first();
        // http://stackoverflow.com/questions/5127017/automatic-numbering-of-headings-h1-h6-using-jquery
        var hIndex = parseInt(header.prop('nodeName').substring(1));
        if ($.inArray(hIndex, uniqueHeaderIndices) == -1) {
        	uniqueHeaderIndices.push(hIndex);
        }
        uniqueHeaderIndices.sort();
    });

    // now put all the <h> elements under each sidenav-anchor into the sidenav
    $('.sidenav-anchor').each(function() {
        var header = $(this).children(':header').first();
        var hrefTarget = $(this).prop('id');
        var levelsDeep = $.inArray(parseInt(header.prop('nodeName').substring(1)), uniqueHeaderIndices);
        
        var elem = "";
        for (var i=0; i<levelsDeep; i++) {
            elem += "<ul class='nav'><li>";
        }
        elem += '<a href="#' + hrefTarget + '">' + header.text() + '</a>';
        for (var i=0; i<levelsDeep; i++) {
            elem += "</li></ul>";
        }
        
        $('#sidenav-content').append('<li>' + elem + '</li>');
    });
}

<!-- http://www.blastam.com/blog/index.php/2013/09/howto-track-downloads-links-universalanalytics/ -->
function initializeAnalyticsDownloadTracker() {
    if (typeof jQuery != 'undefined') {
        var filetypes = /\.(zip|exe|dmg|pdf|doc.*|xls.*|ppt.*|mp3|txt|rar|wma|mov|avi|wmv|flv|wav)$/i;
        var baseHref = '';
        if (jQuery('base').attr('href') != undefined) baseHref = jQuery('base').attr('href');
        var hrefRedirect = '';
     
        jQuery('body').on('click', 'a', function(event) {
            var el = jQuery(this);
            var track = true;
            var href = (typeof(el.attr('href')) != 'undefined' ) ? el.attr('href') : '';
            var isThisDomain = href.match(document.domain.split('.').reverse()[1] + '.' + document.domain.split('.').reverse()[0]);
            if (!href.match(/^javascript:/i)) {
                var elEv = []; elEv.value=0, elEv.non_i=false;
                if (href.match(/^mailto\:/i)) {
                    elEv.category = 'email';
                    elEv.action = 'click';
                    elEv.label = href.replace(/^mailto\:/i, '');
                    elEv.loc = href;
                }
                else if (href.match(filetypes)) {
                    var extension = (/[.]/.exec(href)) ? /[^.]+$/.exec(href) : undefined;
                    elEv.category = 'download';
                    elEv.action = 'click-' + extension[0];
                    elEv.label = href.replace(/ /g,'-');
                    elEv.loc = baseHref + href;
                }
                else if (href.match(/^https?\:/i) && !isThisDomain) {
                    elEv.category = 'external';
                    elEv.action = 'click';
                    elEv.label = href.replace(/^https?\:\/\//i, '');
                    elEv.non_i = true;
                    elEv.loc = href;
                }
                else if (href.match(/^tel\:/i)) {
                    elEv.category = 'telephone';
                    elEv.action = 'click';
                    elEv.label = href.replace(/^tel\:/i, '');
                    elEv.loc = href;
                }
                else track = false;
     
                if (track) {
                    var ret = true;
     
                    if((elEv.category == 'external' || elEv.category == 'download') && (el.attr('target') == undefined || el.attr('target').toLowerCase() != '_blank') ) {
                        hrefRedirect = elEv.loc;
     
                        ga('send','event', elEv.category.toLowerCase(),elEv.action.toLowerCase(),elEv.label.toLowerCase(),elEv.value,{
                            'nonInteraction': elEv.non_i ,
                            'hitCallback':gaHitCallbackHandler
                        });
     
                        ret = false;
                    }
                    else {
                        ga('send','event', elEv.category.toLowerCase(),elEv.action.toLowerCase(),elEv.label.toLowerCase(),elEv.value,{
                            'nonInteraction': elEv.non_i
                        });
                    }
     
                    return ret;
                }
            }
        });
     
        gaHitCallbackHandler = function() {
            window.location.href = hrefRedirect;
        }
    }
}

function initializeDanOlsen() {
    // WHOA, IT'S DAN OLSEN!
    // (for context, ask Dan about my photo in his textbook)
    $.getJSON('http://www.freegeoip.net/json/', function(data) {
        // metro_code: 770 for salt lake city / provo
        // metro_code: 807 for stanford
        if (data['country_code'] == 'US' && data['metro_code'] == '770') {
            $('#msb-img').attr('src', 'http://icie.cs.byu.edu/images/DanOlsen.gif')
            .attr('alt', '*GASP*, IT\'S DAN OLSEN!');
	    $('.name').text('Dan Olsen');
        }
    });
}