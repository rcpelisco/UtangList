$(function(){
	var utangersList = $("#utangersList");
	var utangersListTemplate = $("#utangersListTemplate").html();
	var select = $("#select");
	var listTemplate = $("#listTemplate").html();
	var panel = $("#panel");
	var panelTemplate = $("#panelTemplate").html();
	if(utangersListTemplate != undefined) {
		$.ajax({
			url: "../php/get_has_utang.php",
			success: function(data) {
				utangersList.append(Mustache.render(utangersListTemplate, data));
			},
			dataType: "json"
		});
	}else if(listTemplate != undefined){
		$.ajax({
			url: "../php/get_utangers.php",
			success: function(data) {
				select.append(Mustache.render(listTemplate, data));
			},
			dataType: "json"
		});
	}else if(panelTemplate != undefined) {
		$.ajax({
			type: "post",
			url: "../php/get_utang_list.php",
			dataType: "json",
			success: function(data) {
				panel.append(Mustache.render(panelTemplate, data));
			}
		});
	}

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
				window.location.assign("../utang/");
			}
		});
	});
});