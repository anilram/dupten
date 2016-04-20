package com.qison.dupten;

import java.util.ArrayList;


import android.app.Activity;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.util.Base64;
import android.util.Log;
import android.util.TypedValue;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import android.widget.TextView;
import android.widget.AbsListView.LayoutParams;
import com.qison.dupten.model.NavDrawerItem;
import com.qison.dupten.util.DataManager;

public class LeftDrawerAdapter extends BaseAdapter{
	private ArrayList<NavDrawerItem> navDrawerItems;
	private Context context;
	public LeftDrawerAdapter(Context context,ArrayList<NavDrawerItem> navDrawerItems){
		this.context = context;
		this.navDrawerItems = navDrawerItems;
	}
	
	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return navDrawerItems.size();
	}

	@Override
	public Object getItem(int position) {
		// TODO Auto-generated method stub
		return navDrawerItems.get(position);
	}

	@Override
	public long getItemId(int position) {
		// TODO Auto-generated method stub
		return position;
	}

	@Override
	public View getView(int position, View convertView, ViewGroup parent) {
		if(convertView == null){
			LayoutInflater inflater = (LayoutInflater) context.getSystemService(Activity.LAYOUT_INFLATER_SERVICE);
			convertView = inflater.inflate(R.layout.each_list_view,null);
			ImageView iconView = (ImageView)convertView.findViewById(R.id.icon);
			TextView txtView = (TextView)convertView.findViewById(R.id.title);
			iconView.setImageResource(navDrawerItems.get(position).getIcon());
			txtView.setText(navDrawerItems.get(position).getTitle());			
			if( position == 0 && DataManager.getFromPrefs(context, "userName","").length() > 1 ){
				convertView.setBackgroundColor(Color.parseColor("#666666"));
				Log.d("bitmap", DataManager.getFromPrefs(context, "picString", ""));
				try{
					Bitmap bitmap = Bitmap.createScaledBitmap(stringToBitMap(DataManager.getFromPrefs(context, "picString", "")), 100, 100, true);				
					bitmap = DataManager.getCircleBitmap(bitmap,context);
					float pixels = TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, 70, context.getResources().getDisplayMetrics());
					convertView.setLayoutParams(new LayoutParams(android.view.ViewGroup.LayoutParams.MATCH_PARENT, (int) pixels));
					//iconView.setBackgroundResource(R.drawable.circle_borderprofile);
					iconView.setImageBitmap(bitmap);
					txtView.setText(DataManager.getFromPrefs(context, "userName",""));
				 }catch(Exception e){
					 Log.e("getApplicationContext", ""+e,e);
				}
			}
			
		}
		return convertView;
	}

//	 private String bitMapToString(Bitmap bitmap){
//	     ByteArrayOutputStream baos=new  ByteArrayOutputStream();
//	     bitmap.compress(Bitmap.CompressFormat.PNG,100, baos);
//	     byte [] b=baos.toByteArray();
//	     String temp=Base64.encodeToString(b, Base64.DEFAULT);
//	     return temp;
//	}
	 
	 private Bitmap stringToBitMap(String encodedString){
		   try {
		      byte [] encodeByte=Base64.decode(encodedString,Base64.DEFAULT);
		      Bitmap bitmap=BitmapFactory.decodeByteArray(encodeByte, 0, encodeByte.length);
		      return bitmap;
		   } catch(Exception e) {
		      e.getMessage();
		      return null;
		   }
	 }
}
