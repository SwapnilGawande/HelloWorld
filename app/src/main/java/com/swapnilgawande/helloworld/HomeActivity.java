package com.swapnilgawande.helloworld;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import androidx.appcompat.app.AppCompatActivity;

public class HomeActivity extends AppCompatActivity {

    private static final String TAG = "HomeActivity";
    EditText etName;
    EditText etPassword;
    Button btnLogin;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home);

        etName = findViewById(R.id.etName);
        etPassword = findViewById(R.id.etPassword);

        findViewById(R.id.btnLogin).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                doLogin();
            }
        });

    }

    private void doLogin() {
        String name = etName.getText().toString();
        String password = etPassword.getText().toString();

        show(name, password);
    }

    void show(String name, String password) {
        Log.d(TAG, "name " + name + " password " + password);
    }

    public int getNumber() {
        return 10;
    }
}
