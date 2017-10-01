$(document).ready(function(){
	function refreshData(personID,element,elementType) {
		var dataGroup = $(element).data('group');
		var dataField = $(element).data('refresh');
		var dataFilter = $(element).attr('data-filter');
		var elementID = $(element).attr('id');

		$.ajax({
			url: '<%= @urlBase %>/management/getData',
			type : 'GET',
			data : { prsn_id : personID,
				data_group : dataGroup,
				data_field : dataField,
				data_filter : dataFilter,
				element_id : elementID,
				element_type : elementType
			}
		});
	}
	function setData(personID,dataField,dataValue) {
		$.ajax({
			url: '<%= @urlBase %>/management/setData',
			type : 'POST',
			data : {
				prsn_id : personID,
				data_field : dataField,
				data_value : dataValue
			}
		});
	}

	//update member status:
	$('td.member-status li a').on('click',function(){
		$(this).closest('.member-row').find('.indicator').addClass('show');

		var personID = $(this).closest('.member-row').attr('data-person-id');
		var activeNew = $(this).attr('data-active-status');
		setData(personID,'active_status',activeNew);
	});

	//set #tableMembers as data table:
	var unitTable = $('#tableMembers').dataTable({
		"aoColumnDefs": [{'bSortable': false, 'aTargets': [0,3,4]}],
		"iDisplayLength" : 10
	});
	setupDataTable('#tableMembers');

	//set modals draggable:
	//credits to a certain Andres Ilich
	//url: https://stackoverflow.com/a/12592150
	$(".modal").draggable({handle: '.modal-header'});

	//initialize datepickers:
	$('.datepicker').datepicker();

	//initialize comboboxes:
	$('#cboGender').selectize({
		maxItems: 1,
		options: [
			{gender_value: 'M', gender_display: 'Male'},
			{gender_value: 'F', gender_display: 'Female'}
		],
		searchField: ["group_display"],
		valueField: "gender_value",
		labelField: "gender_display",
		items: [2]
	});

	$('#cboCivilstatus').selectize({
		maxItems: 1,
		options: [
			{status_value: 'S', status_display: 'Single'},
			{status_value: 'M', status_display: 'Married'},
			{status_value: 'W', status_display: 'Widow/Widower'},
			{status_value: 'P', status_display: 'Separated'}
		],
		searchField: ["status_display"],
		valueField: "status_value",
		labelField: "status_display",
		items: [4]
	});

	//---------------------------------------------------------
	//EVENTS:
	var readingPersonalInfo = false;
	$(document).off('click','td.member-info');
	$(document).on('click','td.member-info',function(){
		if (readingPersonalInfo) {
			console.log('double read of info prevented.');
			return;
		}
		readingPersonalInfo = true;

		var memberRow = $(this).closest('tr.member-row');
		var personID = memberRow.attr('data-person-id');

		$('#divMemberWidget').attr('data-person-id',personID);
		$('#modalMemberPersonalInfo').modal({backdrop: 'static'});

		$.ajax({
			url: '<%= @urlBase %>/management/getMemberInfo',
			type : 'GET',
			data : { prsn_id : personID },
			success : function() {
				readingPersonalInfo = false;
				$('#txtLname').focus();
			},
			error: function() {
				readingPersonalInfo = false;
			}
		});
	});
	
	$('#modalMemberPersonalInfo').on('shown.bs.modal',function(){
		if (!readingPersonalInfo) { $('#txtLname').focus(); }
	});

	$('#modalMemberPersonalInfo').on('hide.bs.modal',function(){
		//reset .data-display refreshed status
		$('#modalMemberPersonalInfo .data-display').attr('data-refreshed',false);

		//removed error messages
		hideError('#divError');

		//reset UI
		$('#txtEmployeeID').attr('disabled','');
		$('#divMemberWidget').removeClass('hidden');
		$('#btnEditEmployeeID').removeClass('disabled');

		//return loading indicator
		$('#modalMemberPersonalInfo .indicator').addClass('show');
	})

	var savingPersonalInfo = false;
	$('#btnSaveMemberPersonalInfo').on('click',function(){
		if (savingPersonalInfo) {
			console.log('double submission of info prevented.');
			return;
		}
		savingPersonalInfo = true;

		$('#modalMemberPersonalInfo .indicator').addClass('show');

		var personID = $('#divMemberWidget').attr('data-person-id');
		var newLname = $('#txtLname').val();
		var newLnamesuffix = $('#txtLnamesuffix').val();
		var newFname = $('#txtFname').val();
		var newFnamesuffix = $('#txtFnamesuffix').val();
		var newMname = $('#txtMname').val();
		var newMinitial = $('#txtMinitial').val();
		var newGender = $('#cboGender')[0].selectize.getValue();
		var newCivilstatus = $('#cboCivilstatus')[0].selectize.getValue();
		var newBirthdate = $('#dtpBirthdate').val();
		var newEmployeeID = $('#txtEmployeeID').val();

		$.ajax({
			url: '<%= @urlBase %>/management/setMemberInfo',
			type: 'POST',
			data: { prsn_id: personID,
				prsn_lname: newLname,
				prsn_lnamesuffix: newLnamesuffix,
				prsn_fname: newFname,
				prsn_fnamesuffix: newFnamesuffix,
				prsn_mname: newMname,
				prsn_minitial: newMinitial,
				prsn_gender: newGender,
				prsn_civilstatus: newCivilstatus,
				prsn_birthdate: newBirthdate,
				employee_id: newEmployeeID },
			success: function(){
				savingPersonalInfo = false;
			},
			error: function(){
				savingPersonalInfo = false;
			}
		});
	});

	//auto middle initial:
	$('#txtMname').on('keyup',function(){
		var mi = null;
		if ($('#txtMname').val().length>=1) {
			mi = $('#txtMname').val().charAt(0)+'.';
		}
		$('#txtMinitial').val(mi);
	});

	$('#btnNewMember').on('click',function(){
		//setup UI
		$('#divMemberWidget').addClass('hidden');
		$('#btnEditEmployeeID').addClass('disabled');
		$('#txtEmployeeID').removeAttr('disabled');

		//clear modal fields
		$('#divMemberWidget').attr('data-person-id','');
		$('#modalMemberPersonalInfo input').val('');

		//show modal
		$('#modalMemberPersonalInfo .indicator').removeClass('show');
		$('#modalMemberPersonalInfo').modal({backdrop: 'static'});
	})

	$('#btnEditEmployeeID').on('click',function(){
		$('#txtEmployeeID').removeAttr('disabled');
		$('#txtEmployeeID').focus();
	})
});
