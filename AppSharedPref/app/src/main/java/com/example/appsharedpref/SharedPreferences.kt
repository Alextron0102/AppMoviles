package com.example.appsharedpref

import android.content.Context

class SharedPreferences(val context: Context) {
    //definir el nombre de mi SharedP.
    //En este caso lo vmaos a hacer a través de una variable
    private val PREFS_NAME = "sharedPreferences_name" //Le podría poner cualquier nombre, pero en este caso le pongo "sharedPreferences"
    //private val PREFS_EMAIL= "sharedPreferences_email"
    //ahora creamos el SharedP.
    private val sharedPreference = context.getSharedPreferences(
        PREFS_NAME, Context.MODE_PRIVATE
    )
    //meotodo para grabar
    fun save(keyName: String, value: String){
        val editor = sharedPreference.edit()
        editor.putString(keyName,value)
        editor.commit()
    }
    //metodo get
    fun getValueString(keyName: String):String?{
        return sharedPreference.getString(keyName,null)
    }
    //metodo para limpiar el SharedP
    fun clearSharedPreference(){
        val editor = sharedPreference.edit()
        editor.clear()
        editor.commit()
    }
}