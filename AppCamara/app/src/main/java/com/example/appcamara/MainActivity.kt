package com.example.appcamara

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import androidx.core.content.ContextCompat
import kotlinx.android.synthetic.main.activity_main.*
import java.util.jar.Manifest

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        btcamara.setOnClickListener{checkCameraPermission()}
    }
    private fun checkCameraPermission(){
        if(ContextCompat.checkSelfPermission(this, Manifest.permission.CAMERA)) {
            Toast.makeText(this, "No se le dio permiso", Toast.LENGTH_LONG).show()
        }
        else {
            Toast.makeText(this,"Ya cuenta con accecso a la camara",Toast.LENGTH_LONG).show()
        }
        }
    }
}