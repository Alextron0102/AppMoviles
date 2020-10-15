package com.example.supercatapp.database

import android.content.Context
import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase
import com.example.supercatapp.models.Pet

@Database(entities = [Pet::class],version=1)
abstract class PetDB : RoomDatabase() {
    abstract fun getPetDAO(): PetDAO

    companion object {
        private var INSTANCE : PetDB?=null

        fun getInstance(context: Context) : PetDB {
            if(INSTANCE == null){
                INSTANCE = Room
                    .databaseBuilder(context, PetDB::class.java, "pet.db")
                    .allowMainThreadQueries()
                    .build()
            }
            return INSTANCE as PetDB
        }
    }
}