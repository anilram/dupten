package com.ar.dupten;



import android.app.Activity;
import android.content.Context;
import android.os.Parcelable;
import android.support.v4.view.PagerAdapter;
import android.support.v4.view.ViewPager;
import android.view.LayoutInflater;
import android.view.View;

import android.widget.TextView;


public class WalkthroughAdapter extends PagerAdapter{
	Activity activity;
	String titleArray[];
	String textArray[];
	int[] color = {R.color.green,R.color.blue,R.color.red};
	public WalkthroughAdapter(Activity activity,String[] titleArra,String[] textArra){
		this.activity = activity;
		this.titleArray = titleArra;
		this.textArray = textArra;
	}
	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return this.titleArray.length;
	}
	
	
	/* (non-Javadoc)
	 * @see android.support.v4.view.PagerAdapter#instantiateItem(android.view.View, int)
	 */
	@Override
	public Object instantiateItem(View container, int position) {
		LayoutInflater li = (LayoutInflater) activity.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
		View v = li.inflate(R.layout.each_walkthrough, null);
		//ImageView iv = (ImageView) v.findViewById(R.id.viewpager_image);
		//iv.setImageResource(imageArray[position]);
		v.setBackgroundResource(color[position]);
		TextView tv = (TextView) v.findViewById(R.id.viewpager_title);
		tv.setText(titleArray[position]);
		TextView text = (TextView) v.findViewById(R.id.viewpager_text);
		text.setText(textArray[position]);
	    ((ViewPager) container).addView(v, 0);	    
		return v;
		
	}
	@Override
	public void destroyItem(View arg0, int arg1, Object arg2) {
		((ViewPager) arg0).removeView((View) arg2);
	}

	@Override
	public boolean isViewFromObject(View arg0, Object arg1) {
		return arg0 == ((View) arg1);
	}

	@Override
	public Parcelable saveState() {
		return null;
	}
}
