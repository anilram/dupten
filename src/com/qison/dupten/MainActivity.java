package com.qison.dupten;

import android.app.ActionBar;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.DialogFragment;
import android.app.Fragment;
import android.app.SearchManager;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentTransaction;
import android.support.v4.widget.DrawerLayout;

import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.SearchView;

import com.qison.dupten.util.DataManager;
import com.qison.dupten.widget.FeedBackDialog;

public class MainActivity extends FragmentActivity implements
		NavigationDrawerFragment.NavigationDrawerCallbacks {

	/**
	 * Fragment managing the behaviors, interactions and presentation of the
	 * navigation drawer.
	 */
	private NavigationDrawerFragment mNavigationDrawerFragment;

	/**
	 * Used to store the last screen title. For use in
	 * {@link #restoreActionBar()}.
	 */
	private CharSequence mTitle;
	private static int dPosition = 0;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_main);
		mNavigationDrawerFragment = (NavigationDrawerFragment) getSupportFragmentManager()
				.findFragmentById(R.id.navigation_drawer);
		mTitle = "Home";

		// Set up the drawer.
		mNavigationDrawerFragment.setUp(R.id.navigation_drawer,
				(DrawerLayout) findViewById(R.id.drawer_layout));
		
	}

	@Override
	public void onNavigationDrawerItemSelected(int position) {
		// update the main content by replacing fragments
		dPosition = position+1;
		Intent intent;
		switch (position) {
		case 0:
			if(DataManager.getFromPrefs(getApplicationContext(), "userName","").length()>1){
				intent = new Intent(this, UserProfileActivity.class);
				startActivity(intent);
			}else{
				intent = new Intent(this, RegisterActivity.class);
				startActivity(intent);
			}
			break;
		case 1:
			FragmentManager fm = getSupportFragmentManager();
	        FragmentTransaction ft = fm.beginTransaction();
	        android.support.v4.app.Fragment fragment = new HomeFragment();	       
	        ft.replace(R.id.container, fragment);	       
            ft.commit();
			break;
		case 2:
			FragmentManager fmt = getSupportFragmentManager();
	        FragmentTransaction ftt = fmt.beginTransaction();
	        android.support.v4.app.Fragment fragmentt = new TrendingEventsFragment();	       
	        ftt.replace(R.id.container, fragmentt);
	        ftt.addToBackStack(""+position);
            ftt.commit();
            break;
		case 3:
			if(DataManager.getFromPrefs(getApplicationContext(), "userName","").length()>1){
				intent = new Intent(this, UserProfileActivity.class);
				startActivity(intent);
			}else{
				intent = new Intent(this, RegisterActivity.class);
				startActivity(intent);
			}
			break;
		case 4:
			intent = new Intent(this, MyConnectionsActivity.class);			
			startActivity(intent);
			break;
		case 5:
//			FragmentTransaction ft1 = getSupportFragmentManager().beginTransaction();
//			DialogFragment newFragment = new FeedBackDialog();
//			ft.add(R.id.container, newFragment);
//			ft.commit();
			DialogFragment newFragment = new FeedBackDialog();
			newFragment.show(getFragmentManager(), "feedback_dialog");
			//sendEmail();
			break;
		case 6:
			final String appPackageName = getPackageName(); // getPackageName() from Context or Activity object
			Log.d("getPackageName", appPackageName);
			try {
			    startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse("market://details?id=" + "com.flyplist")));
			} catch (android.content.ActivityNotFoundException anfe) {
			    startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse("http://play.google.com/store/apps/details?id=" + "com.flyplist")));
			}
			break;
		case 7:
			intent = new Intent(this, WalkThrough.class);			
			startActivity(intent);
			break;
		case 8:
			FragmentManager fma = getSupportFragmentManager();
	        FragmentTransaction fta = fma.beginTransaction();
	        fta.addToBackStack(""+position);
	        android.support.v4.app.Fragment fragmenta = new AboutFragment();	       
	        fta.replace(R.id.container, fragmenta);
            fta.commit();
            break;
		default:
			break;
		}
		onSectionAttached(position+1);
//		invalidateOptionsMenu();
//		FragmentManager fragmentManager = getFragmentManager();
//		fragmentManager
//				.beginTransaction()
//				.replace(R.id.container,
//						PlaceholderFragment.newInstance(position + 1)).commit();
	}

	public void onSectionAttached(int number) {
		
		switch (number) {
//		case 1:
//			mTitle = getString(R.string.title_section1);
//			break;
		case 2:
			mTitle = getString(R.string.title_section2);
			break;
		case 3:
			mTitle = getString(R.string.title_section3);
			break;
//		case 4:
//			mTitle = getString(R.string.title_section4);
//			break;
//		case 5:
//			mTitle = getString(R.string.title_section5);
//			break;
//		case 6:
//			mTitle = getString(R.string.title_section6);
//			break;
//		case 7:
//			mTitle = getString(R.string.title_section7);
//			break;
//		case 8:
//			mTitle = getString(R.string.title_section8);
//			break;
		case 9:
			mTitle = getString(R.string.title_section9);
			break;
		default :
			mTitle = "Home";
		}
		
	}

	
	@Override
	public boolean onPrepareOptionsMenu(Menu menu) {
	if(dPosition > 0){
		if(dPosition == 9){
			if(menu.findItem(R.id.action_search)!=null){
				menu.findItem(R.id.action_search).setVisible(false);
			}
			if(menu.findItem(R.id.filter)!=null){
				menu.findItem(R.id.filter).setVisible(false);
			}
		}
		else {
			if(menu.findItem(R.id.add_event)!=null){				
				menu.findItem(R.id.add_event).setVisible(false);
			}
		}
	}
		return super.onPrepareOptionsMenu(menu);
	}

	public void restoreActionBar() {
		ActionBar actionBar = getActionBar();
		actionBar.setNavigationMode(ActionBar.NAVIGATION_MODE_STANDARD);
		actionBar.setDisplayShowTitleEnabled(true);
		actionBar.setTitle(mTitle);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		if (!mNavigationDrawerFragment.isDrawerOpen()) {
			// Only show items in the action bar relevant to this screen
			// if the drawer is not showing. Otherwise, let the drawer
			// decide what to show in the action bar.
			getMenuInflater().inflate(R.menu.main, menu);
			SearchManager searchManager = (SearchManager) getSystemService(Context.SEARCH_SERVICE);
	        SearchView searchView = (SearchView) menu.findItem(R.id.action_search)
	                .getActionView();
	       
	        searchView.setSearchableInfo(searchManager
	                .getSearchableInfo(getComponentName()));
	        
	        
			restoreActionBar();			
		
		}

		return super.onCreateOptionsMenu(menu);
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
		if(id==R.id.add_event){
			Intent browserIntent = new Intent(Intent.ACTION_VIEW, Uri.parse("http://login.10times.com/addevent"));
			startActivity(browserIntent);
		} else if(id == R.id.filter){
			Intent intent = new Intent(this, FilterActivity.class);			
			startActivity(intent);
		}
		
		
		return super.onOptionsItemSelected(item);
	}

	/**
	 * A placeholder fragment containing a simple view.
	 */
	public static class PlaceholderFragment extends Fragment {
		/**
		 * The fragment argument representing the section number for this
		 * fragment.
		 */
		private static final String ARG_SECTION_NUMBER = "section_number";

		/**
		 * Returns a new instance of this fragment for the given section number.
		 */
		public static PlaceholderFragment newInstance(int sectionNumber) {
			PlaceholderFragment fragment = new PlaceholderFragment();
			Bundle args = new Bundle();
			args.putInt(ARG_SECTION_NUMBER, sectionNumber);
			fragment.setArguments(args);
			return fragment;
		}

		public PlaceholderFragment() {
		}

		@Override
		public View onCreateView(LayoutInflater inflater, ViewGroup container,
				Bundle savedInstanceState) {
			View rootView = inflater.inflate(R.layout.fragment_main, container,
					false);
			return rootView;
		}

		@Override
		public void onAttach(Activity activity) {
			super.onAttach(activity);
			dPosition = getArguments().getInt(ARG_SECTION_NUMBER);
			((MainActivity) activity).onSectionAttached(getArguments().getInt(ARG_SECTION_NUMBER));
			
		}
	}

	/* (non-Javadoc)
	 * @see android.support.v4.app.FragmentActivity#onBackPressed()
	 */
	@Override
	public void onBackPressed() {
		if(!mNavigationDrawerFragment.isDrawerOpen()){
			if(getSupportFragmentManager().getBackStackEntryCount()-1 > 0) {
				FragmentManager.BackStackEntry backEntry=getSupportFragmentManager().getBackStackEntryAt(getSupportFragmentManager().getBackStackEntryCount()-2);
				String dPos=backEntry.getName();				
				dPosition = Integer.parseInt(dPos);
				dPosition=dPosition+1;
				Log.d("dPosition",""+ dPosition);
			}else
				dPosition = 2;
			Log.d("dPositions",""+ dPosition);
			onSectionAttached(dPosition);
			mNavigationDrawerFragment.setmCurrentSelectedPosition(-1);
			if(getSupportFragmentManager().getBackStackEntryCount()<1) {
				AlertDialog.Builder myBuilder=new 
					             AlertDialog.Builder(this);
				myBuilder.setMessage("Are u sure you want to exit");
				
				myBuilder.setPositiveButton("Ok",new DialogInterface.OnClickListener() {
					
					@Override
					public void onClick(DialogInterface dialog, int which) {
						Intent intent = new Intent(Intent.ACTION_MAIN);
						intent.addCategory(Intent.CATEGORY_HOME);
						intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
						startActivity(intent);	
					}
				});
				myBuilder.setNegativeButton("Cancel",null);
				AlertDialog myAlert=myBuilder.create();
				myAlert.show();
			}else
			{
				super.onBackPressed();
			}
			
		} else{
			//mNavigationDrawerFragment.closeDrawer();
			super.onBackPressed();
		}
		invalidateOptionsMenu();
		//super.onBackPressed();
	}

	
//	protected void sendEmail() {
//	      Log.i("Send email", "");
//	      //String[] TO = {"android@10times.com"};
//	      Intent emailIntent = new Intent(Intent.ACTION_SENDTO,Uri.fromParts(
//	              "mailto","abc@gmail.com", null));
//	     
//	   //   emailIntent.setType("text/plain");
//	     
//	      emailIntent.putExtra(Intent.EXTRA_SUBJECT, "Feedback for 10times android app sent from = Galaxy Nexus  Android" +
//	      		"version-4.2.1App version 1.0.0.48");
//	      emailIntent.putExtra(Intent.EXTRA_TEXT, "");
//	      try {
//	         startActivity(Intent.createChooser(emailIntent, "Choose Option"));
//	         Log.i("Finished sending email...", "");
//	      } catch (android.content.ActivityNotFoundException ex) {
//	         Toast.makeText(this, 
//	         "There is no email client installed.", Toast.LENGTH_SHORT).show();
//	      }
//	   }
}
