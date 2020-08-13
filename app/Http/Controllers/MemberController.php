<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Response;
use DB;
use Mail;
class MemberController extends Controller
{
   
    Public function userRegister(Request $request)
    {
        $FULLNAME = $request->get("FULLNAME");
        $EMAIL = $request->get("EMAIL");
        $PASSWRD = $request->get("PASSWRD");
        $VERIFIED = $request->get("VERIFIED");
        $PN_ID = $request->get("PN_ID");

        $REGDATE = time();

        $check = DB::table('members')->where('EMAIL', '=', $EMAIL)->sharedLock()->get();
        if ($check->isEmpty())
        {
        DB::table('members')->insert(
            ['FULLNAME' => $FULLNAME, 
            'EMAIL' => $EMAIL,
            'PASSWRD' => password_hash($PASSWRD,PASSWORD_DEFAULT),
            'VERIFIED' => 0,
            'PN_ID' => $PN_ID,
            'REGDATE' => $REGDATE]
        );
    return 'true';
    }
        else {return 'false';}
    }

    public function userLogin(Request $request)
    {

     $EMAIL = $request->get("EMAIL");
     $PASSWD = $request->get("PASSWORD");
     $Get_Data = DB::table('members')->where('EMAIL', '=', $EMAIL)->sharedLock()->get();
     if (!$Get_Data->isEmpty())
     {
         $tpass = $Get_Data[0]->PASSWRD;
         if (password_verify($PASSWD, $tpass)) 
         {
             return "true";
         }
         else {return "false";}

     }
     else {
         return "null";
     }

    }

    public function codeRequest(Request $request) {
        $EMAIL=$request->get("EMAIL");
        $CODE=$request->get("CODE");
  
        $Get_Data = DB::table('members')->where('EMAIL', '=', $EMAIL)->sharedLock()->get();
        if (!$Get_Data->isEmpty())
        {Mail::send([], [], function ($message) use ($CODE,$EMAIL) {
         $message->to($EMAIL)
         ->from('ckutzshop@gmail.com','Ckutz Shop')
         ->subject('Ckutz Shop App (Forget Password Service)')
         ->setBody("<h2>Forget Password</h2><p> <strong>Code</strong> : $CODE  <br><br>  <strong>Please use that code</strong></p>",
         'text/html');
         });
         return "true";}
        else {return "false";}
   }

   public function updatePassword(Request $request )
       {
        $EMAIL = $request->get("EMAIL");
        $PASSWD = $request->get("PASSWORD");
       $var = DB::table('members')
        ->where('EMAIL', $EMAIL)
        ->update(['PASSWRD' =>  password_hash($PASSWD,PASSWORD_DEFAULT)]);
        return $var;
       }

       Public function getMemberInfo($email)
	{
		$Get_Data = DB::table('members')->where('EMAIL', '=', $email)->get();
        return $Get_Data;
	}
}
