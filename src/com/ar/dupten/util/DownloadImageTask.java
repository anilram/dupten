package com.ar.dupten.util;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;

import com.ar.dupten.R;

import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.support.v4.util.LruCache;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;
import android.widget.ProgressBar;

public class DownloadImageTask {

    private LruCache<String, Bitmap> mMemoryCache;

    /* Create a singleton class to call this from multiple classes */

    private static DownloadImageTask instance = null;

    public static DownloadImageTask getInstance() {
        if (instance == null) {
            instance = new DownloadImageTask();
        }
        return instance;
    }

    //Lock the constructor from public instances
    private DownloadImageTask() {

        // Get max available VM memory, exceeding this amount will throw an
        // OutOfMemory exception. Stored in kilobytes as LruCache takes an
        // int in its constructor.
        final int maxMemory = (int) (Runtime.getRuntime().maxMemory() / 1024);

        // Use 1/8th of the available memory for this memory cache.
        final int cacheSize = maxMemory / 8;

        mMemoryCache = new LruCache<String, Bitmap>(cacheSize) {
            @Override
            protected int sizeOf(String key, Bitmap bitmap) {
                // The cache size will be measured in kilobytes rather than
                // number of items.
                return bitmap.getByteCount() / 1024;
            }
        };
    }

    public void loadBitmap(String avatarURL, ImageView imageView,ProgressBar bar) {
        final String imageKey = String.valueOf(avatarURL);
        final Bitmap bitmap = getBitmapFromMemCache(imageKey);
        if (bitmap != null) {
        	bar.setVisibility(View.GONE);
            imageView.setImageBitmap(bitmap);
        } else {
        		imageView.setImageResource(R.drawable.ic_launcher);
        		Object[] holder = {avatarURL,imageView,bar};
               new DownloadImageTaskViaWeb().execute(holder);
        }
    }

    private void addBitmapToMemoryCache(String key, Bitmap bitmap) {
        if (getBitmapFromMemCache(key) == null) {
            mMemoryCache.put(key, bitmap);
        }
    }

    private Bitmap getBitmapFromMemCache(String key) {
        return mMemoryCache.get(key);
    }

    /* A background process that opens a http stream and decodes a web image. */

    class DownloadImageTaskViaWeb extends AsyncTask<Object, Void, Object[]> {
        ImageView bmImage;
        ProgressBar bar;

        public DownloadImageTaskViaWeb(ImageView bmImage,ProgressBar bar) {
            this.bmImage = bmImage;
            this.bar = bar;
        }
        public DownloadImageTaskViaWeb() {

        }
        
        protected Object[] doInBackground(Object... holders) {

            String urldisplay = (String) holders[0];
            Bitmap mIcon = null;
            InputStream in = null;
            BufferedInputStream bis = null;
            try {
                in = new java.net.URL(urldisplay).openStream();
                bis = new BufferedInputStream(in);
                BitmapFactory.Options o = new BitmapFactory.Options();
  
                o.inSampleSize=4;
                
                mIcon = BitmapFactory.decodeStream(bis,null,o);
                mIcon = Bitmap.createScaledBitmap(mIcon, 50, 50, true);
                
            } 
            catch (Exception e) {
               // Log.e("Error", e.getMessage());
                e.printStackTrace();
            }finally{
            	try {
					in.close();
					bis.close();
				} catch (IOException e) {
					 Log.e("Error close", e.getMessage());
					e.printStackTrace();
				}
            	
            }

            addBitmapToMemoryCache(String.valueOf(urldisplay), mIcon);
            Object[] holder = {mIcon,holders[1],holders[2]};
            return holder;
        }

        /* After decoding we update the view on the main UI. */
        protected void onPostExecute(Object[] result) {
        	Log.d("after", ""+result[0].toString());
        	((ProgressBar) result[2]).setVisibility(View.GONE);
            ((ImageView) result[1]).setImageBitmap((Bitmap)result[0]);
            
        }
    }
}
