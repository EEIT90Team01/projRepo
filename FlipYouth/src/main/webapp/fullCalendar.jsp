
<!DOCTYPE html>
<html>
<head>

	<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
	<title>Flip Youth</title>

			<meta name='description' content='Open source JavaScript jQuery plugin for a full-sized, drag &amp; drop event calendar'>
	<meta name='keywords' content='calendar, JavaScript, jQuery, events, drag and drop'>
	<meta name='author' content='Adam Shaw'>

	
<link rel="apple-touch-icon" sizes="57x57" href="https://fullcalendar.io/apple-touch-icon-57x57.png">
<link rel="apple-touch-icon" sizes="114x114" href="https://fullcalendar.io/apple-touch-icon-114x114.png">
<link rel="apple-touch-icon" sizes="72x72" href="https://fullcalendar.io/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="144x144" href="https://fullcalendar.io/apple-touch-icon-144x144.png">
<link rel="apple-touch-icon" sizes="60x60" href="https://fullcalendar.io/apple-touch-icon-60x60.png">
<link rel="apple-touch-icon" sizes="120x120" href="https://fullcalendar.io/apple-touch-icon-120x120.png">
<link rel="apple-touch-icon" sizes="76x76" href="https://fullcalendar.io/apple-touch-icon-76x76.png">
<link rel="apple-touch-icon" sizes="152x152" href="https://fullcalendar.io/apple-touch-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="https://fullcalendar.io/apple-touch-icon-180x180.png">
<link rel="icon" type="image/png" href="https://fullcalendar.io/favicon-192x192.png" sizes="192x192">
<link rel="icon" type="image/png" href="https://fullcalendar.io/favicon-160x160.png" sizes="160x160">
<link rel="icon" type="image/png" href="https://fullcalendar.io/favicon-96x96.png" sizes="96x96">
<link rel="icon" type="image/png" href="https://fullcalendar.io/favicon-16x16.png" sizes="16x16">
<link rel="icon" type="image/png" href="https://fullcalendar.io/favicon-32x32.png" sizes="32x32">
<meta name="msapplication-TileColor" content="#2b5797">
<meta name="msapplication-TileImage" content="https://fullcalendar.io/mstile-144x144.png">

				<link href='//fonts.googleapis.com/css?family=Lato:100,400,700' rel='stylesheet' />
		<link href='https://fullcalendar.io/css/base.css?3.1.0-1.5.0-2' rel='stylesheet' />
		<link rel='stylesheet' href='https://fullcalendar.io/js/fullcalendar-3.1.0/fullcalendar.min.css' />

			<script src='//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js'></script>
	<script src='//ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src='https://fullcalendar.io/js/fullcalendar-3.1.0/fullcalendar.min.js'></script>
	<script src='https://fullcalendar.io/js/home.js?3.1.0-1.5.0-2'></script>

	<script>
	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

	ga('create', 'UA-3534877-8', 'auto');
	ga('send', 'pageview');
</script>
</head>
<body id='index-page'>

	<div id='head' class='section'>
		<div>
			<div class='left'>
				<a href='https://fullcalendar.io/'>
					<img id='logo' src='https://fullcalendar.io/images/logo.svg' width='58' height='48' />
					<h1><span>Full</span>Calendar</h1>
				</a>
			</div>
			<div class='right'>
									

<ul id='nav'>
	<li class='selected'>
		<a href='https://fullcalendar.io/'>Home</a>
	</li>
			<li>
			<a href='https://fullcalendar.io/docs/'>Docs</a>
		</li>
		<li>
		<a href='https://fullcalendar.io/download/'>Download</a>
	</li>
	<li >
		<a href='https://fullcalendar.io/support/'>Support</a>
	</li>
	<li>
		<a href='https://fullcalendar.io/wiki/Contributing/'>Contribute</a>
	</li>
	<li>
		<a href='https://fullcalendar.io/scheduler/'>Scheduler</a>
	</li>
</ul>
							</div>
			<div class='clear'></div>
		</div>
	</div>

	<div id='banner' class='section'>
		<div>
				<h2>
		A JavaScript event calendar. Customizable and open source.
	</h2>
	<p>
		Display a full-size drag-n-drop event calendar, leveraging jQuery.
	</p>
		</div>
	</div>

	
	<div id='body' class='section'>
		<div>
				<div class='two-col'>
		<div class='content'>
			<div id='calendar'></div>
			<div class='larger-link-wrap'>
				<a href='https://fullcalendar.io/js/fullcalendar-3.1.0/demos/agenda-views.html' target='_blank'>Larger version of this demo</a>
			</div>
		</div>
		<div class='sidebar'>
			<h3>Other Demos</h3>
			<ul>
				<li><a href='https://fullcalendar.io/js/fullcalendar-3.1.0/demos/basic-views.html' target='_blank'>Basic views</a></li>
				<li><a href='https://fullcalendar.io/js/fullcalendar-3.1.0/demos/list-views.html' target='_blank'>List views</a></li>
				<li><a href='https://fullcalendar.io/js/fullcalendar-3.1.0/demos/locales.html' target='_blank'>Internationalization</a></li>
				<li><a href='https://fullcalendar.io/js/fullcalendar-3.1.0/demos/timezones.html' target='_blank'>Timezone support</a></li>
				<li><a href='https://fullcalendar.io/js/fullcalendar-3.1.0/demos/gcal.html' target='_blank'>Google Calendar</a></li>
				<li><a href='https://fullcalendar.io/js/fullcalendar-3.1.0/demos/theme.html' target='_blank'>jQuery UI theme</a></li>
				<li><a href='https://fullcalendar.io/js/fullcalendar-3.1.0/demos/selectable.html' target='_blank'>Selecting time ranges</a></li>
				<li><a href='https://fullcalendar.io/js/fullcalendar-3.1.0/demos/external-dragging.html' target='_blank'>External events</a></li>
				<li><a href='https://fullcalendar.io/js/fullcalendar-3.1.0/demos/background-events.html' target='_blank'>Background events</a></li>
			</ul>
		</div>
	</div>
	<div>
		<p>
			<strong>Disclaimer</strong>:
			&nbsp;
			FullCalendar is great for displaying events, but it isn't a complete solution for event content-management.
			Beyond dragging an event to a different time/day, you cannot change an event's name or other associated data.
			It is up to you to add this functionality through FullCalendar's event hooks.
		</p>
	</div>
		</div>
	</div>

	
<div id='foot' class='section'>
	<div>
		<div class='right'>
			<p>
				&copy; 2016&nbsp; FullCalendar LLC
			</p>
			<ul class='line-list'>
				<li><a href='https://github.com/fullcalendar' target='_blank'>GitHub</a></li>
				<li><a href='https://fullcalendar.io/blog/'>Blog</a></li>
				<li><a href='https://fullcalendar.io/donate/'>Donate</a></li>
				<li><a href='https://fullcalendar.io/license/'>License Information</a></li>
			</ul>
			<ul class='line-list'>
				<li><a href='https://fullcalendar.io/blog/2014/06/company-uses-fullcalendar/'>Tell us about your company</a></li>
			</ul>
		</div>
		<div class='left'>
			<div class='featured-posts'>
				<h3>Featured Blog Posts:</h3>
				<ul>
					<li><a href='https://fullcalendar.io/blog/2016/09/feature-packed-releases/'>A Feature-Packed v3.0 and Scheduler v1.4</a> (Sep 4)</li>
					<li><a href='https://fullcalendar.io/blog/2016/07/renovated-issue-tracker/'>The Issue Tracker Has Been Renovated</a> (Jul 4)</li>
				</ul>
			</div>
		</div>
		<div class='clear'></div>
	</div>
</div>

</body>
</html>