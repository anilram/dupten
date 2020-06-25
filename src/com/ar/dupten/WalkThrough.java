package com.ar.dupten;

import android.app.Activity;
import android.os.Bundle;
import android.support.v4.view.ViewPager;
import android.support.v4.view.ViewPager.OnPageChangeListener;
import android.view.Menu;
import android.view.MenuItem;
import android.view.ViewGroup.LayoutParams;
import android.widget.ImageView;
import android.widget.LinearLayout;

public class WalkThrough extends Activity {
	private String titleArra[] = {"Discover","Attend","Connect"};
	private String textArra[] = {"Find Popular conferences, trade shows at ur finger tips","Find Popular conferences, trade shows at ur finger tips","Find Popular conferences, trade shows at ur finger tips"};
	ImageView page_image[];
	LinearLayout count_layout;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_walk_through);
		getActionBar().hide();
		WalkthroughAdapter adapter = new WalkthroughAdapter(this, titleArra, textArra);
		ViewPager myPager = (ViewPager) findViewById(R.id.viewer_register_activity);
		myPager.setAdapter(adapter);
		myPager.setCurrentItem(0);
		page_image = new ImageView[titleArra.length];
		 count_layout = (LinearLayout) findViewById(R.id.image_count);
		 LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(20, 20);
		 params.setMargins(0, 0, 16, 0);
		 for (int i = 0; i < titleArra.length; i++)  
	        {
			 page_image[i] = new ImageView(this);
			 page_image[i].setLayoutParams(new LayoutParams(8,8));	 
			 if(i==0){
				 page_image[i].setBackgroundResource(R.drawable.circle);
			 }
			 else{
				 page_image[i].setBackgroundResource(R.drawable.circledull);
			 }
			 page_image[i].setLayoutParams(params);
			 
	            count_layout.addView(page_image[i]);
	        }
		 
		 
		 myPager.setOnPageChangeListener(new OnPageChangeListener() {
			
			@Override
			public void onPageSelected(int pos) {
				// TODO Auto-generated method stub
				 for (int i = 0; i < titleArra.length; i++) {
					 page_image[i].setBackgroundResource(R.drawable.circledull);
	                }
				 page_image[pos].setBackgroundResource(R.drawable.circle);
			}
			
			@Override
			public void onPageScrolled(int arg0, float arg1, int arg2) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void onPageScrollStateChanged(int arg0) {
				// TODO Auto-generated method stub
				
			}
		});
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.walk_through, menu);
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
		return super.onOptionsItemSelected(item);
	}
	
}
