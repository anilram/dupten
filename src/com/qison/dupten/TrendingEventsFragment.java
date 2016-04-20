package com.qison.dupten;

import java.util.ArrayList;
import java.util.List;

import com.qison.dupten.model.TrendingEvents;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;



public class TrendingEventsFragment extends Fragment{
	ListView listView;
	TrendingEventsListAdapter adapter;
	List<TrendingEvents> trendingEvents = new ArrayList<TrendingEvents>();
	public TrendingEventsFragment(){
		
	}
	/* (non-Javadoc)
	 * @see android.support.v4.app.Fragment#onActivityCreated(android.os.Bundle)
	 */
	@Override
	public void onActivityCreated(Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		super.onActivityCreated(savedInstanceState);
		listView = (ListView) getActivity().findViewById(R.id.trend_list);
		trendingEvents.add(new TrendingEvents("Poultry India", "Hyderabad, India","25 - 27 NOV 2015", 376));
		trendingEvents.add(new TrendingEvents("PackPlus South", "Hyderabad, India", "02 -27 MAR 2016", 187));
		trendingEvents.add(new TrendingEvents("India Aviation", "Hyderabad, India", "16 - 20 MAR 2016", 171));
		trendingEvents.add(new TrendingEvents("Poultry India", "Hyderabad, India","25 - 27 NOV 2015", 376));
		trendingEvents.add(new TrendingEvents("PackPlus South", "Hyderabad, India", "02 -27 MAR 2016", 187));
		trendingEvents.add(new TrendingEvents("India Aviation", "Hyderabad, India", "16 - 20 MAR 2016", 171));
		trendingEvents.add(new TrendingEvents("Poultry India", "Hyderabad, India","25 - 27 NOV 2015", 376));
		trendingEvents.add(new TrendingEvents("PackPlus South", "Hyderabad, India", "02 -27 MAR 2016", 187));
		trendingEvents.add(new TrendingEvents("India Aviation", "Hyderabad, India", "16 - 20 MAR 2016", 171));
		trendingEvents.add(new TrendingEvents("Poultry India", "Hyderabad, India","25 - 27 NOV 2015", 376));
		trendingEvents.add(new TrendingEvents("PackPlus South", "Hyderabad, India", "02 -27 MAR 2016", 187));
		trendingEvents.add(new TrendingEvents("India Aviation", "Hyderabad, India", "16 - 20 MAR 2016", 171));
		adapter = new TrendingEventsListAdapter(getActivity(), trendingEvents);
		listView.setAdapter(adapter);
	}
	/* (non-Javadoc)
	 * @see android.support.v4.app.Fragment#onCreateView(android.view.LayoutInflater, android.view.ViewGroup, android.os.Bundle)
	 */
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup container,
			Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		return inflater.inflate(R.layout.trend_events, container, false);
	}
	
	
}
