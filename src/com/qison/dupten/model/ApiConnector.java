package com.qison.dupten.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.http.Header;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONArray;

import android.util.Log;

import com.loopj.android.http.JsonHttpResponseHandler;



public class ApiConnector {
	private static ApiConnector mInstance;
	private String url = "http://jsonplaceholder.typicode.com/posts";
	public static synchronized ApiConnector getInstance() {
		
		if (mInstance == null) {
			mInstance = new ApiConnector();
		}
		return mInstance;
	}
	public void getEventDetails(String url,final EventsListner listner){
		//MyAsyncHttpClient client = createRequestClient();
	
	MyAsyncHttpClient.get(url, null, new JsonHttpResponseHandler() {
        @Override
        public void onSuccess(int statusCode, Header[] headers, JSONObject response) {
            // If the response is JSONObject instead of expected JSONArray
        }
        @Override
        public void onFailure(int statusCode, Header[] headers, Throwable throwable, JSONObject errorResponse)
        {
        	List<HomeDesc> homeDescs = new ArrayList<HomeDesc>();
        	homeDescs.add(new HomeDesc(1,"National Conference on Advance in Mechanical Engieneering"," Vasavi Coolege of Engineering","May", "01-02"));
        	//errorResponse.printStackTrace(System.out);
        	Log.d("fail", ""+errorResponse);
        	listner.onGetEvents(homeDescs);
        }
        @Override
        public void onSuccess(int statusCode, Header[] headers, JSONArray events) {
        	List<HomeDesc> homeDescs = new ArrayList<HomeDesc>();
            JSONObject event = null;
            int id;
            
			try {
				for(int i = 0;i < events.length();i++){
					event = (JSONObject) events.get(i);								
					id = event.getInt("id");
					if(id==1)
						homeDescs.add(new HomeDesc((long)event.getInt("id"),"National Conference on Advance in Mechanical Engieneering"," Vasavi Coolege of Engineering","May", "01-02"));//				homeDescs.add(new HomeDesc("Qs World Grad School Tour Hyderabad", "Vivnta by Taj - BegumPet", "Apr", "23-23"));
					else
						homeDescs.add(new HomeDesc((long)event.getInt("id"),event.getString("title")," Vivnta by Taj - BegumPet","Apr", "23-23"));
//				homeDescs.add(new HomeDesc("National Conference on Advance in Mechanical Engieneering", "Vasavi Coolege of Engineering", "May", "01-02"));
//				homeDescs.add(new HomeDesc("Qs World Grad School Tour Hyderabad", "Vivnta by Taj - BegumPet", "May", "03-03"));
//				homeDescs.add(new HomeDesc("Qs World Grad School Tour Hyderabad", "Vivnta by Taj - BegumPet", "Apr", "23-23"));
//				homeDescs.add(new HomeDesc("National Conference on Advance in Mechanical Engieneering", "Vasavi Coolege of Engineering", "May", "01-02"));
//				homeDescs.add(new HomeDesc("Qs World Grad School Tour Hyderabad", "Vivnta by Taj - BegumPet", "May", "03-03"));
//				homeDescs.add(new HomeDesc("Qs World Grad School Tour Hyderabad", "Vivnta by Taj - BegumPet", "Apr", "23-23"));
//				homeDescs.add(new HomeDesc("National Conference on Advance in Mechanical Engieneering", "Vasavi Coolege of Engineering", "May", "01-02"));
//				homeDescs.add(new HomeDesc("Qs World Grad School Tour Hyderabad", "Vivnta by Taj - BegumPet", "May", "03-03"));
//				homeDescs.add(new HomeDesc("Qs World Grad School Tour Hyderabad", "Vivnta by Taj - BegumPet", "Apr", "23-23"));
//				homeDescs.add(new HomeDesc("National Conference on Advance in Mechanical Engieneering", "Vasavi Coolege of Engineering", "May", "01-02"));
//				homeDescs.add(new HomeDesc("Qs World Grad School Tour Hyderabad", "Vivnta by Taj - BegumPet", "May", "03-03"));
//				homeDescs.add(new HomeDesc("Qs World Grad School Tour Hyderabad", "Vivnta by Taj - BegumPet", "Apr", "23-23"));
//				homeDescs.add(new HomeDesc("National Conference on Advance in Mechanical Engieneering", "Vasavi Coolege of Engineering", "May", "01-02"));
//				homeDescs.add(new HomeDesc("Qs World Grad School Tour Hyderabad", "Vivnta by Taj - BegumPet", "May", "03-03"));
					
				Log.d("id", ""+id);
				}
				listner.onGetEvents(homeDescs);
			} catch (JSONException e) {
				e.printStackTrace();
			}
        }
    });
	}
}
