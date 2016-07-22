<?php


Route::group(
[
    'prefix' => LaravelLocalization::setLocale(),
    'middleware' => [ 'localeSessionRedirect', 'localizationRedirect']
],
function()
{
    

    /**  ALL LOCALIZED ROUTES INSIDE THIS GROUP **/
    
    Route::group(
	[
		'prefix' => 'cms',
		'namespace' => 'Cms',
		'middleware' => ['auth']
	], 
	function()
	{

		Route::get('/', function () {
			return view('adminpanel.dashboard');
		});

		Route::resource('/users',   'CmsUsersController');
		Route::resource('/roles',   'CmsRolesController');
		Route::resource('/permissions','CmsPermissionsController');


		Route::get('translations',           'CmsTranslationsController@index');
		Route::post('translations/import',   'CmsTranslationsController@importTranslations');
		Route::post('translations/export',   'CmsTranslationsController@exportTranslations');
		Route::post('translations/save',     'CmsTranslationsController@save');
		Route::post('translations/getView',  'CmsTranslationsController@getView');
		Route::get('translations/getView',   'CmsTranslationsController@getView');
       	Route::get('translations/getIndex',  'CmsTranslationsController@getIndex');
       	Route::post('translations/postEdit', 'CmsTranslationsController@postEdit');

	});

	Route::get('/', function () {
    	return view('welcome');
	});


	Route::get('cms/login', 'Auth\AuthController@getLogin');
	Route::post('cms/login', 'Auth\AuthController@postLogin');
	Route::get('cms/logout', 'Auth\AuthController@getLogout');


});


