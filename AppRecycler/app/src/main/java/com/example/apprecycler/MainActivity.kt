package com.example.apprecycler

import android.app.Activity
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.Menu
import android.view.MenuInflater
import android.view.MenuItem
import androidx.recyclerview.widget.LinearLayoutManager
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {
    val REQUEST_CODE = 1
    //Creo el array
    var contacts = ArrayList<Contact>()
    //Creo el adapter
    var contactAdapter = ContactAdapter(this,contacts)

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        loadContacts()
        initView()
    }
    fun initView(){
        rvContact.adapter = contactAdapter
        rvContact.layoutManager = LinearLayoutManager(this)
    }
    fun loadContacts(){
        contacts.add(Contact("Luis Alberto","999999999"))
        contacts.add(Contact("Luis Juan","999999999"))
        contacts.add(Contact("Luis Perez","999999999"))
        contacts.add(Contact("Luis Pepito","999999999"))
        contacts.add(Contact("Luis Suarez","999999999"))
    }
    //ctrl + o
    override fun onCreateOptionsMenu(menu: Menu?): Boolean {
        var inflater : MenuInflater = menuInflater
        inflater.inflate(R.menu.main_menu, menu)
        return true
    }

    //llama al otro activity
    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        val intent = Intent(this, ContactActivity::class.java)
        intent.putExtra("name","")
        intent.putExtra("telephone","")
        intent.putExtra("position","-1")
        startActivityForResult(intent, REQUEST_CODE)
        return super.onOptionsItemSelected(item)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if(requestCode == REQUEST_CODE){
            if(resultCode == Activity.RESULT_OK){
                val name = data!!.getStringExtra("keyName")
                val telephone = data!!.getStringExtra("keyTelephone")
                val position = data!!.getStringExtra("keyPosition")
                val contact = Contact(name.toString(), telephone.toString())
                if(position=="-1")
                    contacts.add(contact)
                else
                    contacts.set(position.toString().toInt(),contact)
                //!! es para indicar que una variable no puede ser nula
            }
        }
    }
}