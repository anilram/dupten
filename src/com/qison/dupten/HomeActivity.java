package com.qison.dupten;

import java.util.Locale;
import java.util.Timer;
import java.util.TimerTask;
import android.app.ActionBar;
import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.view.GestureDetector;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.GoogleMap.OnCameraChangeListener;

import com.google.android.gms.maps.MapFragment;
import com.google.android.gms.maps.OnMapReadyCallback;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.MarkerOptions;
import com.qison.dupten.model.GPSTracker;

public class HomeActivity extends Activity implements OnMapReadyCallback{
	private ActionBar actionBar;
	private TextView dirView;
	private float srcLat = 17.74f;
	private float srcLon = 74.47f;
	private float destLat = 17.4447068f;
	private float destLog = 78.4663812f;
	private GPSTracker mGPSTracker;
	private Timer mLocalCatTimer;
	GoogleMap map;
	
	//TouchableWrapper mTouchView;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_home);
		actionBar = getActionBar();
		actionBar.setDisplayHomeAsUpEnabled(true);
		actionBar.setHomeButtonEnabled(true);
	}

	/* (non-Javadoc)
	 * @see android.app.Activity#onStart()
	 */
	@Override
	protected void onStart() {
		mGPSTracker = new GPSTracker(this);
		
		// setup location timer
				mLocalCatTimer = new Timer();
				mLocalCatTimer.schedule(new TimerTask() {
					@Override
					public void run() {
						UpdateLocationMethod();
					}
				}, 0, 20 * 1 * 1000);
		dirView = (TextView) findViewById(R.id.ed_getdirection);
		final HomeActivity self = this;
		dirView.setOnClickListener(new View.OnClickListener() {			
			@Override
			public void onClick(View v) {
				String uri = String.format(Locale.ENGLISH, "http://maps.google.com/maps?saddr=%f,%f&daddr=%f,%f ", srcLat, srcLon, destLat, destLog);
				Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(uri));
				intent.setClassName("com.google.android.apps.maps", "com.google.android.maps.MapsActivity");
				 try
			        {
			            startActivity(intent);
			        }
			        catch(ActivityNotFoundException ex)
			        {
			            try
			            {
			                Intent unrestrictedIntent = new Intent(Intent.ACTION_VIEW, Uri.parse(uri));
			                startActivity(unrestrictedIntent);
			            }
			            catch(ActivityNotFoundException innerEx)
			            {
			                Toast.makeText(self, "Please install a maps application", Toast.LENGTH_LONG).show();
			            }
			}
			}
		});
		MapFragment mapFragment = ((MapFragment) getFragmentManager()
			    .findFragmentById(R.id.map));
		mapFragment.getMapAsync(this);
		FrameLayout mapFrameLayout = (FrameLayout) findViewById(R.id.frameMap);
		mapFragment.getMap().getUiSettings().setAllGesturesEnabled(false);
		mapFrameLayout.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View v) {
				Toast.makeText(self, "double Click", Toast.LENGTH_SHORT);
				Log.d("sdckj", "v"+v.getAlpha());
				
			}
		});
//			mTouchView = new TouchableWrapper(this);
//		    mTouchView.addView(mapFrameLayout);
//		final GestureDetector gestureDetector = new GestureDetector(self, new GestureDetector.SimpleOnGestureListener() {
//	        @Override
//	        public boolean onDoubleTap(MotionEvent e) {
//	        	Toast.makeText(self, "double Click", Toast.LENGTH_SHORT);
//	        	return super.onDoubleTap(e);
//	        }	       
//	    });	
//		mapFrameLayout.setOnTouchListener(new View.OnTouchListener() {
//			
//			@Override
//			public boolean onTouch(View v, MotionEvent event) {
//				Toast.makeText(self, "single Click", Toast.LENGTH_SHORT);
//				gestureDetector.onTouchEvent(event);
//				return true;
//			}
//		});
		super.onStart();
		
	}

	private void UpdateLocationMethod() {
		this.runOnUiThread(LocationTimer_Tick);
	}

	private Runnable LocationTimer_Tick = new Runnable() {
		public void run() {
			if (mGPSTracker.canGetLocation()) {
				srcLat = (float) mGPSTracker.getLatitude();// 37.340342;///mGPSTracker.getLatitude();//40.763804;//mGPSTracker.getLatitude();
				srcLon = (float) mGPSTracker.getLongitude();// -121.895499;///mGPSTracker.getLongitude();//-73.992062;//mGPSTracker.getLongitude();
				
				 Log.d("TRY UPD LOC", srcLat + "x" + srcLon);
 				 
			} else {
				Log.d("GPS", "Can't track GPS or WiFi");
			}
		}
	};
	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.home, menu);
		return true;
	}

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
		}
		return super.onOptionsItemSelected(item);
	}

	@Override
	public void onMapReady(GoogleMap map) {
		map.addMarker(new MarkerOptions()
        .position(new LatLng(destLat, destLog))
        .title("Marker"));
		CameraPosition cameraPosition = new CameraPosition.Builder().target(
                new LatLng(destLat, destLog)).zoom(12).build(); 
		map.animateCamera(CameraUpdateFactory.newCameraPosition(cameraPosition));
		
		//map.setOnCameraChangeListener( mOnCameraChangeListener);
	}
	
	
//	private class TouchableWrapper extends FrameLayout {
//		Context context;
//	    public TouchableWrapper(Context context) {
//			super(context);
//			this.context = context;
//		}
//
//		@Override
//	    public boolean dispatchTouchEvent(MotionEvent ev) {
//			
//			GestureDetector gestureDetector = new GestureDetector(context, new GestureDetector.SimpleOnGestureListener() {
//		        @Override
//		        public boolean onDoubleTap(MotionEvent e) {
//		        	Toast.makeText(context, "double Click", Toast.LENGTH_SHORT);
//		        	return true;
//		        }	       
//		    });
//
//	       
//	        if(ev.getAction()==MotionEvent.ACTION_DOWN){
//	        	gestureDetector.onTouchEvent(ev);
//	        	super.dispatchTouchEvent(ev);
//	        }
//	       
//		 return true;
//	    }
//	} 
	private final OnCameraChangeListener mOnCameraChangeListener = new OnCameraChangeListener() {
	    @Override
	    public void onCameraChange(CameraPosition cameraPosition) {
	        
	    }
	};
}
