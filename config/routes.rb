Rails.application.routes.draw do
	get 'management/members'

	get 'reports/index'
	get 'reports/members';

	get 'access/signIn';
	get 'access/signOut'
	post 'access/getAuthentication';

	get 'home/index';

	root 'home#index';

	get 'management/getData';
	get 'management/getMemberInfo';
	post 'management/setData';
	post 'management/setMemberInfo';

	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
