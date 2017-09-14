function setupDataTable(tableID) {
	console.log('setting up '+tableID+' as datatable..');
	var tableWrapperID = tableID+'_wrapper';
	var filterID = tableID+'_filter';

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

function showError(divAlertContainerID,errorMessage) {
	if ( $(divAlertContainerID).children().length > 0 ) {
		$('#errorMessage').html(errorMessage);
		$(divAlertContainerID+' .alert').addClass('animation animating shake');
	} else {
		$(divAlertContainerID).append(
			'<div class="alert alert-dismissable alert-danger">'
				+'<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>'
				+'<strong>Error: </strong>'
				+'<span id="errorMessage">'+errorMessage+'</span>'
			+'</div>');
	}
	setTimeout(function () {$(divAlertContainerID+' .alert').removeClass("animation animating shake");},1500);
}
