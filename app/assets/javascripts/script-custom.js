/*
  jQuery Document ready
*/
$(function()
{	
	var mq = window.matchMedia( "(max-width: 1200px)" );
	if (mq.matches) {
	  $('.listStated').addClass("col-sm-1");
	  $('.listStated').removeClass("col-md-2");
	} else {
	  $('.listStated').removeClass("col-sm-1");
	  $('.listStated').addClass("col-md-2");

	}
	


	
	var strandsPos = ["TAP", "STEM", "HUMSS", "SJ", "GA", "AVFX", "ABM"];
	$(function () 
	{
		$('[data-toggle="popover"]').popover()
		$('.demo-htmlselect-basic1').ddslick(
		{
			//callback function: do anything with selectedData
			onSelected: function(data)
			{
				/*
					we are calling custom created function.
					that function will display selected option detail.
				*/
				displaySelectedData("Callback Function on Dropdown Selection" , data);
			}
		});
	})
	//commented out to remove annoying console entry:
	//console.log(strandsPos.indexOf($('.demo-htmlselect-basic1').attr('data-id')));

	

	$('.demo-htmlselect-basic2').ddslick(
	{
		//callback function: do anything with selectedData
		onSelected: function(data)
		{
			/*
				we are calling custom created function.
				that function will display selected option detail.
			*/
			displaySelectedData("Callback Function on Dropdown Selection" , data);
		}
	});

	$('.demo-htmlselect-basic3').ddslick(
	{
		//callback function: do anything with selectedData
		onSelected: function(data)
		{
			/*
				we are calling custom created function.
				that function will display selected option detail.
			*/
			displaySelectedData("Callback Function on Dropdown Selection" , data);
		}
	});

	$('.demo-htmlselect-basic4').ddslick(
	{
		//callback function: do anything with selectedData
		onSelected: function(data)
		{
			/*
				we are calling custom created function.
				that function will display selected option detail.
			*/
			displaySelectedData("Callback Function on Dropdown Selection" , data);
		}
	});

	$('.demo-htmlselect-basic5').ddslick(
	{

		//callback function: do anything with selectedData
		onSelected: function(data)
		{
			/*
				we are calling custom created function.
				that function will display selected option detail.
			*/
			$('#recoStrand').val(data.selectedData.value);
			displaySelectedData("Callback Function on Dropdown Selection" , data);
			
		},
	});
	
	/*
		adding click event handler
		for making drop down to custom drop down
	*/

	$('#make-it-custom').on('click', function()
	{
		/*
			on click it will generate drop down to custom drop down
		*/
		$('#demo-htmlselect').ddslick(
		{
			//callback function: do anything with selectedData
			onSelected: function(data)
			{
				/*
					we are calling custom created function.
					that function will display selected option detail.
				*/
				displaySelectedData("Callback Function on Dropdown Selection" , data);
			}
		});
	});

	//Restore Original
	$('#restore').on('click', function()
	{
		$('#demo-htmlselect').ddslick('destroy');
		$('#dd-display-data').empty();
	});
	
	/*
		callback function when selection made
		demoIndex : 
			heading for result
		ddData :
			drop down selected object
	*/
	

	$('.rbtnMet').change(function()
	{
		if($(this).val() == '1')
		{
			$('.btnReco').text('Refer to department');
			$('.btnReco').removeClass('btn-primary');
			$('.btnReco').addClass('btn-warning');
		}
		else if($(this).val() == '0')
		{
			$('.btnReco').text('Recommend');
			$('.btnReco').addClass('btn-primary');
			$('.btnReco').removeClass('btn-warning');
		}
		else
		{
			$('.btnReco').hide();
		}
	});

	$('#recoForm').submit(function()
	{
		if($('#recoStrand').val() == "")
		{
			alert('Please select strand!');
			return false;
		}

	});

	$('.toggleNotInCondition').click(function()
	{
		$('.newCondition').removeClass('hide');
	});

	$("#admitTbl").dataTable();
	
	

});

function displaySelectedData(demoIndex, ddData)
	{
		/*
			add heading to div
		*/
		$('#dd-display-data').html("<h3>Data from Demo " + demoIndex + "</h3>");
		/*
			append selected drop down index to result.
			also added code so you can check
			in browser console for selected object
		*/
		$('#dd-display-data').append('<strong>selectedIndex:</strong> ' + ddData.selectedIndex + '<br/><strong>selectedItem:</strong> Check your browser console for selected "li" html element');
		
		/*
			check if selection made.
		*/
		if (ddData.selectedData)
		{
			/*
				appeding more data to result div.
			*/
			$('#dd-display-data').append
			(
				'<br/><strong>Value:</strong>  ' + ddData.selectedData.value +
				'<br/><strong>Description:</strong>  ' + ddData.selectedData.description +
				'<br/><strong>ImageSrc:</strong>  ' + ddData.selectedData.imageSrc
			);
		}
		/*
			browser console code
		*/
		//console.log(ddData);
	}

function setupDataTable(tableWrapperID,filterID) {
	//setup datatable toolbar:
	var dataTableTopTools = $(filterID).closest('.row');
	var dataTableBottomTools = $(tableWrapperID+' .dataTables_paginate').closest('.row');
	dataTableTopTools.children('div:first').insertAfter($(tableWrapperID+' .dataTables_paginate').parent());
	dataTableTopTools.children('div:first').appendTo(dataTableBottomTools);
	dataTableBottomTools.children().removeClass('col-sm-6');
	dataTableBottomTools.children().addClass('col-sm-3');
	dataTableTopTools.remove();

	//setup searchbox:
	var searchInput = $(filterID+' input')
	searchInput.appendTo($(filterID));
	searchInput.addClass('form-control input-sm');
	searchInput.attr('placeholder','Search...');
	$(filterID+' label').remove();

	//setup pagination:
	$(tableWrapperID+' .dataTables_paginate .prev span.text').html('<');
	$(tableWrapperID+' .dataTables_paginate .next span.text').html('>');
	$(tableWrapperID+' .dataTables_paginate .pagination').addClass('pagination-sm');
}