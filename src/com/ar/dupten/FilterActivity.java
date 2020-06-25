package com.ar.dupten;

import android.app.ActionBar;
import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.FragmentActivity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.RadioGroup.OnCheckedChangeListener;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.ar.dupten.widget.DatePickerFragment;

public class FilterActivity extends FragmentActivity {
	ActionBar actionBar;
	TextView applyView;
	TextView filterView;
	RelativeLayout countryLayout;
	FilterActivity self;
	TextView selectCountry;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_filter);
		actionBar = getActionBar();
		actionBar.setDisplayHomeAsUpEnabled(true);
		actionBar.setHomeButtonEnabled(true);
		filterView = (TextView) findViewById(R.id.apply_filter);
		applyView = (TextView) findViewById(R.id.reset_filter);
		filterView.getBackground().setAlpha(100);
    	applyView.getBackground().setAlpha(100);
		countryLayout = (RelativeLayout) findViewById(R.id.select_country);
		selectCountry = (TextView) findViewById(R.id.filter_country_text);
		RadioGroup radioGroup = (RadioGroup) findViewById(R.id.radio_filter);        
	    radioGroup.setOnCheckedChangeListener(new OnCheckedChangeListener() 
	    {
	        @Override
	        public void onCheckedChanged(RadioGroup group, int checkedId) {	
	        	
		        	filterView.getBackground().setAlpha(255);
		        	applyView.getBackground().setAlpha(255);
	        	
	            for(int i=0;i<group.getChildCount();i++){
	            	RadioButton rb=(RadioButton) group.getChildAt(i);		            
	            	if(group.getChildAt(i).getId() == checkedId){
	            		rb.setTextColor(Color.parseColor("#FFFFFF"));
	            	} else{
	            		rb.setTextColor(Color.parseColor("#000000"));
	            	}
	            }
	        }
	        
	    });
	    self = this;
	    countryLayout.setOnClickListener(new View.OnClickListener() {
			
			@Override
			public void onClick(View v) {
				Intent intent = new Intent(self,CountryActivity.class);
				//startActivity(intent);	
				startActivityForResult(intent, 1);
			}
		});
	}

	/* (non-Javadoc)
	 * @see android.support.v4.app.FragmentActivity#onActivityResult(int, int, android.content.Intent)
	 */
	@Override
	protected void onActivityResult(int requestCode, int resultCode, Intent data) {
		 if (requestCode == 1) {
	         if(resultCode == RESULT_OK){
	        	 selectCountry.setText(data.getStringExtra("COUNTRY_SELECTED"));
	    }
		super.onActivityResult(requestCode, resultCode, data);
		 }
	}

	public void showDatePickerDialog(View v) {
	    DialogFragment newFragment = new DatePickerFragment();
	    newFragment.show(getSupportFragmentManager(), "datePicker");
	}
	
	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.filter, menu);
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
			onBackPressed();
			return true;
		}
		return super.onOptionsItemSelected(item);
	}
}
