/*==============================================================================
            Copyright (c) 2011 Qualcomm Technologies Incorporated.
            All Rights Reserved.
            Qualcomm Technologies Confidential and Proprietary
==============================================================================*/

package com.qualcomm.loadjpeg;

import java.nio.ShortBuffer;
import java.nio.ByteBuffer;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.util.Log;

/** The main activity for the FastCV FAST Corner sample app. */
public class LoadJpeg extends Activity
{
   /** Logging tag */
   private static final String         TAG               = "LoadJpeg";


   static
   {
      // Load JNI library
      System.loadLibrary( "fastcvsample" );
   };

   /** 
    * Called when the activity is first created. 
    */
   @Override
   public void onCreate(Bundle savedInstanceState)
   {
      super.onCreate( savedInstanceState );
   }
   
   /** 
    * Resumes camera preview 
    */
   @Override
   protected void onResume()
   {
      super.onResume();

      //loadJPEG( "/sdcard/test.jpg" );
      loadJPEG( );
      
   }

   /**
    * Loads a JPEG into luminance data

    */
   private void loadJPEG(  )
   {
      Log.v(TAG, "loadJPEG entry");
      testPerformance();
      Log.v(TAG, "loadJPEG exit");
   }

   /**
    * Performs conversion from RGB565 to Luminance in native.
    */
   private native void testPerformance( );

}
