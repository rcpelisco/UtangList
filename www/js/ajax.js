$(function(){
	var utangersList = $("#utangersList");
	var utangersListTemplate = $("#utangersListTemplate").html();
	var select = $("#select");
	var listTemplate = $("#listTemplate").html();
	$.ajax({
		url: "../php/get_has_utang.php",
		success: function(data) {
			console.log(data);
			utangersList.append(Mustache.render(utangersListTemplate, data));
		},
		dataType: "json"
	});

	$.ajax({
		url: "../php/get_utangers.php",
		success: function(data) {
			console.log(data);
			select.append(Mustache.render(listTemplate, data));
		},
		dataType: "json"
	});

	$("#btnSaveUtanger").on('click', function() {
		var firstName = $("#firstName").val();
		var lastName = $("#lastName").val();
		var contactNo = $("#contactNo").val();
		var data = {
			"first_name": firstName,
			"last_name": lastName,
			"contact_no": contactNo
		};
		console.log(data);
		$.ajax({
			type: "post",
			url: "../php/add_utanger.php",
			data: data,
			success: function(data) {
				console.log("Inserted!");
				console.log(data);
				window.location.replace("../add_utang/");
			},
			error: function(e,r) {
				console.log(e);
				console.log(r);
			}
		});
		console.log("clicked");
	});

	$("#btnSaveUtang").on('click', function() {
		var id = $("#select").val();
		var amount = $("#amount").val();
		if(amount != "") {
			$.ajax({
				type: "post",
				url: "../php/add_utang.php",
				data: {
					"utanger_id": id,
					"amount": amount
				},
				success: function(data) {
					console.log(data);
					window.location.replace("../home/");
				}
			});
		}
	});

	$("#utangersList").on("click", ".get-utang", function() {
		var id = $(this).attr("id");
		$.ajax({
			type: "get",
			url: "../php/get_utang.php",
			data: {"id": id},
			success: function(data) {
				console.log(data);
			}
		});
	});
});