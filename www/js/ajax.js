$(function(){
	var utangersList = $("#utangersList");
	var utangersListTemplate = $("#utangersListTemplate").html();
	var select = $("#select");
	var listTemplate = $("#listTemplate").html();
	var panel = $("#panel");
	var panelTemplate = $("#panelTemplate").html();
	function getUtangList() {
		$.ajax({
			type: "post",
			url: "../php/get_utang_list.php",
			dataType: "json",
			success: function(data) {
				panel.contents().remove();
				panel.append(Mustache.render(panelTemplate, data));
			}
		});
	}
	
	function getUtang(id) {
		$.ajax({
			type: "get",
			url: "../php/get_utang.php",
			data: {"id": id},
			success: function(data) {
				console.log(data);
				window.location.assign("../utang/");
			}
		});
	}

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
		getUtangList();	
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
		getUtang(id);
	});

	$("#panel").on("click", ".btn-pay", function() {
		var button = $(this);
		var id = button.attr("data-id");
		var utangerId = button.attr("data-utanger");
		console.log(utangerId);
		
		$.ajax({
			type: "post",
			url: "../php/pay_utang.php",
			data: {"id":id},
			success: function(data) {
				console.log(data);
				getUtang(utangerId);
				setTimeout(function() {getUtangList()}, 5000);
			}
		});
	});

	$("#panel").on("click", ".btn-del", function() {
		var button = $(this);
		var id = button.attr("data-id");
		var utangerId = button.attr("data-utanger");
		console.log(utangerId);
		
		$.ajax({
			type: "post",
			url: "../php/delete_utang.php",
			data: {"id":id},
			success: function(data) {
				console.log(data);
				getUtang(utangerId);
				setTimeout(function() {getUtangList()}, 5000);
			},
			error: function(e,r) {
				console.log(e);
				console.log(r);
			}
		});
	});
});