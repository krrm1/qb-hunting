function startBar (text, time) {
	$(".bar").stop();
	$(".bar").css({ width: "4px" });
	$('#text').html(text)
	$('#wrapper').fadeIn(300)
	$(".bar").animate({
		width: "344px",
	}, time, "linear",
		function () {
			$('#wrapper').fadeOut(200)
		});
};

$(function () {
	window.onload = (e) => {
		window.addEventListener('message', (event) => {
			var data = event.data;
			startBar(data.text, data.time)
		});
	};
});