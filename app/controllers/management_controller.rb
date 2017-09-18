class ManagementController < ApplicationController
	def members
		@members = View_member.order('prsn_fullname');
	end

	def getMemberInfo
		personID = params[:prsn_id];
		@personInfo = View_person.where('prsn_id=?',personID);
		@memberInfo = View_member.where('prsn_id=?',personID);
	end

	def setMemberInfo
		personID = params[:prsn_id];
		begin
			Person.transaction do
				person = Person.find_by!(prsn_id: personID);

				prsnLname = params[:prsn_lname].strip;
				prsnLname = nil if prsnLname=='';
				prsnLnamesuffix = params[:prsn_lnamesuffix].strip;
				prsnLnamesuffix = nil if prsnLnamesuffix=='';
				prsnFname = params[:prsn_fname].strip;
				prsnFname = nil if prsnFname=='';
				prsnFnamesuffix = params[:prsn_fnamesuffix].strip;
				prsnFnamesuffix = nil if prsnFnamesuffix=='';
				prsnMname = params[:prsn_mname].strip;
				prsnMname = nil if prsnMname=='';
				prsnMinitial = params[:prsn_minitial].strip;
				prsnMinitial = nil if prsnMinitial=='';
				prsnGender = params[:prsn_gender].strip;
				prsnGender = nil if prsnGender=='';
				prsnCivilstatus = params[:prsn_civilstatus].strip;
				prsnCivilstatus = nil if prsnCivilstatus=='';
				publicID = params[:employee_id].strip;
				publicID = nil if publicID=='';

				person.prsn_lname = prsnLname;
				person.prsn_lnamesuffix = prsnLnamesuffix;
				person.prsn_fname = prsnFname;
				person.prsn_fnamesuffix = prsnFnamesuffix;
				person.prsn_mname = prsnMname;
				person.prsn_minitial = prsnMinitial;
				person.prsn_gender = prsnGender;
				person.prsn_civilstatus = prsnCivilstatus;

				dateFormat = '%m/%d/%Y';
				prsnBirthdate = params[:prsn_birthdate];
				if prsnBirthdate=='' then
					prsnBirthdate = nil;
				else
					prsnBirthdate = Date.strptime(prsnBirthdate,dateFormat);
				end
				person.prsn_birthdate = prsnBirthdate;

				# raise 'update cancelled: implementing exception handling.';
				if (prsnLname==nil || prsnFname==nil || prsnGender==nil ||
					(prsnMname!=nil && prsnMinitial==nil) || (prsnMname==nil && prsnMinitial!=nil) ||
					publicID==nil) then
					raise MissingInformationError;
				end

				member = Public_id.find_by!(prsn_id: personID);
				member.public_id = publicID;

				if (!(person.valid?) || !(member.valid?)) then
					raise InvalidInformationError;
				end

				member.save!;
				person.save!;

				e = nil;
				@errorCode = nil;
			end
		rescue InvalidInformationError => e
			@errorCode = 'WEB-0102';
		rescue MissingInformationError => e
			@errorCode = 'WEB-0103';
		rescue Exception => e
			@errorCode = 'WEB-0000';
		ensure
			if (@errorCode!=nil) then
				@errorMessage = getWebErrorMessage(@errorCode);
				@errorMessage = "#{@errorMessage} - #{$!}" if ($! != nil);
				puts "#{@errorCode}: #{@errorMessage}";
				puts e.backtrace[0];
			end
		end
	end

	def getData
		personID = params[:prsn_id];
		dataGroup = params[:data_group];
		dataField = params[:data_field];
		@elementID = params[:element_id];
		@elementType = params[:element_type];

		if (dataGroup=='member' || dataGroup=='person')
			@data = (dataGroup=='person' ? getPersonData(personID,dataField) : getMemberData(personID,dataField));
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
