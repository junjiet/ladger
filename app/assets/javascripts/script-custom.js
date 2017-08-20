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
