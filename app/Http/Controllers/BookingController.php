<?php

namespace App\Http\Controllers;
use Response;
use DB;
use Illuminate\Http\Request;

class BookingController extends Controller
{
    Public function getPakages()
    {
        $Get_Data = DB::table('packages')->get();
        return $Get_Data;
    }
	Public function getPictures()
    {
        $Get_Data = DB::table('gallery')->get();
        return $Get_Data;
    }
	Public function getSlots($date)
	{
		$Get_Data = DB::table('booking')->where('Date', '=', $date)->get();
        return $Get_Data;
    }
    Public function addBooking(Request $request)
    {
        $Package = $request->get("Package");
        $Time = $request->get("Time");
        $Date = $request->get("Date");
        $MemberID = $request->get("MemberID");
        $Number = $request->get("Number");

        DB::table('members')
        ->where('M_ID', $MemberID)
        ->update(['MOBILENO' =>  $Number]);

        DB::table('booking')->insert(
            ['Package' => $Package, 
            'time_slot' => $Time,
            'Date' => $Date,
            'mid' => $MemberID,]);

            return "true";
    }

    Public function getBookings($email)
    {
        $Data = Response::json( DB::select( DB::raw("SELECT id, 
        (SELECT title FROM packages WHERE id = package)as package,(SELECT time_slot FROM timeslots
        WHERE id=booking.time_slot) as timeslot, Date, status FROM booking WHERE (SELECT EMAIL FROM members
        WHERE M_ID = mid) = '$email' ORDER BY id DESC")));
        return $Data;

    }

    Public function getAllBookings()
    {
        $CurDate = date("Y-m-d");
        $Data = Response::json( DB::select( DB::raw("SELECT id,(SELECT FULLNAME FROM members WHERE
        M_ID=mid) as name,(SELECT EMAIL FROM members WHERE M_ID=mid) as email,(SELECT MOBILENO FROM members 
        WHERE M_ID=mid) as number, (SELECT title FROM packages WHERE id=package) as pakage, 
        (SELECT time_slot FROM timeslots WHERE id= b.time_slot) as time_slot, Date, status FROM booking as b 
        WHERE Date >= '$CurDate'")));
        return $Data;
    }

    Public function getBookingInfo($id)
    {
        $CurDate = date("Y-m-d");
        $Data = Response::json( DB::select( DB::raw("SELECT id,(SELECT FULLNAME FROM members WHERE
        M_ID=mid) as name,(SELECT EMAIL FROM members WHERE M_ID=mid) as email,(SELECT MOBILENO FROM members 
        WHERE M_ID=mid) as number, (SELECT title FROM packages WHERE id=package) as pakage, 
        (SELECT time_slot FROM timeslots WHERE id= b.time_slot) as time_slot, Date, status FROM booking as b 
        WHERE Date >= '$CurDate' AND b.id = '$id'")));
        return $Data;

    }

    Public function bookingAction(Request $request)
    {
        $id = $request->get("id");
        $status = $request->get("status");

        DB::table('booking')
        ->where('id', $id)
        ->update(['status' =>  $status]);

        return "true";

    }
}
