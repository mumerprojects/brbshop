<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
Route::group(['middleware'=>['api']],function(){
    //Login Module---------------------------------------------------------
    Route::post('Member/userRegister','MemberController@userRegister');
    Route::post('Member/userLogin','MemberController@userLogin');
    Route::post('Member/codeRequest','MemberController@codeRequest');
    Route::post('Member/updatePassword','MemberController@updatePassword');
    //Ending Login Module--------------------------------------------------

    //Booking Module-------------------------------------------------------
    Route::get('Booking/getPakages','BookingController@getPakages');
    Route::get('Booking/getSlots/{date}','BookingController@getSlots');
    Route::get('Member/getMemberInfo/{email}','MemberController@getMemberInfo');
    Route::post('Booking/addBooking','BookingController@addBooking');
    Route::get('Booking/getBookings/{email}','BookingController@getBookings');
    Route::get('Booking/getAllBookings','BookingController@getAllBookings');
    Route::get('Booking/getBookingInfo/{id}','BookingController@getBookingInfo');
    Route::post('Booking/bookingAction','BookingController@bookingAction');
    //Ending Booking Module--------------------------------------------------
	
	//Galary Module----------------------------------------------------------
	Route::get('Booking/getPictures','BookingController@getPictures');
	//Ending Galary Module--------------------------------------------------
});