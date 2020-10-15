package com.example.supercatapp.models

import androidx.room.Entity
import androidx.room.PrimaryKey
import com.google.gson.annotations.SerializedName
import java.io.Serializable

@Entity(tableName = "Pets")
class Pet (
       @PrimaryKey
       @SerializedName("id")
       val PetId: Int=0,
       @SerializedName("url")
       val image: String
):Serializable