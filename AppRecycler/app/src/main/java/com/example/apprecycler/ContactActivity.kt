package com.example.apprecycler

import android.app.Activity
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.Menu
import android.view.MenuInflater
import android.view.MenuItem
import kotlinx.android.synthetic.main.activity_contact.*

class ContactActivity : AppCompatActivity() {
    var varposition = ""
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_contact)
        val name = intent.getStringExtra("name")
        val telephone = intent!!.getStringExtra("telephone")
        val position = intent!!.getStringExtra("position")
        varposition = (position!!.toString())
        etName.setText(name!!.toString())
        etTelephone.setText(telephone!!.toString())
    }

    override fun onCreateOptionsMenu(menu: Menu?): Boolean {
        var inflater : MenuInflater = menuInflater
        inflater.inflate(R.menu.contact_menu, menu)
        return true
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        saveContact()
        return super.onOptionsItemSelected(item)
    }
    private fun saveContact(){
        val name = etName.text.toString()
        val telephone = etTelephone.text.toString()

        val intent = Intent()
        intent.putExtra("keyName",name)
        intent.putExtra("keyTelephone", telephone)
        intent.putExtra("keyPosition",varposition.toString())
        setResult(Activity.RESULT_OK,intent)
        finish()

    }
}