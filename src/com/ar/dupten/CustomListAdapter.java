package com.ar.dupten;

import java.util.List;

import com.ar.dupten.model.HomeDesc;

import android.app.Activity;
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

public class CustomListAdapter extends BaseAdapter{
	
	private Activity activity;
	private LayoutInflater inflater;
	private List<HomeDesc> homeDescs;
	
	public CustomListAdapter(Activity activity,List<HomeDesc> homeDescs){
		this.activity = activity;
		this.homeDescs = homeDescs;
	}

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return homeDescs.size();
	}

	@Override
	public Object getItem(int position) {
		// TODO Auto-generated method stub
		return homeDescs.get(position);
	}

	@Override
	public long getItemId(int position) {
		// TODO Auto-generated method stub
		return position;
	}

	@Override
	public View getView(int position, View convertView, ViewGroup parent) {
		if (inflater == null)
            inflater = (LayoutInflater) activity
                    .getSystemService(Context.LAYOUT_INFLATER_SERVICE);
        if (convertView == null)
            convertView = inflater.inflate(R.layout.list_row, null);
        TextView homeMonth = (TextView) convertView.findViewById(R.id.home_month);
        TextView shortyDesc = (TextView) convertView.findViewById(R.id.home_short_desc);
        TextView locView = (TextView) convertView.findViewById(R.id.home_loc);
        TextView dayRangeView = (TextView) convertView.findViewById(R.id.home_dayRange);
        HomeDesc homeDesc = homeDescs.get(position);
        homeMonth.setText(homeDesc.getMonth());
        shortyDesc.setText(homeDesc.getShortDesc());
        locView.setText(homeDesc.getLocation());
        dayRangeView.setText(homeDesc.getDayRange());        
		return convertView;
	}
	
}
