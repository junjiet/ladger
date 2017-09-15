class ManagementController < ApplicationController
	def members
		@members = View_member.order('prsn_fullname');
	end

	def getData
		personID = params[:prsn_id];
		dataGroup = params[:data_group];
		dataField = params[:data_field];
		@elementID = params[:element_id];
		@elementType = params[:element_type];

		if (dataGroup=='member' || dataGroup=='person')
			@data = (dataGroup=='person'
				? getPersonData(personID,dataField) : getMemberData(personID,dataField));
			if (@data==nil)
				@dataType = 'string';
			else
				if @data.is_a?(Module.const_get('Numeric'))
					@dataType='numeric';
				elsif @data.class.to_s=='ActiveSupport::TimeWithZone'
					@dataType='datetime';
				else
					@dataType='string';
				end
			end
		end
	end

	def setData
		@personID = params[:prsn_id];
		dataField = params[:data_field];

		@errorCode = nil;
		if (dataField=='active_status')
			@newStatus = params[:data_value].to_i;
			setMemberData(@personID,dataField,@newStatus);
			@activeStatusName = 'Active';
			@activeCommand = 'Deactivate';
			@activeNext = 0;
			@activeStatusButton = 'btn-success';
			@activeStatusButtonPrevious = 'btn-default';
			if @newStatus==0 then
				@activeStatusName = 'Inactive';
				@activeCommand = 'Activate';
				@activeNext = 1;
				@activeStatusButton = 'btn-default';
				@activeStatusButtonPrevious = 'btn-success';
			end
		end
	end

	# -----------------------------------------------------------------
	private
	def getMemberData(personID,dataField)
		memberInfo = View_member.where('prsn_id=?',personID);

		data = nil;
		if (memberInfo.length>0)
			data = memberInfo[0][dataField];
		end

		return data;
	end

	def getPersonData(personID,dataField)
		personInfo = View_person.where('prsn_id=?',personID);

		data = nil;
		if (personInfo.length>0)
			data = personInfo[0][dataField];
		end

		return data;
	end

	def setMemberData(personID,dataField,dataValue)
		member = Member.find_by(member_id: personID);
		member[dataField] = dataValue;
		member.save;
	end
end
