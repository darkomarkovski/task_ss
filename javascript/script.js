
$(document).ready(function(){
	// get the odds conversion chart from DB onload
	$.ajax({
		url: 'getdata.php',
		type: 'POST',
		dataType: 'json'
	})
	.done(function(data){ 
		window.odds = data;
	})
	.fail(function(){
		console.log('Something went wrong, Please try again...');
	});


	$('.odds_input').on('input', function() {
		// search the input through odds conversion chart
		var odds_type = $(this).attr('odds_type');
		var typed = $(this).val();
		var odd_types = new Array('us', 'uk', 'eu');
		var found = false;

		if(typed.length > 2){ // don't bother looking if input string is less than 3 chars
			for(var id in window.odds){
				if(typed == window.odds[id][odds_type]){ // found match

					for(var i in odd_types){
						if(odd_types[i] != odds_type){
							// automatically fill in the other fields based on the conversion chart
							$('#'+odd_types[i]).val(window.odds[id][odd_types[i]]);
							found = true;
						}
					}

				}
			}

			if(found){
				// validate inputs against the regex pattern
				if($("#odds_form")[0].checkValidity()){
					// log the input into DB
                    console.log('saving '+typed+' to database');
                    saveUserInput(typed, odds_type);
				} else {
                    console.log('Invalid input chars.');
				}

			} else {
				for(var i in odd_types){
					if(odd_types[i] != odds_type){
						// clear the other inputs if match is not found to avoid confusion
						$('#'+odd_types[i]).val('');
					}
				}
			}
		} else {
			for(var i in odd_types){
				if(odd_types[i] != odds_type){
					$('#'+odd_types[i]).val('');
				}
			}
		}


	});

});

function saveUserInput(input, field){
	$.ajax({
		url: 'saveinput.php',
		type: 'POST',
		dataType: 'text',
		data: {
			input: input,
			field: field
		}
	})
	.done(function(data){ 
		console.log('Input saved in DB..');
	})
	.fail(function(){
		console.log('Error while saving..');
	});

}