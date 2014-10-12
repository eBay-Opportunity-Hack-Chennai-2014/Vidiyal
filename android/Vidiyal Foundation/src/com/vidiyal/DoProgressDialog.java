package com.vidiyal;

import com.vidiyal.R;

import android.app.Dialog;
import android.content.Context;
import android.graphics.drawable.ColorDrawable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup.LayoutParams;
import android.view.Window;

public class DoProgressDialog extends Dialog {

	public DoProgressDialog(Context context) {
		super(context);
		View view = LayoutInflater.from(context).inflate(
				R.layout.progress_dialog, null);
		this.requestWindowFeature(Window.FEATURE_NO_TITLE);
		this.getWindow().setLayout(LayoutParams.MATCH_PARENT,
				LayoutParams.MATCH_PARENT);
		this.getWindow().setBackgroundDrawable(
				new ColorDrawable(android.graphics.Color.TRANSPARENT));
		this.setCancelable(false);
		this.setContentView(view);
	}

}
