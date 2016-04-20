package com.qison.dupten;

import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentManager;
import android.support.v4.app.FragmentPagerAdapter;

public class TabsPagerAdapter extends FragmentPagerAdapter{

	public TabsPagerAdapter(FragmentManager fm) {
		super(fm);
	}
	
	@Override
	public Fragment getItem(int arg0) {
		switch (arg0) {
		case 0:
			return new MyConnectionFragment();
			
		case 1:
			return new RequestFragment();
			

		default:
			break;
		}
		return new MyConnectionFragment();
	}

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return 2;
	}

}
