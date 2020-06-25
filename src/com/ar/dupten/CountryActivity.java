package com.ar.dupten;

import java.util.ArrayList;
import java.util.List;

import android.app.ActionBar;
import android.app.Activity;
import android.app.SearchManager;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.SearchView;
import android.widget.TextView;
import android.widget.AdapterView.OnItemClickListener;

public class CountryActivity extends Activity {
	List<String> countryList;
	ListView countryListView;
	ArrayAdapter<String> adapter;
	CountryActivity self;
	ActionBar actionBar;
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		actionBar = getActionBar();
		actionBar.setDisplayHomeAsUpEnabled(true);
		actionBar.setHomeButtonEnabled(true);
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_country);
		countryListView = (ListView)findViewById(R.id.country_list);
		countryList = new ArrayList<String>();
		countryList.add("Bangladesh");
		countryList.add("Bhutan");
		countryList.add("India");		
		countryList.add("Nepal");		
		countryList.add("Pakistan");
		countryList.add("Sri Lanka");
		countryList.add("Bangladesh");
		countryList.add("China");
		countryList.add("Afganistan");		
		countryList.add("Maynamar");		
		countryList.add("Singapoor");
		countryList.add("Maldeeves");
		java.util.Collections.sort(countryList);
		//adapter = new CountryListAdapter(this,countryList);
		adapter = new ArrayAdapter<String>(this, R.layout.each_country, countryList);
		countryListView.setAdapter(adapter);
		self = this;
		countryListView.setOnItemClickListener(new OnItemClickListener(){
			@Override
			public void onItemClick(AdapterView<?> parent, View view,
					int position, long id) {
				TextView textView = (TextView) view;
				Intent intent = new Intent();
				intent.putExtra("COUNTRY_SELECTED", textView.getText());
				setResult(RESULT_OK, intent);        
				finish();
			}
		});
	}



	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.country, menu);
		
        SearchManager searchManager = (SearchManager) getSystemService(Context.SEARCH_SERVICE);
        SearchView searchView = (SearchView) menu.findItem(R.id.action_search_country).getActionView();

            searchView.setSearchableInfo(searchManager.getSearchableInfo(getComponentName()));
            //searchView.setIconifiedByDefault(false);   

        SearchView.OnQueryTextListener queryTextListener = new SearchView.OnQueryTextListener() 
        {
            @Override
            public boolean onQueryTextChange(String newText) 
            {
                // this is your adapter that will be filtered
                adapter.getFilter().filter(newText);
                return true;
            }
            @Override
            public boolean onQueryTextSubmit(String query) 
            {
                // this is your adapter that will be filtered
                adapter.getFilter().filter(query);
                return true;
            }
        };
        searchView.setOnQueryTextListener(queryTextListener);
       
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
//		if (id == R.id.action_search_country) {
//			return true;
//		}
		
		return super.onOptionsItemSelected(item);
	}
}
