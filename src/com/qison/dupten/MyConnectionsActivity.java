package com.qison.dupten;

import android.app.ActionBar;
import android.app.ActionBar.Tab;
import android.app.ActionBar.TabListener;
import android.app.Activity;
import android.app.FragmentTransaction;
import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.NavUtils;
import android.support.v4.app.TaskStackBuilder;
import android.support.v4.view.ViewPager;
import android.view.Menu;
import android.view.MenuItem;

public class MyConnectionsActivity extends FragmentActivity implements ActionBar.TabListener{

	private ViewPager viewPager;
	private TabsPagerAdapter mAdapter;
	private ActionBar actionBar;
	private String[] tabs = {"My Connection","Request"}; 
	
	@SuppressWarnings("deprecation")
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_my_connections);	
		viewPager = (ViewPager) findViewById(R.id.pager);
		actionBar = getActionBar();
		actionBar.setDisplayHomeAsUpEnabled(true);
		mAdapter = new TabsPagerAdapter(getSupportFragmentManager());
		viewPager.setAdapter(mAdapter);
		actionBar.setHomeButtonEnabled(true);
		actionBar.setNavigationMode(ActionBar.NAVIGATION_MODE_TABS);
		Drawable dra = getResources().getDrawable(R.drawable.tab_hairline);
		
		for(String tab:tabs){			
			actionBar.addTab(actionBar.newTab().setText(tab)
                    .setTabListener(this));
		}
		viewPager.setOnPageChangeListener(new ViewPager.OnPageChangeListener() {
			
			@Override
			public void onPageSelected(int arg0) {
				actionBar.setSelectedNavigationItem(arg0);
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
		getMenuInflater().inflate(R.menu.my_connections, menu);
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
		if(id==android.R.id.home) {
//			Intent upIntent = NavUtils.getParentActivityIntent(this);
//	        if (NavUtils.shouldUpRecreateTask(this, upIntent)) {
//	            // This activity is NOT part of this app's task, so create a new task
//	            // when navigating up, with a synthesized back stack.
//	            TaskStackBuilder.create(this)
//	                    // Add all of this activity's parents to the back stack
//	                    .addNextIntentWithParentStack(upIntent)
//	                    // Navigate up to the closest parent
//	                    .startActivities();
//	        } else {
//	            // This activity is part of this app's task, so simply
//	            // navigate up to the logical parent activity.
//	            NavUtils.navigateUpTo(this, upIntent);
//	        }
			onBackPressed();
	        return true;
		}
		
		return super.onOptionsItemSelected(item);
	}

	@Override
	public void onTabSelected(Tab tab, FragmentTransaction ft) {
		viewPager.setCurrentItem(tab.getPosition());
		
	}

	@Override
	public void onTabUnselected(Tab tab, FragmentTransaction ft) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void onTabReselected(Tab tab, FragmentTransaction ft) {
		// TODO Auto-generated method stub
		
	}
	
	
}
