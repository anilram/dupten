package com.qison.dupten.util;

import com.qison.dupten.R;

import android.app.ActivityManager;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff.Mode;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.RectF;
import android.media.ThumbnailUtils;
import android.preference.PreferenceManager;
import android.util.Log;
import android.util.TypedValue;
import android.view.WindowManager.BadTokenException;

public class DataManager {
	public static ProgressDialog createProgressDialog(Context mContext) {
        ProgressDialog dialog = new ProgressDialog(mContext);
        try {
                dialog.show();
        } catch (BadTokenException e) {

        }
        dialog.setCancelable(false);
        dialog.setContentView(R.layout.progressdialog);        
        return dialog;
  
}
	public static boolean isLoggedIn = false;
	
	/**
     * Called to save supplied value in shared preferences against given key.
     * @param context Context of caller activity
     * @param key Key of value to save against
     * @param value Value to save
     */
    public static void saveToPrefs(Context context, String key, String value) {
        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(context);
        final SharedPreferences.Editor editor = prefs.edit();
        editor.putString(key,value);
        editor.commit();
        
    }

    /**
     * Called to retrieve required value from shared preferences, identified by given key.
     * Default value will be returned of no value found or error occurred.
     * @param context Context of caller activity
     * @param key Key to find value against
     * @param defaultValue Value to return if no data found against given key
     * @return Return the value found against given key, default if not found or any error occurs
     */
    public static String getFromPrefs(Context context, String key, String defaultValue) {
        SharedPreferences sharedPrefs = PreferenceManager.getDefaultSharedPreferences(context);
        try {
            return sharedPrefs.getString(key, defaultValue);
        } catch (Exception e) {
             e.printStackTrace();
             return defaultValue;
        }
    }
    
    public static Bitmap getCircleBitmap(Bitmap bm,Context context) {
    	
        int sice = Math.min((bm.getWidth()), (bm.getHeight()));
        float pixels = TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 60, context.getResources().getDisplayMetrics());
        Bitmap bitmap = ThumbnailUtils.extractThumbnail(bm, (int)pixels, (int)pixels);

        Bitmap output = Bitmap.createBitmap(bitmap.getWidth(), bitmap.getHeight(), Bitmap.Config.ARGB_8888);

        Canvas canvas = new Canvas(output);
       
        Paint paintColor = new Paint();
        Rect rect = new Rect(0, 0, bitmap.getWidth(), bitmap.getHeight());
        paintColor.setFlags(Paint.ANTI_ALIAS_FLAG);
        RectF rectF = new RectF(rect); 
       
        canvas.drawOval(rectF, paintColor);
        Paint paintImage = new Paint();
        paintImage.setXfermode(new PorterDuffXfermode(Mode.SRC_IN));
     
        canvas.drawBitmap(bitmap, rect, rect, paintImage);
        
        
        return output;
    }
    
//    private void logMemoryInfo(Context context, String TAG) {
//    	   ActivityManager activityManager = (ActivityManager) context.getSystemService(getActivity().ACTIVITY_SERVICE);
//    	   int memoryClass = activityManager.getMemoryClass();
//    	   ActivityManager.MemoryInfo memoryInfo = new ActivityManager.MemoryInfo();
//    	   activityManager.getMemoryInfo(memoryInfo);
//
//    	   Log.i(TAG, "\n------------ RAM -------------");
//    	   Log.i(TAG, "mem class: " + memoryClass);
//    	   Log.i(TAG, "mem avail: " + memoryInfo.availMem);
//    	   Log.i(TAG, "low mem:   " + memoryInfo.lowMemory);
//    	   Log.i(TAG, "threshold: " + memoryInfo.threshold);
//
//    	   long mb = 1024*1024;
//    	   Runtime runtime = Runtime.getRuntime();
//    	   Log.i(TAG, "Used Memory:  " + (runtime.totalMemory() - runtime.freeMemory()) / mb);
//    	   Log.i(TAG, "Free Memory:  " + runtime.freeMemory()  / mb);
//    	   Log.i(TAG, "Total Memory: " + runtime.totalMemory() / mb);
//    	   Log.i(TAG, "Max Memory:   " + runtime.maxMemory()   / mb);
//    	}
}
