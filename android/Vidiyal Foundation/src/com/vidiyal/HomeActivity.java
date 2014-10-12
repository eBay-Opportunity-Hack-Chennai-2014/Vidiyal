package com.vidiyal;

import com.vidiyal.R;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.support.v7.app.ActionBarActivity;
import android.view.Window;


@SuppressLint("NewApi") public class HomeActivity extends ActionBarActivity {

	/** The Constant SPLASH_TIME. */
	private static final long SPLASH_TIME = 5000;
	/**
	 * Used to Handle the Application Crash.
	 */

	@SuppressLint("NewApi") /*
	 * (non-Javadoc)
	 * 
	 * @see android.app.Activity#onCreate(android.os.Bundle)
	 */
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		getWindow().requestFeature(Window.FEATURE_ACTION_BAR);
	    getActionBar().hide();
		setContentView(R.layout.splash);
		/**
		 * Used to Handle the Keep the Splash Image in UI and After 2sec it will
		 * call Main.Java.
		 */
		new Handler().postDelayed(new Runnable() {
			@Override
			public void run() {
				HomeActivity.this.finish();
				startActivity(new Intent(HomeActivity.this, Wbview.class));
			}
		}, SPLASH_TIME);
	}

}
