package com.ar.dupten;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

import android.app.ActionBar;
import android.app.Activity;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Base64;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import com.ar.dupten.MainActivity;
import com.ar.dupten.util.DataManager;
import com.ar.dupten.util.UserData;

public class UserProfileActivity extends Activity {
	ActionBar actionBar;
	TextView submitView;
	UserData usr;
	String imageUrl;
	TextView nameView ;
	TextView companyView ;
	TextView cityView ;
	TextView countryView ;
	TextView designationView ;
	TextView emailView ;
	TextView mobileView ;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_user_profile);
		actionBar = getActionBar();
		actionBar.setDisplayHomeAsUpEnabled(true);
		actionBar.setHomeButtonEnabled(true);
		Intent intent = getIntent();
		usr = (UserData) intent.getParcelableExtra("user");
		if(usr!=null) {
			findViewById(R.id.up_edit).setVisibility(View.VISIBLE);
			findViewById(R.id.up_profile).setVisibility(View.GONE);
			nameView = (TextView)findViewById(R.id.up_name);
			companyView = (TextView)findViewById(R.id.up_company);
			cityView = (TextView)findViewById(R.id.up_city);
			countryView = (TextView)findViewById(R.id.up_country);
			designationView = (TextView)findViewById(R.id.up_designation);
			emailView = (TextView)findViewById(R.id.up_email);
			mobileView = (TextView)findViewById(R.id.up_mobile);
			nameView.setText(usr.getName());
			companyView.setText(usr.getComapany());
			cityView.setText(usr.getCity());
			countryView.setText(usr.getCountry());
			designationView.setText(usr.getDesignation());
			emailView.setText(usr.getEmail());
			mobileView.setText(usr.getPhone());
			imageUrl = usr.getImg();
		}
		else{
			findViewById(R.id.up_edit).setVisibility(View.GONE);
			findViewById(R.id.up_profile).setVisibility(View.VISIBLE);			
			ImageView imageView = (ImageView) findViewById(R.id.up_pic);			
			imageView.setImageBitmap(DataManager.getCircleBitmap(Bitmap.createScaledBitmap(stringToBitMap(DataManager.getFromPrefs(getApplicationContext(), "picString", "")), 200, 200, true),this));
			TextView upNameView = (TextView) findViewById(R.id.up_user_name);
			upNameView.setText(DataManager.getFromPrefs(getApplicationContext(), "userName", ""));
			TextView upDesignationView = (TextView) findViewById(R.id.up_user_designation);
			upDesignationView.setText(DataManager.getFromPrefs(getApplicationContext(), "userDesignation", ""));
			TextView upComapanyView = (TextView) findViewById(R.id.up_user_company);
			upComapanyView.setText(DataManager.getFromPrefs(getApplicationContext(), "userCompany", ""));
			TextView upLocationView = (TextView) findViewById(R.id.up_user_location);
			upLocationView.setText(DataManager.getFromPrefs(getApplicationContext(), "userCity", "")+" "+DataManager.getFromPrefs(getApplicationContext(), "userCountry", ""));
		}
		submitView = (TextView) findViewById(R.id.up_submit);
		submitView.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				if(imageUrl!=null && imageUrl.length()>1){
					 new LoadImagefromUrl( ).execute(imageUrl);					 
				}
				else
					DataManager.saveToPrefs(getApplicationContext(),"userName", nameView.getText().toString());
					DataManager.saveToPrefs(getApplicationContext(),"userCompany", companyView.getText().toString());
					DataManager.saveToPrefs(getApplicationContext(),"userCity", cityView.getText().toString());
					DataManager.saveToPrefs(getApplicationContext(),"userCountry", countryView.getText().toString());
					DataManager.saveToPrefs(getApplicationContext(),"userDesignation", designationView.getText().toString());
					DataManager.saveToPrefs(getApplicationContext(),"userEmail", emailView.getText().toString());
					DataManager.saveToPrefs(getApplicationContext(),"userPhone", mobileView.getText().toString());
					DataManager.saveToPrefs(getApplicationContext(), "isUserLoggedIn", "1");
					Intent intent = new Intent(getBaseContext(), MainActivity.class);
					intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
					startActivity(intent);
			}
		});
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
			if(findViewById(R.id.up_edit).getVisibility()!=View.VISIBLE)
				getMenuInflater().inflate(R.menu.user_profile, menu);			
		return true;
	}
	
//	@Override
//	public void onBackPressed() {
//		
//		super.onBackPressed();
//	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		// Handle action bar item clicks here. The action bar will
		// automatically handle clicks on the Home/Up button, so long
		// as you specify a parent activity in AndroidManifest.xml.
		int id = item.getItemId();
//		if (id == R.id.action_settings) {
//			return true;
//		}
		if(id==android.R.id.home){
			onBackPressed();
			return true;
		} else if(id == R.id.up_edit_option){
			findViewById(R.id.up_edit).setVisibility(View.VISIBLE);
			findViewById(R.id.up_profile).setVisibility(View.GONE);
			nameView = (TextView)findViewById(R.id.up_name);
			companyView = (TextView)findViewById(R.id.up_company);
			cityView = (TextView)findViewById(R.id.up_city);
			countryView = (TextView)findViewById(R.id.up_country);
			designationView = (TextView)findViewById(R.id.up_designation);
			emailView = (TextView)findViewById(R.id.up_email);
			mobileView = (TextView)findViewById(R.id.up_mobile);
			nameView.setText(DataManager.getFromPrefs(getApplicationContext(), "userName", ""));
			companyView.setText(DataManager.getFromPrefs(getApplicationContext(), "userCompany", ""));
			cityView.setText(DataManager.getFromPrefs(getApplicationContext(), "userCity", ""));
			countryView.setText(DataManager.getFromPrefs(getApplicationContext(), "userCountry", ""));
			designationView.setText(DataManager.getFromPrefs(getApplicationContext(), "userDesignation", ""));
			emailView.setText(DataManager.getFromPrefs(getApplicationContext(), "userEmail", ""));
			mobileView.setText(DataManager.getFromPrefs(getApplicationContext(), "userPhone", ""));
			invalidateOptionsMenu();
	
		}
		return super.onOptionsItemSelected(item);
	}
	
	 private Bitmap getImageBitmap(String url) {
	        Bitmap bm = null;
	        try {
	            URL aURL = new URL(url);
	            URLConnection conn = aURL.openConnection();
	            conn.connect();
	            InputStream is = conn.getInputStream();
	            BufferedInputStream bis = new BufferedInputStream(is);
	            bm = BitmapFactory.decodeStream(bis);
	            bis.close();
	            is.close();
	       } catch (IOException e) {
	           Log.e("Bit Map exception", "Error getting bitmap", e);
	       }
	       return bm;
	    } 
	 
	 private String bitMapToString(Bitmap bitmap){
	     ByteArrayOutputStream baos=new  ByteArrayOutputStream();
	     bitmap.compress(Bitmap.CompressFormat.PNG,100, baos);
	     byte [] b=baos.toByteArray();
	     String temp=Base64.encodeToString(b, Base64.DEFAULT);
	     return temp;
	}
	 
	 private Bitmap stringToBitMap(String encodedString){
	   try {
		   	  byte [] encodeByte=Base64.decode(encodedString,Base64.DEFAULT);
		      Bitmap bitmap=BitmapFactory.decodeByteArray(encodeByte, 0, encodeByte.length);
		      return bitmap;
		   } catch(Exception e) {
			   e.getMessage();
			   return null;
		   }
	 }
	 
	 private class LoadImagefromUrl extends AsyncTask< Object, Void, Bitmap > {
	        //ImageView ivPreview = null;

	        @Override
	        protected Bitmap doInBackground( Object... params ) {
	          //  this.ivPreview = (ImageView) params[0];
	            String url = (String) params[0];
	            Log.d("url", url);
	            return loadBitmap(url);
	        }

	        @Override
	        protected void onPostExecute( Bitmap result ) {
	            super.onPostExecute( result );
	            DataManager.saveToPrefs(getApplicationContext(), "picString", bitMapToString(result));
				DataManager.saveToPrefs(getApplicationContext(),"userName", nameView.getText().toString());
				DataManager.saveToPrefs(getApplicationContext(),"userCompany", companyView.getText().toString());
				DataManager.saveToPrefs(getApplicationContext(),"userCity", cityView.getText().toString());
				DataManager.saveToPrefs(getApplicationContext(),"userCountry", countryView.getText().toString());
				DataManager.saveToPrefs(getApplicationContext(),"userDesignation", designationView.getText().toString());
				DataManager.saveToPrefs(getApplicationContext(),"userEmail", emailView.getText().toString());
				DataManager.saveToPrefs(getApplicationContext(),"userPhone", mobileView.getText().toString());
				DataManager.saveToPrefs(getApplicationContext(), "isUserLoggedIn", "1");
	            Log.d("bitmap2", DataManager.getFromPrefs(getApplicationContext(), "picString", ""));
	            Intent intent = new Intent(getBaseContext(), MainActivity.class);
				intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
				startActivity(intent);
	        }
	    }

	    private Bitmap loadBitmap( String url ) {
	       // URL newurl = null;
	        Bitmap bitmap = null;
	        try {
	        	InputStream in = new java.net.URL(url).openStream();
	        	bitmap = BitmapFactory.decodeStream(in);
	        } catch ( MalformedURLException e ) {
	            e.printStackTrace( );
	        } catch ( IOException e ) {

	            e.printStackTrace( );
	        }
	        return bitmap;
	    }

	 
}
