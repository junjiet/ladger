class ManagementController < ApplicationController
	def members
		@members = View_member.order('prsn_fullname');
	end

	def refreshData
		personID = params[:prsn_id];
		dataGroup = params[:data_group];
		dataField = params[:data_field];
		@elementID = params[:element_id];
		@elementType = params[:element_type];

		if (dataGroup=='member')
			@data = getMemberData(personID,dataField);
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
end
