package com.ar.dupten;

import java.util.ArrayList;
import java.util.List;

import com.ar.dupten.model.ApiConnector;
import com.ar.dupten.model.EventsListner;
import com.ar.dupten.model.HomeDesc;
import com.ar.dupten.util.DataManager;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Intent;
import android.os.Bundle;

import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AbsListView;
import android.widget.AbsListView.OnScrollListener;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemClickListener;
import android.widget.ListView;
import android.widget.RelativeLayout.LayoutParams;

public class HomeFragment extends Fragment implements EventsListner{

	ListView listView;
	CustomListAdapter customListAdapter;
	ProgressDialog progressDialog;
//	EventsListner eventsCallBack;
	List<HomeDesc> homeDescs = new ArrayList<HomeDesc>();

	@Override
	public void onActivityCreated(Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		super.onActivityCreated(savedInstanceState);
		listView = (ListView) getActivity().findViewById(R.id.home_list);
		 if (progressDialog == null) {
		       progressDialog = DataManager.createProgressDialog(getActivity());
		       progressDialog.show();
		       } else {
		       progressDialog.show();
		       }
		ApiConnector.getInstance().getEventDetails("http://jsonplaceholder.typicode.com/posts?userId=1",HomeFragment.this);
		
//		homeDescs.add(new HomeDesc(1,"Qs World Grad School Tour Hyderabad", "Vivnta by Taj - BegumPet", "Apr", "23-23"));
//		homeDescs.add(new HomeDesc(2,"National Conference on Advance in Mechanical Engieneering", "Vasavi Coolege of Engineering", "May", "01-02"));
//		homeDescs.add(new HomeDesc(3,"Qs World Grad School Tour Hyderabad", "Vivnta by Taj - BegumPet", "May", "03-03"));
//		homeDescs.add(new HomeDesc(4,"Qs World Grad School Tour Hyderabad", "Vivnta by Taj - BegumPet", "Apr", "23-23"));
//		homeDescs.add(new HomeDesc(5,"National Conference on Advance in Mechanical Engieneering", "Vasavi Coolege of Engineering", "May", "01-02"));
//		homeDescs.add(new HomeDesc(6,"Qs World Grad School Tour Hyderabad", "Vivnta by Taj - BegumPet", "May", "03-03"));
//		homeDescs.add(new HomeDesc(7,"Qs World Grad School Tour Hyderabad", "Vivnta by Taj - BegumPet", "Apr", "23-23"));
//		homeDescs.add(new HomeDesc(8,"National Conference on Advance in Mechanical Engieneering", "Vasavi Coolege of Engineering", "May", "01-02"));
//		homeDescs.add(new HomeDesc(9,"Qs World Grad School Tour Hyderabad", "Vivnta by Taj - BegumPet", "May", "03-03"));
//		homeDescs.add(new HomeDesc(10,"Qs World Grad School Tour Hyderabad", "Vivnta by Taj - BegumPet", "Apr", "23-23"));
//		homeDescs.add(new HomeDesc(11,"National Conference on Advance in Mechanical Engieneering", "Vasavi Coolege of Engineering", "May", "01-02"));
//		homeDescs.add(new HomeDesc(12,"Qs World Grad School Tour Hyderabad", "Vivnta by Taj - BegumPet", "May", "03-03"));
//		homeDescs.add(new HomeDesc(13,"Qs World Grad School Tour Hyderabad", "Vivnta by Taj - BegumPet", "Apr", "23-23"));
//		homeDescs.add(new HomeDesc(14,"National Conference on Advance in Mechanical Engieneering", "Vasavi Coolege of Engineering", "May", "01-02"));
//		customListAdapter = new CustomListAdapter(getActivity(), homeDescs);
//		listView.setAdapter(customListAdapter);
		listView.setOnItemClickListener(new OnItemClickListener() {

			@Override
			public void onItemClick(AdapterView<?> parent, View view,
					int position, long id) {
				Intent intent = new Intent(getActivity(), HomeActivity.class);
				startActivity(intent);				
			}
		});
		
//		listView.setOnScrollListener(new OnScrollListener() {
//			
//			@Override
//			public void onScrollStateChanged(AbsListView view, int scrollState) {
//				
//			}
//			
//			@Override
//			public void onScroll(AbsListView view, int firstVisibleItem,
//					int visibleItemCount, int totalItemCount) {
//				if(firstVisibleItem!=0)
//					getActivity().findViewById(R.id.shadow).setLayoutParams(new LayoutParams(LayoutParams.MATCH_PARENT,30));
//				else
//					getActivity().findViewById(R.id.shadow).setLayoutParams(new LayoutParams(LayoutParams.MATCH_PARENT,18));
//			}
//		});
	}

	/* (non-Javadoc)
	 * @see android.support.v4.app.Fragment#onActivityResult(int, int, android.content.Intent)
	 */
	@Override
	public void onActivityResult(int requestCode, int resultCode, Intent data) {
		// TODO Auto-generated method stub
		super.onActivityResult(requestCode, resultCode, data);
		
	}
	
	/* (non-Javadoc)
	 * @see android.support.v4.app.Fragment#onAttach(android.app.Activity)
	 */
	@Override
	public void onAttach(Activity activity) {
//		try{
//			eventsCallBack = (EventsListner)activity;
//		} catch (ClassCastException e) {
//		throw new ClassCastException(
//				"Activity must implement EventsListner.");
//		}
		super.onAttach(activity);
	}

	/* (non-Javadoc)
	 * @see android.support.v4.app.Fragment#onCreate(android.os.Bundle)
	 */
	@Override
	public void onCreate(Bundle savedInstanceState) {
		
		super.onCreate(savedInstanceState);
	}

	/* (non-Javadoc)
	 * @see android.support.v4.app.Fragment#onCreateView(android.view.LayoutInflater, android.view.ViewGroup, android.os.Bundle)
	 */
	@Override
	public View onCreateView(LayoutInflater inflater,
			 ViewGroup container,  Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		return inflater.inflate(R.layout.fragment_home, container, false);
	}

	@Override
	public void onGetEvents(List<HomeDesc> homeDescs) {
		if(progressDialog!=null){
			progressDialog.dismiss();
		}
		this.homeDescs = new ArrayList<HomeDesc>(homeDescs);
		customListAdapter = new CustomListAdapter(getActivity(), homeDescs);
		listView.setAdapter(customListAdapter);
		
	}
	
}
