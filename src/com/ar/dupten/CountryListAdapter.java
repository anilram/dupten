package com.ar.dupten;

import java.util.ArrayList;
import java.util.List;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebView.FindListener;
import android.widget.BaseAdapter;
import android.widget.TextView;

public class CountryListAdapter extends BaseAdapter{
	List<String> countryList;
	Context context;
	TextView countryView;
	public CountryListAdapter(Context context, List<String> countryList){
		this.countryList = new ArrayList<String>(countryList);
		this.context = context;
	}
	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return countryList.size();
	}

	@Override
	public Object getItem(int position) {
		// TODO Auto-generated method stub
		return countryList.get(position);
	}

	@Override
	public long getItemId(int position) {
		// TODO Auto-generated method stub
		return position;
	}

	@Override
	public View getView(int position, View convertView, ViewGroup parent) {
		if(convertView ==  null){
			LayoutInflater inflater = (LayoutInflater) context.getSystemService(Activity.LAYOUT_INFLATER_SERVICE);
			convertView = inflater.inflate(R.layout.each_country, null);
			countryView = (TextView)  convertView.findViewById(R.id.country_name);
			countryView.setText(countryList.get(position));
		}
		return convertView;
	}

}
